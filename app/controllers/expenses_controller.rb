class ExpensesController < ApplicationController
	def new
		@expense = Expense.new
		@category_params = Category.select('name, id'). where('type_of_operation = ?', 'expense')
	end

	def create
		@expense = Expense.new(espense_params)
		@expense.user_id = params[:user_id]
		if @expense.save
			redirect_to root_path
    else
    	redirect_to new_expense_path
    end
	end

	def edit
		@expense = Expense.new(expense_params)
		@expense.user_id = params[:user_id]
		if @expense.save
			redirect_to root_path
    else
    	redirect_to new_expense_path
    end
	end
	def edit
		@expense = Expense.find(params[:id])	
	end

	def update
		@expense = Expense.find(params[:id])
		if @expense.update(expense_params)
			redirect_to root_url
		else
			render :edit
		end
	end

	def destroy
		@expense = Expense.find_by(id: params[:id])	
		if @expense.delete
			redirect_to root_url
		else 
			redirect_to root_url
		end

	end

	private
	
		def espense_params
    	params.require(:expense).permit(:sum, :user_id, :category_id)
  	end
end
