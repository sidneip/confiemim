class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @comment = @user.comments.new
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      require 'byebug'
      byebug
      accessible = [ :name, :email, :password, :password_confirmation, coments_attributes: [:content]] # extend with your own params
      params.require(:user).permit(accessible)
    end

end
