class User < ApplicationRecord
	validates :email, :session_token, presence: true
	validates :email, :session_token, uniqueness: true 
	validates :password_digest, presence: { message: 'Password can\'t be blank' }
	validates :password, length: { minimum: 4, allow_nil: true }

	after_initialize :ensure_session_token

	attr_reader :password

	has_many :notes 

	def self.generate_session_token
		session_token = SecureRandom::urlsafe_base64(16)
		while User.exists?(session_token: session_token)
			session_token = SecureRandom::urlsafe_base64(16)
		end
		session_token
	end

	def reset_session_token! 
		self.session_token = User.generate_session_token
		self.save! 
		self.session_token
	end

	def self.find_by_credentials(email, password)
		user = User.find_by(email: email)
		return nil if user.nil? 
		return user if user.is_password?(password)
		nil
	end

	def is_password?(password)
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end

	def password=(password)
		@password = password 
		self.password_digest = BCrypt::Password.create(password)
	end

	private 

	def ensure_session_token
		self.session_token ||= User.generate_session_token
	end
end
