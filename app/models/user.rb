class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes, dependent: :destroy
  # # This method associates the attribute ":avatar" with a file attachment

    has_attached_file :avatar, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    } , default_url: ""
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



  before_save { email.downcase! }

  validates :first_name, :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 80 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  # Add methods to set and authenticate against a BCrypt password.
  has_secure_password

  validates :password, length: { minimum: 8, maximum: 20 }

  validate :password_complexity

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end

  def to_s
    email
  end
end

