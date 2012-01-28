class Book < ActiveRecord::Base
	validates :title, :presence => true
	validates :author, :presence => true

	belongs_to :reader
	
	has_and_belongs_to_many :categories

	has_many :comments

	def full_title
		"#{title}_#{author}"
	end
end
