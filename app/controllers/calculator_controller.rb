class CalculatorController < ApplicationController
  def add
    if params[:text]
      data = params[:text]
      render json: CalculationActions::Add.call(data)
    elsif
      render json: { message: 'error', status: 422 }
    end
  end
end
