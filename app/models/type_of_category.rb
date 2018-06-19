class TypeOfCategory < ApplicationRecord
	has_many :categories

	def active_categories
    categories.active
  end
end
