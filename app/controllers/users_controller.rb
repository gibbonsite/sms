class UsersController < ApplicationController
  def index
    @users = User.all
    @roles = Role.all
  end

  def new
    @user = User.new
    @user.role = Role.admin
    @unused_students = Student.all

    render :partial => "form", :locals => { :url => users_path, :method => "POST" }
  end
  
  def create
    @user = (params[:user][:role_id].to_i == Role.teacher.id ? Teacher : User).create params[:user]
    @unused_students = Student.all
    render :action => "create.rjs", :status => @user.valid? ? 200 : 403
  end

  def edit
    @user = User.find params[:id]
    @unused_students = Student.where(["parent1_id is null or parent1_id <> ?", @user.id])

    render :partial => "form", :locals => { :url => user_path(@user), :method => "PUT" }
  end
  
  def update
    @user = User.find params[:id]
    @user.update_attributes params[:user]
    @unused_students = Student.where(["parent1_id is null or parent1_id <> ?", @user.id])
    
    render :action => "update.rjs", :status => @user.valid? ? 200 : 403
  end
end