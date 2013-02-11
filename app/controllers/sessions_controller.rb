class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_url
    else
      redirect_to signin_url
    end
  end

  def destroy
    sign_out
    redirect_to :back
  end
  
end
