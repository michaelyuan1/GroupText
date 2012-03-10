class PhonenumbersController < ApplicationController
  before_filter :correct_user
  
  def create
    @phonenumber = current_user.phonenumbers.build(params[:phonenumber])
    if @phonenumber.save
      redirect_to root_path, :flash => {:success => "phonnumber created!"}
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @phonenumber = Phonenumber.find(params[:id])
    @phonenumber.destroy
    redirect_to root_path, :flash => { :success => "Deleted!" }
  end
  
  private
     def correct_user
        @user = current_user
        redirect_to(root_path) unless current_user?(@user)
      end
end