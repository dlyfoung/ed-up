require 'bcrypt'

module LoginHelper
  include BCrypt

  # authenticate user against database
  def authenticate login, password
    p @user = User.find_by(login: login)

    if @user
      # BCrypt overrides == operator to compare hashed passwords (including salt)
      if !(Password.new(@user.password) == password)
        @errors[:full_messages].push "Wrong password"
        @user = nil
      end
    else
      @errors[:full_messages].push "#{login} user does not exist"
    end
    @user
  end

  # Verify the user is logged in to the implication. Otherwise, it redirects it to the login page
  def require_login
    if session[:user_id] == nil || !User.find(session[:user_id])
      redirect_to login_sign_in_path
    end
  end

end
