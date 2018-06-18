class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :type_of_transaction
      t.string :name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
