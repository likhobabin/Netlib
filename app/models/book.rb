class Book < ActiveRecord::Base
	validates :title, :presence => true
	validates :author, :presence => true

	belongs_to :reader
	
	has_and_belongs_to_many :categories

	scope :about_is, where("books.description IS NOT NULL")
	scope :about_is_not, where("books.description IS NULL")

	scope :pub_date_is, where("books.publication_date IS NOT NULL")
	
	scope :recent, lambda { pub_date_is.where("books.publication_date > ?", 1.day.ago.to_date) }

	has_many :comments

	def published?
		publication_date.present?
	end	
	
	def full_title
		"#{title}_#{author}"
	end
end
