class ContributorApplicationsController < ApplicationController
  def new
    redirect_to login_path, alert: "You already have a pending application!" if pending_apps?
    @user = current_user
    @contributor_application = ContributorApplication.new
  end

  def create 
    @contributor_application = ContributorApplication.new(contributor_application_params)
    @contributor_application.user = current_user
    @contributor_application.pending = true
    
    if @contributor_application.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy

  end

private

  def contributor_application_params
    params.require(:contributor_application).permit(:content)
  end

  def pending_apps?
    users_apps = ContributorApplication.where(user: current_user)
    users_apps.each do |users_app|
      return true if users_app.pending
    end
    return false
  end
end