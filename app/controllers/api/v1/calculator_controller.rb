module Api
  module V1
    class CalculatorController < Api::V1::PagesController
      def add
        if params[:text]
          result = CalculationActions::Add.call(params[:text])
          render json: { success: true, result: result }, status: :ok
        elsif
          head 422
        end
      end
    end
  end
end
