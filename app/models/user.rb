class User < ActiveRecord::Base
  has_many :reviews
  validates :email, presence: true
  validates :email, uniqueness: true
  has_secure_password

  def full_name
    "#{firstname} #{lastname}"
  end

end
