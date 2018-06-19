class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@categories = current_user.categories
    @type_of_categories = TypeOfCategory.all
  	if params[:category_id]
      @transactions = Transaction.select('transactions.id as id, transactions.user_id as user_id, transactions.sum as sum, transactions.category_id , transactions.created_at as created_at, categories.name as name, categories.type_of_transaction as type').
        joins("left join categories on categories.id = transactions.category_id").
        where('transactions.category_id=? and transactions.created_at>? and transactions.created_at<? and categories.user_id=?', params[:category_id], params[:min_time], params[:max_time], current_user.id).
        order('transactions.created_at DESC, categories.type_of_transaction')
    else
      @transactions = Transaction.select('transactions.id as id, transactions.sum as sum, transactions.category_id , transactions.created_at as created_at, categories.name as name, categories.type_of_transaction as type').
        joins("left join categories on categories.id = transactions.category_id").where('categories.user_id=?', current_user.id).
        order('transactions.created_at DESC, categories.type_of_transaction')
    end
  end
end
   