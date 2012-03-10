
require 'twilio-ruby'
require 'rubygems'

class UsersController < ApplicationController
  
  before_filter :correct_user, :only => [:edit, :update]
  
  
  def show
    @user = User.find(params[:id])
    @phonenumbers = @user.phonenumbers.paginate(:page => params[:page])
    @title = @user.name
  end

  def new
    @user  = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to 'home'
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @phonenumber = phonenumber.find(params[:id])
    @title = "Edit Groups"
  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => "Groups updated." }
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def send_message
    auth_token = '31b8a6c7fdbc4c1744842089cf77b027'
    account_sid = 'ACe3a9f7035cbf4d299f06c82aedcf3750'
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    @message = params[:text]
    @client.account.sms.messages.create(
      :from => '+14155992671',
      :to => '+16505213355',
      :body => 'asdf'
    )
  end
  
  def compose_message
    
  end
  
  def destroy
    @user.destroy
    redirect_to users_path, :flash => { :success => "User destroyed." }
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
