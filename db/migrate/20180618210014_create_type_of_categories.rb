class CreateTypeOfCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :type_of_categories do |t|
      t.string :type_of_category
      t.timestamps
    end
    change_table :categories do |t|
      t.references :type_of_category
    end
  end
end
