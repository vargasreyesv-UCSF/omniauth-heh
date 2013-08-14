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
    end
  end
end