class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :expenses, through: :categories, dependent: :destroy 
  has_many :incomes, through: :categories, dependent: :destroy 
  has_many :categories, dependent: :destroy
end
