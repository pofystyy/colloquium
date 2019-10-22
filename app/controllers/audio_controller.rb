class AudioController < ApplicationController
  def recognize
    if params[:audio]
      audio = params[:audio].path
      transcript = Speech.recognize(audio)

      render json: { success: true, expression: transcript }, status: :ok
    elsif
      render json: { message: 'error', status: 422 }
    end
  end
end
