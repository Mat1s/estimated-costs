class Category < ApplicationRecord
  belongs_to :user
  belongs_to :type_of_category
  has_many :transactions, dependent: :destroy
end
