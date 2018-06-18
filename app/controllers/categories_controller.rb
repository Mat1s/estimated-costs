class CategoriesController < ApplicationController
	before_action :authenticate_user!
	def new
		@category = Category.new
		@type = ['incomes', 'expense']
	end

	def create
		@category = Category.new(category_params)
		@category.user_id = params[:user_id]
		if @category.save
			redirect_to root_path
    else
    	redirect_to new_category_path
    end
	end

	def edit
		@category = Category.new(category_params)
		@category.user_id = params[:user_id]
		if @category.save
			redirect_to root_path
    else
    	redirect_to new_category_path
    end
	end
	def edit
		@category = Category.find(params[:id])	
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			redirect_to root_url
		else
			render :edit
		end
	end

	def destroy
		@category = Category.find_by(id: params[:id])
		@transactions = Transaction.where(category_id: params[:id])
		@transactions.each { |t| t.destroy }	
		if @category.delete
			redirect_to root_url
		else 
			redirect_to root_url
		end

	end

	private
		def category_params
    	params.require(:category).permit(:type_of_transaction, :user_id, :name)
  	end
end
