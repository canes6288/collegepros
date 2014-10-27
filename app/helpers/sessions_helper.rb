module SessionsHelper
  def sign_in(user)
    #save a cookie on their computer
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    #update our db with their cookie info
    user.update_attribute(:remember_token, User.digest(remember_token))
    #set a current_user variable equl to user
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end



  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
  end
end
