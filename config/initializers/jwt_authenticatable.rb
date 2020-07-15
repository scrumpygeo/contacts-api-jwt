module Devise 
  module Strategies 
    class JWTAuthenticatable < Base
      def authenticate!
        token = get_token
        return fail(:invalid) unless token.present?

        payload = get_payload
        return fail(:invalid) if payload == :expired

        resource = mapping.to.find(payload['user_id'])
        # now test resource not invalid or nil 
        return fail(:not_found_in_database) unless resource

        success! resource  # ie found user after passing above 3 testing walls
      end

      private 

      def get_payload 
        JWT.decode(get_token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }).first
      rescue JWT::ExpiredSignature
        :expired
      end

      def get_token
        auth_header.present? && auth_header.split(' ').last 
      end

      def auth_header 
        # check token in header before getting it with get_token
        request.headers['Authorization']
      end

    end
  end
end