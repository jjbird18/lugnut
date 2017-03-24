class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	def self.search(search)
	  search.blank? ? [] : all(:conditions => ['title LIKE ?', "%#{search.strip}%"])
	end
end
