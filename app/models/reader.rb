class Reader < ActiveRecord::Base
	validates :email, :presence => true
	validates :password, :presence => true

	has_many :books, :dependent => :nullify

	has_many :replies, :through => :books, :source => :comments
end
