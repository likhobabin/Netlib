require 'digest'

class Reader < ActiveRecord::Base
	attr_accessor :password	

	validates :email, :uniqueness => true, 
						:length => { :within => 8...256 },
						:format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }

	validates :password, :confirmation => true,
											 :length => { :within => 4..20 },
											 :presence => true, 
											 :if => :password_required?

	has_many :books, :dependent => :nullify

	has_many :replies, :through => :books, :source => :comments

	#call back methods 
	before_save :encrypt_new_password
	#authenticate methods
	def self.authenticate(email, input_password)
		user = find_by_email(email)
		return user if user && user.authenticated?(input_password)
	end 
	
	def authenticated?(input_password)
		return self.hashed_password == encrypt(input_password)
	end

protected
	def encrypt_new_password
			return if password.blank? 
								self.hashed_password = encrypt(password)
	end
	#------------------------------------------------------#
	def password_required? 
		hashed_password.blank? || hashed_password.present?
	end	
	#------------------------------------------------------#
	def encrypt(plain_text_password)
		Digest::SHA1.hexdigest(plain_text_password)
	end
end
