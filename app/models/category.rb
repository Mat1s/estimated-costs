class Category < ApplicationRecord
  belongs_to :user
  belongs_to :type_of_category
  has_many :transactions, dependent: :destroy
  scope :active, ->{ where(user_id: 1)}
end
