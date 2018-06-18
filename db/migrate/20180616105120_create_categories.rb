class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :type_of_transaction, null: false
      t.string :name, null: false
      t.references :user, foreign_key: true
      t.index [:type_of_transaction, :name, :user_id], name: "index_uniqueness_category", unique: true
      t.timestamps
    end
  end
end
