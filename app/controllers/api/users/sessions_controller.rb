class Api::Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  prepend_before_filter :require_no_authentication, :only => [:create ]
  before_filter :ensure_params_exist
  respond_to :json



  def create
    #build_resource
    resource = User.authenticate(params[:user][:email],params[:user][:password])
    if resource.present?
      if resource.imei == params[:user][:imei]
        render json: {status:"success", message: "Logged in Successfully", user_id: resource.id, imei: resource.imei}
      else
        render json: {status: "failure", message: "You are logging with different devise"}

      end
    else
      render json: {status: "failure", message: "Invalid Username and Password"}

    end
    #return invalid_login_attempt unless resource

    #if resource.valid_password?(params[:user][:password])
    #  sign_in("user", resource)
    #  render :json=> {:success=>true, :auth_token=>resource.authentication_token, :login=>resource.login, :email=>resource.email}
    #  return
    #end
    #invalid_login_attempt
  end

  def destroy
    sign_out(resource_name)
  end


  protected
  def ensure_params_exist
    return unless params[:user].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end

  #def invalid_login_attempt
  #  warden.custom_failure!
  #  render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  #end



  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
