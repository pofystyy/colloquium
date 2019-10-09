class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token

  def params_
    parse_json(request.body.read).map { |k, v| [k.to_sym, v] }.to_h.tap { request.body.rewind }
  end

  private

  def parse_json(string)
    JSON.parse(string) rescue {}
  end
end
