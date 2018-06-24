class TransactionsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_id, only: [:update, :edit, :destroy]
	before_action :category_params, only: [:new, :edit]

	def new
		@transaction = Transaction.new
		

	end

	def create
		@transaction = Transaction.new(transaction_params)
		@transaction.user_id = params[:user_id]
		if @transaction.save
			redirect_to root_path
    else
    	redirect_to new_transaction_path
    end
	end

	def edit
		@transaction = Transaction.new(transaction_params)
		@transaction.user_id = params[:user_id]
		if @transaction.save
			redirect_to root_path
    else
    	redirect_to new_transaction_path
    end
	end

	def edit
	end

	def update
		if @transaction.update(transaction_params)
			redirect_to root_url
		else
			render :edit
		end
	end

	def destroy
		if @transaction.delete
			redirect_to root_url
		else 
			redirect_to root_url
		end
	end

	private

	def find_id
		@transaction = Transaction.find(params[:id])
	end

	def category_params
		@type_of_categories = TypeOfCategory.all
	# 	@type_of_categories = TypeOfCategory.select('type_of_categories.type_of_category as type_of_category').distinct.
	# 												joins("left join categories on categories.type_of_category_id = type_of_categories.id").
	# 												where('user_id=?', current_user.id)
	end

	def transaction_params
  	params.require(:transaction).permit(:sum, :user_id, :category_id)
	end
end
