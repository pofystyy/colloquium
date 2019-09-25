# require_relative '../../controllers/concerns/error_handler'
# require_relative '../application_service'
# require 'byebug'

module CalculationActions
  class Add < ApplicationService
    def initialize(data)
      @data = data
    end

    def call
      request = @data.split
      response = sum_for(request) if BodyDataValidator.call(request)
      raise 'InvalidBodyParams' unless response
      response.to_json
    end

    private

    def sum_for(request)
      request.map(&:to_f).inject(0) {|sum,x| sum + x }
    end
  end
end
