class UsersController < ApplicationController
  before_action :authorize_admin, only: [:admin]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have succesfully signed up!"
      redirect_to root_path
    else
      render :new
    end
  end

  def admin
    @pending_contributor_applications = ContributorApplication.where(pending: true)
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image)
  end

  def authorize_admin
    redirect_to root_path if current_user.nil? || !current_user.admin
  end
end