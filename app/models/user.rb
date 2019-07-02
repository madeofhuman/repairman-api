class User < ApplicationRecord
  has_secure_password
  has_many :cars, foreign_key: :created_by
  has_many :quotes
  has_many :comments
  validates_presence_of :email, :name, :password_digest

  def details
    {
      id: id,
      name: name,
      email: email,
      admin: admin
    }
  end
end
