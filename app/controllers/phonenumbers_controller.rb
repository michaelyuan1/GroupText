class PhonenumbersController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
  def create
    @phonenumber = current_user.phonenumbers.build(params[:phonenumber])
    if @phonenumber.save
      redirect_to numbergroup_path(Numbergroup.find(params[:id])), :flash => { :success => "phonenumber added created!" }
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_path, :flash => { :success => "Micropost deleted!" }
  end
  
  private
  
    def authorized_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
end