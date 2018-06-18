class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@categories = current_user.categories
  	if params[:category_id] || params[:min_time] || params[:max_time]
  		@transactions = Transaction.select('id, user_id, sum, category_id, created_at').where('category_id=? and created_at>? and created_at<?', params[:category_id], params[:min_time], params[:max_time])
  	else
  		@transactions = Transaction.all
  	end
  end
end
