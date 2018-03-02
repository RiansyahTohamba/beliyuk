class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
  end
  def after_sign_in_path_for(resource)
    # begin
    # rescue Exception => e
    #   puts "****************************************"
    #   puts e.message
    # end
    if resource.class == AdminUser
      admin_dashboard_path
    elsif resource.class  == User
      customers_dashboard_path
    end
  end
end
