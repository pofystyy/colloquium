module Api
  module V1
    class CalculatorController < ApplicationController
      def index
       create
      end
      
      def create
        raise 'ErrorHandler::InvalidBodyParams' unless BodyKeysValidator.call(params_)

        data = params_[:text]
        render json: CalculationActions::Add.call(data)
      end
    end
  end
end
