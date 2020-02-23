class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save :set_default_role
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  
  has_secure_password

  has_many :microposts, dependent: :destroy
  enum role: [:admin, :guest]

  def admin?
    role == 'admin'
  end

  def guest?
    role == 'guest'
  end

  def set_default_role
    self.role ||= 'guest'
  end
end
