class Api::Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  skip_before_filter :verify_authenticity_token, :only => :create
  clear_respond_to
  respond_to :json

  def create
    #begin

      @user = User.new(user_params)

      if @user.save
        render json: {
            status: "successs", status_code: 200, message: "User registered successfully.",
            user_id: @user.id, IMEI: @user.imei,
            auth_token: @user.authentication_token
        }
      else
        render json:{ status: "failure", code: 201, message:@user.errors.to_json}
      end
      #sign_in @user
      #json = ::UserSerializer.new(current_user).as_json
      #json[:user].merge(token: current_user.authentication_token)

    #rescue => e
    #
    #end
    #

  end



  private

  def user_params
    params.require(:user).permit(:email, :password,:mobile,:name,:imei)
  end
    # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
