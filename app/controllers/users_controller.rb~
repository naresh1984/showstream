class UsersController < ApplicationController
  # GET /users
  # GET /users.json
 def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
end

def login
    require 'digest'
    @user = User.find(:all, :conditions => ["email='#{params[:email]}' AND password='#{Digest::SHA2.hexdigest(params[:password])}'"])   

    if @user.count>0
    #raise @user.inspect
    respond_to do |format|
      #format.html # show.html.erb
      @format_users={}
      @format_users['result']=@user
      format.json { render json: @format_users }
    end
   else
   respond_to do |format|
      #format.html # show.html.erb      
      @format_users={}
      @format_users['error']='Invalid email / password'
      format.json { render json: @format_users }
    end
   end
  end


  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    #raise @user.inspect
    respond_to do |format|
      #format.html # show.html.erb
      @format_users={}
      @format_users['result']=@user
      format.json { render json: @format_users }
    end
  end


 def create_user
    require 'digest'
    @user = User.new 
    @user.first_name =params[:first_name]
    @user.last_name =params[:last_name]
    @user.username =params[:username]
    @user.email =params[:email]
    @user.zip_code =params[:zip_code]
    @user.password =params[:password]
    @user.profile_image =params[:profile_image]
    user_email=User.find(:all, :conditions => ["email='#{@user.email}' OR username='#{@user.username}'"])    
    respond_to do |format|
      if user_email.count>0 && params[:social].present?
      @format_users={}
      @format_users['result']=user_email
      format.json { render json: @format_users }
      elsif  params[:social].present? && user_email.count==0 ?  @user.save(:validate => false) : @user.save
        @user.errors['success']="User was successfully created."
        @format_users={}
        @format_users['result']=@user.errors 
        format.json { render json: @format_users, status: :created, location: @user }     
      else  
       @format_users={}
       @format_users['errors']=@user.errors       
       format.json { render json: @format_users, status: :created, location: @user }
      end
    end
 end

 def update_user
    @user = User.find(params[:id])
    @user.first_name =params[:first_name]
    @user.last_name =params[:last_name]
    @user.username =params[:username]
    @user.email =params[:email]
    @user.zip_code =params[:zip_code]
     respond_to do |format|
      if @user.update_attributes(params[:user])       
        @user.errors['success']="User was successfully updated."
        @format_users={}
        @format_users['result']=@user.errors 
        format.json { render json: @format_users}
      else
        @format_users={}
        @format_users['errors']=@user.errors
        format.json { render json: @format_users, status: :unprocessable_entity }
      end
    end
 end



  # DELETE /users/delete_user/1
  # DELETE /users/delete_user/1.json
  def delete_user
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      @user.errors['success']="User was successfully deleted."
      #format.html { redirect_to users_url }
      format.json { render json: @user.errors }
    end
  end



end
