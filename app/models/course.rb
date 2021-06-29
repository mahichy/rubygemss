class Course < ApplicationRecord
validates :title,  presence: true
validates :description, :short_description, :language, :price, :level, presence: true, length: { :minimum => 5 }

belongs_to :user

	def to_s
		title
	end

	has_rich_text :description
	
	extend FriendlyId
  friendly_id :title, use: :slugged
end
