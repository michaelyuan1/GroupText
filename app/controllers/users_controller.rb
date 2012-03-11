
require 'twilio-ruby'
require 'rubygems'

class UsersController < ApplicationController
  
  before_filter :correct_user, :only => [:edit, :update, :destroy]

  def new
    if signed_in?
      redirect_to root_path
    else
      @user  = User.new
      @title = "Sign up"
    end
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
  
  def send_message
    auth_token = '31b8a6c7fdbc4c1744842089cf77b027'
    account_sid = 'ACe3a9f7035cbf4d299f06c82aedcf3750'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @numbers=current_user.phonenumbers.all
    @message = params[:text]
   
    @numbers.each do |number|
      begin
      @client.account.sms.messages.create(
        :from => '415-599-2671',
        :to => number.number,
        :body => @message
      )
      rescue  
      end
    end
    redirect_to root_path
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
