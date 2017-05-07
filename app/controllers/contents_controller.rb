class ContentsController < ApplicationController
before_filter :load_archive

	def new
		@contents = @archive.contents.new
	end

	def create
		@contents = @archive.contents.create(content_create_params)
		if @contents.save
			redirect_to archive_path(@archive), notice: 'Content successfully created.'
		else
			redirect_to archive_path(@archive), notice: 'Something went wrong with your submission.'
		end
	end

	def index
		@contents = @archive.contents
	end

	def update
	end

	def show
		@content = @archive.contents.find(name: content_params)
	end

	def delete
	end

	private
	def content_create_params
		params.require(:content).permit(:title, :text, :link)
	end

	def content_params
		params.permit(:id)
	end

	def load_archive
		@archive = Archive.find(params[:archive_id])
	end

end
