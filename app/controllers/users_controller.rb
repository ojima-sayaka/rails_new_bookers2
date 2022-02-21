class UsersController < ApplicationController
  def top
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    
  end

  def new

  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


 private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end





end
