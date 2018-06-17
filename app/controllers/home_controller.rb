class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@users = User.all
  	@categories = Category.where(user_id: current_user.id)
  	@expenses =  Expense.where(user_id: current_user.id)
  	@incomes = Income.where(user_id: current_user.id)
  end
end
