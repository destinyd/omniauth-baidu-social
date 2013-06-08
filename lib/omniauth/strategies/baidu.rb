require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Baidu < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site           => "https://openapi.baidu.com",
        :authorize_url  => "/social/oauth/2.0/authorize",
        :token_url      => "/social/oauth/2.0/token"
      }

      option :token_params, {
        :parse          => :json,
      }

      #option :auth_token_params, {
      #}

      option :provider_ignores_state, true

      uid do
        raw_info['social_uid']
      end

      info do
        {
          :social_uid   => raw_info['social_uid'],
          :name         => raw_info['username'],
          :media_type   => raw_info['media_type'],
          :media_uid   => raw_info['media_uid'],
          :is_verified     => raw_info['is_verified'],

          #:birthday     => raw_info['birthday'],
          #:tinyurl     => raw_info['tinyurl'],
          #:headurl     => raw_info['headurl'],
          #:mainurl     => raw_info['mainurl'],
          #:hometown_location     => raw_info['hometown_location'],
          #:work_history     => raw_info['work_history'],
          #:university_history     => raw_info['university_history'],
          #:hs_history     => raw_info['hs_history'],
          #:province     => raw_info['province'],
          #:city     => raw_info['city'],
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        #access_token.options[:param_name] = 'access_token'
        @raw_info ||= access_token.get("/social/api/2.0/user/info").parsed
      end

      protected

    end
  end
end

OmniAuth.config.add_camelization "baidu", "Baidu"
