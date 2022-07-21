class UsersController < ApplicationController
  
  
  def index
    @users = User.all
    @user= current_user
    @book= Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book= Book.new
    
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      # redirect_to edit_user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
