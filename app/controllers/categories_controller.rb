class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]
  before_action :authorize_record

  # GET /categories
  def index
    @categories = Category.page(params[:page])
    total_pages = @categories.total_pages
    options = { current_page: params[:page], total_pages: total_pages }
    json_response serializer.new(@categories, meta: options)
  end

  # GET /categories/:id
  def show
    json_response serializer.new @category
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      data = { message: I18n.t('active_record.created_success', class_name: class_name) }.merge(serializer.new(@category))
      json_response data, :created
    else
      error_response @category.errors.full_messages
    end
  end

  # PATCH/PUT /categories/:id
  def update
    if @category.update(category_params)
      data = { message: I18n.t('active_record.created_success', class_name: class_name) }.merge(serializer.new(@category))
      json_response data
    else
      error_response @category.errors.full_messages
    end
  end

  # DELETE /categories/:id
  def destroy
    @category.destroy
    json_response({ message: I18n.t('active_record.deleted_success', class_name: class_name) })
  end

  private

  def class_name
    Category.name.titleize
  end

  def serializer
    CategorySerializer
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end

  def authorize_record
    authorize @category || Category
  end
end
