class Api::Auth::RegistrationsController < Devise::RegistrationsController
  
  def create
    respond_to do |format|
      format.html {super}
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