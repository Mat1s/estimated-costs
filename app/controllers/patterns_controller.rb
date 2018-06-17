class PatternsController < ApplicationController
	
	def new
		@category_params = Category.select('name, id'). where('type_of_operation = ?', "#{@pr}" )
	end

	def create
		@p.user_id = params[:user_id]
		if @p.save
			redirect_to root_path
    else
    	redirect_to :new
    end
	end

	def edit
		@p.user_id = params[:user_id]
		if @p.save
			redirect_to root_path
    else
    	redirect_to :new
    end
	end

	def update
		if @p.update(p_params)
			redirect_to root_url
		else
			render :edit
		end
	end

	def destroy
		if @p.delete
			redirect_to root_url
		else 
			redirect_to root_url
		end
	end

	private

	def p_params
  	params.require(:income).permit(:sum, :user_id, :category_id)
	end
end