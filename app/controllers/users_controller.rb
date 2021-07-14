class UsersController < ApplicationController
  def index
     @book = Book.new
     @user = current_user
     @users = User.all
     #@users = Book.find(user_id)
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @userbook = @user.books.page(params[:page]).reverse_order
  end
  
  def create
  end
  
  def edit
    @user = User.find(params[:id])
    unless 
    @user. == current_user
     redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id) 
    else
      render 'edit'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
  
end
