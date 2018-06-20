class Category < ApplicationRecord
  belongs_to :user
  belongs_to :type_of_category
  has_many :transactions, dependent: :destroy
  # scope :active, ->{ where(user_id: 1)}
  # 
  def add_type(p)
  	if p == "income"
  		self.type_of_category_id = 1
  	else
  		self.type_of_category_id = 2
  	end
  end
end
