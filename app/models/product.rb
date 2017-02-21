class Product < ApplicationRecord
	belongs_to :user
	belongs_to :productline
end
