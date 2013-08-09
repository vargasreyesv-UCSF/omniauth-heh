require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Heh < OmniAuth::Strategies::OAuth2

      option :name, "heh"

      option :client_options, {
        :site          => 'http://localhost:3000',
        :request_token_path => '/oauth/request_token',
        :access_token_path  => '/oauth/access_token',
        :authorize_path     => '/oauth/authorize'
      }

      uid { raw_info['user_id'] }

      credentials do
        hash = {'token' => access_token.token}
        hash
      end
      
    end
  end
end