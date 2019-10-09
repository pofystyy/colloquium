# require_relative 'application_service'

# module Calculator
  class BodyKeysValidator < ApplicationService
    def initialize(data)
      # byebug
      @text_key = data.keys.first
    end

    def call
      valid_text_key?
    end

    private

    def valid_text_key?
      @text_key == :text
    end
  end
# end
