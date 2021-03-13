class ApplicationController < ActionController::Base
    before_action :basic_auth
    before_action :configure_permitted_parameters, if: :devise_controller?


    def basic_auth
        authenticate_or_request_with_http_basic do |username, password|
          username == 'admin' && password == '2222'
        end
      end

      private
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(
          :sign_up, keys: [:nickname, :name_kanji_namae,:name_kanji_myoji, :name_katakana_namae,:name_katakana_myoji, :birth_day]
          )

      end
end
