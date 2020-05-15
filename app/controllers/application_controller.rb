class ApplicationController < ActionController::API
    def render_resource(resource)
        if resource.errors.empty?
          render json: resource
        else
          validation_error(resource)
        end
      end

      def validation_error(resource)
        render json: {
          errors: [
            {
              status: '400',
              title: 'Bad Request',
              detail: resource.errors,
              code: '100'
            }
          ]
        }, status: :bad_request
      end

      def authorization_error(message)
        render json: {
          errors: [
            {
              status: '401',
              title: 'Unauthorized',
              detail: message,
              code: '100'
            }
          ]
        }, status: :unauthorized
      end

      def success_response(message)
        render json: {
          success: [
            {
              status: '200',
              title: 'Success',
              detail: message,
              code: '100'
            }
          ]
        }, status: :ok
      end
end
