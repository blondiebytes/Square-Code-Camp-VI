# Helpful Gems:
# Paperclip: Attaching files, resizing images
# ActiveRecord Query Syntax in Rails guides
# Asset Pipeline Rails guide --> CSS, Javascript integration

class PuppiesController < ApplicationController
	respond_to :html
	#before_action :find_puppy except index, create, new 

	def index
		#instance var so we have access in the view
		@puppies = Puppy.all
		respond_with @puppies
	end

	def show
		@puppy = Puppy.find(params[:id])
		respond_with @puppy
	end

	def new
		@puppy = Puppy.new
		respond_with @puppy
	end

	def create
		@puppy = Puppy.create(puppy_params)
		respond_with @puppy
	end

	def edit
		@puppy = Puppy.find(params[:id])
		respond_with @puppy
	end

	def update
		@puppy = Puppy.find(params[:id])
		@puppy.update(puppy_params)
		respond_with @puppy
	end

	def destory
		@puppy = Puppy.find(params[:id])
		@puppy.destory
		respond_with @puppy
	end

	private

	def puppy_params
		params.require(:puppy).permit(:owner, :description, :color)
	end

	#def find_puppy
	#	@puppy = Puppy.find(params[:id])
	#end


end
