class UsersController < ApplicationController  
  def new
    if session[:user_id]
      redirect_to '/listings', :notice => "Alreadly logged in"
    else 
    @user = User.new
    end  
  end  
  def show
    @profile=User.find(params[:id])
  
  end
  def create  
    @user = User.new(params[:user])  
    if @user.save  
      redirect_to root_url, :notice => "Signed up!"  
    else  
      render "new"  
    end  
  end  
end  