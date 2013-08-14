require 'omniauth-oauth2'
require 'oauth'
require 'multi_json'
module OmniAuth
  module Strategies
    class Heh < OAuth2
      option :name, "heh"
 
      option :client_options, {
        :site          => 'http://localhost:3000',
        :request_token_path => '/oauth/request_token',
        :access_token_path  => '/oauth/access_token',
        :authorize_path     => '/oauth/authorize'
      }

      protected
      
      # customize this to return data on the user who has just logged in.
      def user_data
        @data ||= MultiJson.decode(@access_token.get('/users/1.json'))['user']
      end

      def auth_hash
        OmniAuth::Utils.deep_merge(super, {
          'uid' => user_data['id'],
          'extra' => {'user_hash' => user_data}
        })
      end
  
    end
  end
end