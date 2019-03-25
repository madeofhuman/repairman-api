class Car < ApplicationRecord
  has_many :quotes, dependent: :destroy

  validates_presence_of :make, :year, :model, :trim, :created_by
end
