class User < ApplicationRecord
    validates :email, :password_diggest, :session_token, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :eamil, :session_token, uniqueness: true
    
    attr_reader :password

    after_initialize :ensure_session_token

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)

        user && user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        token = SecureRandom.urlsafe_base64(16)
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(password)
        @password = password
        self.password_diggest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt:Password.new(self.password_diggest).is_password?(password)
    end
    
    def reset_session_token
        self.session_token = self.generate_session_token
        self.save!
        self.session_token
    end
end
