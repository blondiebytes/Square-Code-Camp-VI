class SuggestionsController < ApplicationController
	respond_to :html

	def create
		@puppy = Puppy.find(params[:puppy_id])
		@suggestion = @puppy.suggestions.create(suggestion_params)

		respond_with @suggestion, location: puppy_url(@puppy)
	end

	private

	def suggestion_params
		params.require(:suggestion).permit(:name)
	end



end
