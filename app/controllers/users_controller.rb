class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def show
  	 @user = User.find(params[:id])
     @books = @user.books.page(params[:page]).reverse_order
     @book = Book.new
  end
  def edit
     @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
    @book = Book.new
  end

private

  def correct_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to current_user
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :postcode, :prefecture_code, :address_city, :address_street)
  end
end