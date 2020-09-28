class SessionsController < ApplicationController
  
  def new

    render "new"

  end

  def create
    
    if !self.logged_in?
      if !params[:name].to_s.strip.empty?
        session[:name] = params[:name]
        redirect_to root_path
      else
        redirect_to login_path
      end
    else 
      redirect_to login_path
    end

  end

  def logged_in?

    return session[:name] != nil 

  end

  def destroy

    session.delete(:name)
    redirect_to root_path

  end

end
