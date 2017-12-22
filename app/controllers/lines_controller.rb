class LinesController < ApplicationController
	#option 1
	# def show
	# 	@lineContent = LineNumber.find(params[:line_index])
 #    render json: @lineContent, status: 200
 #  rescue ActiveRecord::RecordNotFound => e
 #    render json: {
 #      error: e.to_s
 #    }, status: 413
	# end



#option 2
	def show
		@lineContent = $redis.get(params[:line_index])
		if @lineContent
    	render json: {
    		text: @lineContent
    	}, status: 200
  	else 
    	render json: {
      	error: "Out of bound"
    	}, status: 413
		end
	end

end
