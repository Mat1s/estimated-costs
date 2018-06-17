class IncomesController < ApplicationController
	before_action :find_id, only: [:update, :edit, :destroy]
	before_action :category_params, only: [:new, :edit]
	def new
		@income = Income.new
		
	end

	def create
		@income = Income.new(income_params)
		@income.user_id = params[:user_id]
		if @income.save
			redirect_to root_path
    else
    	redirect_to new_income_path
    end
	end

	def edit
		@income = Income.new(income_params)
		@income.user_id = params[:user_id]
		if @income.save
			redirect_to root_path
    else
    	redirect_to new_income_path
    end
	end

	def edit
	
	end

	def update
		
		if @income.update(income_params)
			redirect_to root_url
		else
			render :edit
		end
	end

	def destroy
	
		if @income.delete
			redirect_to root_url
		else 
			redirect_to root_url
		end

	end

	private
	def find_id
		@income = Income.find(params[:id])
	end

	def category_params
		@category_params = Category.select('name, id'). where('type_of_operation = ?', 'income')
	end

	def income_params
  	params.require(:income).permit(:sum, :user_id, :category_id)
	end
end
