class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      flash[:success] = "Thanks for signing up! We'll contact you via email shortly."
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end
end
