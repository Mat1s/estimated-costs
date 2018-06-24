class TypeOfCategory < ApplicationRecord
	has_many :categories

	def active_categories(current)
    categories.current(current)
  end
end
