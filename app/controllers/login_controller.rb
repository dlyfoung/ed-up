class LoginController < ApplicationController
  include LoginHelper
  # avoid infinite redirection to this page
  skip_before_action :require_login
  before_action :verify_session, except: :log_out

  # POST login/sign_in
  def sign_in
    @errors = {:full_messages => []}

    if params[:sign_in]
      login_params = params[:sign_in].permit(:login, :password)
      @user = authenticate login_params[:login], login_params[:password]

      if @user
        # create the session
        session[:user_id] = @user.id

        respond_to do |format|
          format.html { redirect_to resources_path, status: :see_other}
        end
      else
        respond_to do |format|
          format.html { render login_sign_in_path }
          format.json { render json: @errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # GET login/log_out
  def log_out
    session.delete(:user_id)
    redirect_to login_sign_in_path
  end

  # Verify if a session exists already. If so, it automatically logs it in
  def verify_session
    if session[:user_id] != nil && User.find(session[:user_id])
      redirect_to resources_path
    end
  end

end
