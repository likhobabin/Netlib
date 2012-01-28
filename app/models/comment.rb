class Comment < ActiveRecord::Base
	belongs_to :book
	
	def book_should_be_published
		errors.add(:book_id, "is not published yet") if book && !book.published?
	end

end
