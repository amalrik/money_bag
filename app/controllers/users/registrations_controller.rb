class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]
  before_action :can_add_new_users?, only: :create

  def new
    super
  end

  def create
    dashboard = user_signed_in? ? current_user.dashboards.first : Dashboard.new
    user = User.new params.require(:user).permit(:name, :email, :password, :password_confirmation)
    user.memberships.build(dashboard: dashboard, owner: !user_signed_in?)
    if user.save
      sign_in(user) unless user_signed_in?
      flash[:success] = 'user created successfuly'
      redirect_to after_sign_up_path_for(user)
    else
      render :new
    end
  end

  def update
    super
  end

  protected

  def after_sign_up_path_for(resource)
    dashboard_path(current_user.dashboards.first)
  end

  private
  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def can_add_new_users?
    can = user_signed_in? ? current_user.admin? : true
    redirect_to root_path unless can
  end
end