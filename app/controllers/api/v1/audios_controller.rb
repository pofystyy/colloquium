module Api
  module V1
    class AudiosController < ApplicationController
      def recognize
        audio = params[:audio].path
        transcript = Speech.recognize(audio)

        render json: { success: true, expression: transcript }, status: :ok
      end
    end
  end
end

