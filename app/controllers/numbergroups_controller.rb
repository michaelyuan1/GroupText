class NumbergroupsController < ApplicationController
  
  def create
    @numbergroup = current_user.numbergroups.build(params[:numbergroup])
    if @numbergroup.save
      redirect_to root_path, :flash => {:success => "numbergroup created!"}
    else
      render 'pages/home'
    end
  end
  
  def edit
    @numbergroup = Numbergroup.find(params[:id])
    @phonenumber = Phonenumber.new
    @title= "asdf"
  end
  
  def update
    @numbergroup = Numbergroup.find(params[:id])
    
    if @numbergroup.update_attributes(params[:numbergroup])
       redirect_to edit_numbergroup_path(params[:id],current_user), :flash => { :success => "Updated"}
    else
      redirect_to edit_numbergroup_path(params[:id],current_user), :flash => {:error => "problem"}
    end
    
    
   # if(@phonenumber.save)
   #   redirect_to edit_numbergroup_path(params[:id],current_user), :flash => { :success => "Updated"}
   # else
    #  redirect_to edit_numbergroup_path(params[:id],current_user),:flash => {:error => "problem"}
   # end
  
  end
  
  def addnumber
    @phonenumber = Numbergroup.find(params[:id]).phonenumbers.build(params[:phonenumber])
    
    if @phonuenumber.save
       redirect_to edit_numbergroup_path(params[:id],current_user), :flash => { :success => "Updated"}
    else
      redirect_to edit_numbergroup_path(params[:id],current_user), :flash => {:error => "problem"}
    end
    
  end
  
  def show
    @numbergroup = Numbergroup.find(params[:id])
    @title= "asdf"
  end

  
  def destroy
    Numbergroup.find(params[:id]).destroy
    redirect_to root_path, :flash => {:success => "numbergroup destroyed!"}
  end
end
