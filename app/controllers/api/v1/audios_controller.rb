require "base64"
module Api
  module V1
    class AudiosController < ApplicationController
      def recognize
        audio = Base64.decode64(params[:audio])
        transcript = Speech.api_recognize(audio)

        render json: { success: true, transcription: transcript }, status: :ok
      end
    end
  end
end
