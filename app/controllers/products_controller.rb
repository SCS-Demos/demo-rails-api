class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]
  before_action :authorize_record

  # GET /products
  def index
    @products = Product.page(params[:page])
    @products = @products.search_by_category(params[:category_id]) if params[:category_id]
    total_pages = @products.total_pages
    options = { current_page: params[:page], total_pages: total_pages }
    json_response serializer.new(@products, meta: options)
  end

  # GET /products/:id
  def show
    json_response serializer.new(@product, { include: [:category] })
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      data = { message: I18n.t('active_record.created_success', class_name: class_name) }.merge(serializer.new(@product))
      json_response data, :created
    else
      error_response @product.errors.full_messages
    end
  end

  # PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      data = { message: I18n.t('active_record.created_success', class_name: class_name) }.merge(serializer.new(@product))
      json_response data
    else
      error_response @product.errors.full_messages
    end
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
    json_response({ message: I18n.t('active_record.deleted_success', class_name: class_name) })
  end

  private

  def class_name
    Product.name.titleize
  end

  def serializer
    ProductSerializer
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name)
  end

  def authorize_record
    authorize @product || Product
  end
end
