# class AudiosController < ApplicationController
# 	def index		
# 	end
#
# 	def recognize
# 		audio = params[:audio].path
# 		transcript = Speech.recognize(audio)
#
# 		render json: { success: true, expression: transcript }, status: :ok
# 	end
# end	
