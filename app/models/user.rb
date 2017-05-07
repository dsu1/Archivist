class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  	:recoverable, :rememberable, :trackable, :validatable

	has_many :archives, dependent: :destroy

	# attr_accessor :email, :username, :password, :password_salt, :password_hash,
	# 	:encrypted_password, :remember_me

	attr_accessor :password, :password_confirmation, :remember_me

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create

	validates :username, :presence => true, :uniqueness => true, :format => {with: /[a-zA-Z0-9]{3,24}/}
	validates :email, :presence => true, :uniqueness => true

	before_save :encrypt_password

	def self.authenticate(email, password)
		byebug
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

end
