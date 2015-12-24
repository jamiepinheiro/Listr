class ListsController < ApplicationController
	def index
			@lists = List.where(user_email: current_user.email)
	end

	def new
		@list = List.new
	end

	def create
		@list = List.new(list_params)
		@list.user_email = current_user.email
		if @list.title != ""
			if @list.save
				redirect_to '/lists'
				flash[:success] = 'New List Created'
			else
				render 'new'
			end
		else
			redirect_to '/lists/new'
			flash[:success] = 'Please add a title'
		end
	end

	def show
		@list = List.find(params[:id])
	end

	def destroy
		@list = List.find(params[:id])
		@list.delete
		redirect_to '/lists'
		flash[:success] = 'deleted'
	end

	def edit
		@list = List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
		if @list.update_attributes(list_params)
			flash[:success] = 'Updated'
			redirect_to '/lists'
    else
      render 'edit'
    end
  end

	private
	def list_params
		params.require(:list).permit(:title, :content, :user_email)
	end
end
