class Blog < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, styles: { large: "640x480" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
