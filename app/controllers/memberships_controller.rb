class MembershipsController < ApplicationController
  
  def index
    @users = current_user.dashboards.first.colaborators
  end

  def destroy
    User.destroy(params[:users_ids])
    flash[:success] = 'colaborators removed successfuly'
    redirect_to dashboard_path(current_user.dashboards.first)
  end

end
