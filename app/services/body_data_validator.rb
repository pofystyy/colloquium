# require_relative 'application_service'

# module Calculator
  class BodyDataValidator < ApplicationService
    def initialize(data)
      @data = data
    end

    def call
      data_is_valid?
    end

    private

    def data_is_valid?
      !@data.find { |i| false if Float(i) rescue true }
    end
  end
# end
