module Api
  module V1
    class PagesController < ApplicationController
      http_basic_authenticate_with name: ENV['HTTP_BASE_AUTH_NAME'], 
                                   password: ENV['HTTP_BASE_AUTH_PASSWORD']
    end
  end
end
