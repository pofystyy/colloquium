class CalculatorController < ApplicationController
  def add
  	raise 'ErrorHandler::InvalidBodyParams' unless BodyKeysValidator.call(params_)

    data = params_[:text]
    render json: CalculationActions::Add.call(data)
  end
end
