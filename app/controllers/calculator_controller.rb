class CalculatorController < ApplicationController
  def add
    data = params_[:text]
    render json: CalculationActions::Add.call(data)
  end
end