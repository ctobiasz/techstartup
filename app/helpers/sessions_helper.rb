module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if current_user.nil?
      redirect_to '/login'
    end
      if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end


  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
