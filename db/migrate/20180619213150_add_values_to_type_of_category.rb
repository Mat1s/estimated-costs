class AddValuesToTypeOfCategory < ActiveRecord::Migration[5.2]
  def change
  	TypeOfCategory.create(type_of_category: "income")
  	TypeOfCategory.create(type_of_category: "expense")
  end
end
