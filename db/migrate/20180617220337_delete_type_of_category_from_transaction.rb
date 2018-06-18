class DeleteTypeOfCategoryFromTransaction < ActiveRecord::Migration[5.2]
  def change
  	remove_column :transactions, :type
  end
end
