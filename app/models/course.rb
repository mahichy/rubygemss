class Course < ApplicationRecord
validates :description,  presence: true, length: { :minimum => 5 }
validates :title, :short_description, :language, :price, :level, presence: true

belongs_to :user

	def to_s
		title
	end

	has_rich_text :description
	
	extend FriendlyId
  friendly_id :title, use: :slugged

  LANGUAGES = [:"English", :"bangla", :"Hindi", :"Spanish"]
  def self.languages
  	LANGUAGES.map { |language| [language, language] }
  end

   LEVELS = [:"Begainer", :"Intermediate", :"Advanced", :"N/A"]
  def self.levels
  	LEVELS.map { |level| [level, level] }
  end

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user}
end
