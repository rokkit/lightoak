class Api::Auth::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [:create ]
  
  def create
    respond_to do |format|
      format.html {
        super
        self.resource
        file_name = "#{Rails.root}/public/img/uploads/#{params[:avatar_name]}.jpg"
        if File.exist? file_name 
          self.resource.avatar = File.new(file_name)
          self.resource.avatar.save
          self.resource.save
        end
      }
      format.json {
        user = User.new(params[:user])
        if user.save
          render :json=> user.as_json(:auth_token=>user.authentication_token), :status=>201
          return
        else
          warden.custom_failure!
          render :json=> user.errors, :status=>422
        end
      }
    end
  end
end