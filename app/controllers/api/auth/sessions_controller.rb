class Api::Auth::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create ]
  
  # before_filter :ensure_params_exist
 
  
  def create
    respond_to do |format|
      format.html { super }
      format.json {
        ensure_params_exist
        build_resource
        resource = User.find_for_database_authentication(:email => params[:email])
        return invalid_login_attempt unless resource
     
        if resource.valid_password?(params[:password])
          render :json=> {:success=>true, :auth_token=>resource.authentication_token }
          return
        end
        invalid_login_attempt
      }
    end
  end
  
  def destroy
      respond_to do |format|
        format.html { super }
        format.json {
          # expire auth token
          @user=User.where(:authentication_token=>params[:auth_token]).first
          @user.reset_authentication_token!
        }
      end
    # sign_out(resource_name)
  end
 
  protected
    def ensure_params_exist
      return unless params[:email].blank?
      render :json=>{:success=>false, :message=>"missing email parameter"}, :status=>422
    end
   
    def invalid_login_attempt
      warden.custom_failure!
      render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
    end
end