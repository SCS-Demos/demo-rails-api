class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :authorize_record

  # GET /users
  def index
    @users = User.page(params[:page])
    total_pages = @users.total_pages
    options = { current_page: params[:page], total_pages: total_pages }
    json_response serializer.new(@users, meta: options)
  end

  # GET /users/:id
  def show
    json_response serializer.new @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.valid?
      data = { message: I18n.t('active_record.created_success', class_name: class_name) }.merge(serializer.new(@user))
      json_response data, :created
    else
      error_response @user.errors.full_messages
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      data = { message: I18n.t('active_record.created_success', class_name: class_name) }.merge(serializer.new(@user))
      json_response data
    else
      error_response @user.errors.full_messages
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    json_response({ message: I18n.t('active_record.deleted_success', class_name: class_name) })
  end

  private

  def class_name
    User.name.titleize
  end

  def serializer
    UserSerializer
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :password, :email, :user_type)
  end

  def authorize_record
    authorize @user || User
  end
end
