class SessionsController < ApplicationController
  def new

  end

  def create
    #actually better to put some of this in the model
    # user = User.find_by(email: params[:email])
    # if user && user.authenticate(params[:password])
    # the authenticate below is not the same as the one above.  Above is provided by rails through "has_secure_password". Below we must define this one ourselves.  This is confusing, but one is a class method and the other is the instance method provided by "has_secure_password"
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to user
    else
      # .now will display the flash immediately and not wait for a new page load
      flash.now[:alert] = "Invalid email/password combination."
      render :new
    end
  end
end
