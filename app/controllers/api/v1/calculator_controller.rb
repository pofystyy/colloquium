module Api
  module V1
    class CalculatorController < Api::V1::ApplicationController
      def add
        if params[:text]
          result = CalculationActions::Add.call(params[:text])
          render json: { success: true, result: result }, status: :ok
        elsif
          render json: { message: 'error', status: 422 }
        end
      end
    end
  end
end
