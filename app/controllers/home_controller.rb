class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@categories = current_user.categories
    @type_of_categories = TypeOfCategory.all
    @count_transactions = Transaction.where('user_id =?', current_user.id).count
  	if params[:category_id]
      @transactions = Transaction.
        select('transactions.id as id, transactions.sum as sum, transactions.category_id , transactions.created_at as created_at, categories.name as name, type_of_categories.type_of_category as type').
        joins("left join categories on categories.id = transactions.category_id").
        joins('left join type_of_categories on categories.type_of_category_id = type_of_categories.id').
        where('transactions.category_id=? and transactions.created_at>? and transactions.created_at<? and categories.user_id=?', params[:category_id], params[:min_time], params[:max_time], current_user.id).
        order('transactions.created_at DESC, categories.type_of_category_id')
    else
      @transactions = Transaction.
        select('transactions.id as id, transactions.sum as sum, transactions.category_id , transactions.created_at as created_at, categories.name as name, type_of_categories.type_of_category as type').
        joins("left join categories on categories.id = transactions.category_id").
        joins('left join type_of_categories on categories.type_of_category_id = type_of_categories.id').
        where('categories.user_id=?', current_user.id).
        order('transactions.created_at DESC, type_of_categories.type_of_category')
    end
  end
end
   