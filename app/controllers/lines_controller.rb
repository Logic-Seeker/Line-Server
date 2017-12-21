class LinesController < ApplicationController
	def show
		@lineContent = LineNumber.find(params[:line_index])
    render json: @lineContent, status: 200
  rescue ActiveRecord::RecordNotFound => e
    render json: {
      error: e.to_s
    }, status: 413
	end
end
