# class CalculatorController < ApplicationController
# 	def index
# 	end
# 	
#   def add
#   	raise 'ErrorHandler::InvalidBodyParams' unless BodyKeysValidator.call(params_)
#
#     data = params_[:text]
#     render json: CalculationActions::Add.call(data)
#   end
# end
