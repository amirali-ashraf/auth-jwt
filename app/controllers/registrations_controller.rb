class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
        puts sign_up_params
        build_resource(sign_up_params)

        resource.save
        render_resource(resource)
    end

    private

    # devise_parameter_sanitizer.permit(:login) do |user|
    #     user.permit(:email, :password, :password_confirmation)
    # end

    # def sign_up_params
    #     params.permit(:email, :password)
    # end
end