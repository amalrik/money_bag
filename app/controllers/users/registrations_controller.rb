class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    user = User.new params.require(:user).permit(:name, :email, :password, :password_confirmation)
    user.build_dashboard
    if user.save && sign_in(user)
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
    dashboard_path(current_user.dashboard)
  end

  private
  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end