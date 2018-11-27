module ApplicationHelper
  # # this was only available in the views so it is getting moved out to the application controller instead. Then using "helper_method" in the controller, we'll make accessible to the views as well.
  # def current_user
  #   # "if" portion is referred to as a statement modifier
  #   User.find(session[:user_id]) if session[:user_id]
  # end
end
