class LineController < ApplicationController
	def show
		line = Line.find(params[:line_number])
	end
end
