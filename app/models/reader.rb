class Reader < ActiveRecord::Base
	validates :email, :uniqueness => true, 
						:length => { :within => 8...256 },
						:format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }

	validates :password, :presence => true, :confirmation => true

	has_many :books, :dependent => :nullify

	has_many :replies, :through => :books, :source => :comments
end
