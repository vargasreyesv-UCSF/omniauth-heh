require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Heh < OmniAuth::Strategies::OAuth2

      option :name, "heh"

      option :client_options, {
        :site          => 'https://api.ihealthlabs:8443',
        :authorize_url => '/api/OAuthv2/userauthorization.ashx'
        :token_url  => '/api/OAuthv2/userauthorization.ashx',
      }

      uid { raw_info['id'] }

      credentials do
        hash = {'token' => access_token.token}
        hash.merge!('refresh_token' => access_token.refresh_token) if access_token.refresh_token
        hash
      end
      
    end
  end
end