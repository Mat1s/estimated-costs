class Category < ApplicationRecord
  belongs_to :user
  belongs_to :type_of_category
  has_many :transactions, dependent: :destroy
  scope :current, ->(user) {where(user_id: user.instance_id)}
  
  # 
  # def add_type(p)
  # 	if p == "income"
  # 		self.type_of_category_id = TypeOfCategory.first.id
  #  	elsif p == 'expense'
  # 		self.type_of_category_id = 2
  # 	else
  #     self.type_of_category_id = 0
  #   end
  # end
end
