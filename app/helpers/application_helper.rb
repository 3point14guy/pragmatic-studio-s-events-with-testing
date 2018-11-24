module ApplicationHelper
  def current_user
    # "if" portion is referred to as a statement modifier
    User.find(session[:user_id]) if session[:user_id]
  end
end
