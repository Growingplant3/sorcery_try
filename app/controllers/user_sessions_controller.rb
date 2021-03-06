class UserSessionsController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = login(params[:email], params[:password])
  
      if @user
        redirect_back_or_to(:users, notice: 'Login successful')
      else
        flash.now[:alert] = 'Login failed'
        render :new
      end
    end
  
    def destroy
      logout
      redirect_to(:users, notice: 'Logged out!')
    end
  end