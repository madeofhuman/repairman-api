class Car < ApplicationRecord
  has_many :quotes, dependent: :destroy
  belongs_to :user, foreign_key: :created_by

  validates_presence_of :make, :year, :model, :trim, :created_by
end
