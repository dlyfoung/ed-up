require 'bcrypt'

class LoginController < ApplicationController
  include BCrypt

  # POST login/sign_in
  def sign_in
    @errors = {:full_messages => []}
    if params[:sign_in]
      login_params = params[:sign_in].permit(:login, :password)

      if authenticate? login_params[:login], login_params[:password]
        respond_to do |format|
          format.html { redirect_to resources_path, status: :see_other}
          # @TODO: session!
        end
      else
        respond_to do |format|
          format.html { render login_sign_in_path }
          format.json { render json: @errors, status: :unprocessable_entity }
        end
      end
    end
  end

  protected
  # authenticate user against database
  def authenticate? login, password
    @user = User.find_by(login: login)
    if (@user)

      # BCrypt overrides == operator to compare hashed passwords (including salt)
      if Password.new(@user.password) == password
        true
      else
        @errors[:full_messages].push "Wrong password"
        false
      end
    else
      @errors[:full_messages].push "#{login} user does not exist"
      false
    end
  end

end
