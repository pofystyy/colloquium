module Api
  module V1
    class CalculatorController < ApplicationController
      def add
        data = params[:text]
        result = CalculationActions::Add.call(data)
        render json: { success: true, result: result }, status: :ok
      end
    end
  end
end
