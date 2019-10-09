class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
  http_basic_authenticate_with name: ENV['HTTP_BASE_AUTH_NAME'], 
                               password: ENV['HTTP_BASE_AUTH_PASSWORD']

  def params_
    parse_json(request.body.read).map { |k, v| [k.to_sym, v] }.to_h.tap { request.body.rewind }
  end

  private

  def parse_json(string)
    JSON.parse(string) rescue {}
  end
end
