class ArchivesController < ApplicationController

	def new
		@archive = Archive.new
	end

	def create
		@archive = Archive.create(archive_create_params)
		if @archive.save
			redirect_to @archive
		else
			render "new", notice: "You already have an archive with that name"
		end
	end

	def index
		@archives = Archive.where(user_id: current_user.id)
	end

	def show
		@archive = Archive.find(archive_look_up_params[:id])
		if(current_user.id == @archive.user_id)
			@contents = @archive.contents
			# creating content within the archive show page
			@content = @archive.contents.new
		else
			@archive = nil
		end

	end

	def destroy
			@archive = Archive.find(archive_destroy_params[:id])
			if (current_user.id == @archive.user_id)
				@archive.destroy
				redirect_to archives_path, notice: "Archive and contents destroyed"
			end
	end

	def update
		@archive = Archive.find(archive_look_up_params[:id])
		if(current_user.id == @archive.user_id)
			if @archive.update(archive_create_params)
				redirect_to(@archive)
			else
				redirect_to archive_path(@archive.id), notice: "Something went wrong, your changes were not saved"
			end
		end
	end

	private

	def archive_look_up_params
		params.permit(:id)
	end

	def archive_destroy_params
		params.permit(:id, :_method, :authenticity_token)
	end

	# Also using this for updating
	def archive_create_params
		params.require(:archive).permit(:name, :description).merge(user_id: current_user.id)
	end

end
