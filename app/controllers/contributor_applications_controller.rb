class ContributorApplicationsController < ApplicationController
  def new
    redirect_to root_path if pending_apps? || current_user.contributor
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

  def update
    @contributor_application = ContributorApplication.find(params[:id])
    
    @contributor_application.user.update_attributes(contributor: true) if params[:approved] == "yes"
    @contributor_application.update_attributes(pending: false)
    redirect_to admin_path
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