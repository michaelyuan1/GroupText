class PagesController < ApplicationController

  def home
    @title = "Home"
    if signed_in?
      @numbergroup=Numbergroup.new
      @numbergroup_items = Numbergroup.where("user_id = ?",current_user.id).paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end
