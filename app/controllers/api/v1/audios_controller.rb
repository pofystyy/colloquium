require "base64"
module Api
  module V1
    class AudiosController < Api::V1::PagesController
      def recognize
        if params[:file]
          file = Base64.decode64(params[:file])
          transcript = Speech.api_recognize(file)
          render json: { success: true, transcript: transcript }, status: :ok
        elsif
          head 422
        end
      end
    end
  end
end
