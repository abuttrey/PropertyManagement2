class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |ex|
    flash[:error] = "Access Denied!"
    redirect_to root_url  
  end
  
  rescue_from ActiveRecord::RecordNotFound do |ex|
   flash[:error] = "Some Error!"
   redirect_to root_url  
  end
  
 
   
   
    
  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

end
