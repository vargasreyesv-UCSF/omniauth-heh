require 'omniauth-oauth2'
require 'omniauth/oauth'
require 'multi_json'
module OmniAuth
  module Strategies
    class Heh < OAuth2
      def initialize(app, client_id = nil, client_secret = nil, options = {}, &block)
        client_options = {
          :site => 'http://localhost:3000',
          :request_token_path => '/oauth/request_token',
          :authorize_path => '/oauth/authorize',
          :access_token_path => '/oauth/access_token'
        }

        super(app, :active, client_id, client_secret, client_options, options, &block)
      end

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