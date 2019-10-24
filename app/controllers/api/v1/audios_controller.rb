require "base64"
module Api
  module V1
    class AudiosController < Api::V1::ApplicationController
      def recognize
        if params[:text]
          audio = Base64.decode64(params[:audio])
          transcript = Speech.api_recognize(audio)
          render json: { success: true, transcript: transcript }, status: :ok
        elsif
          render json: { message: 'error', status: 422 }
        end
      end
    end
  end
end
