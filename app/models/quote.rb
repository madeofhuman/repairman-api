class Quote < ApplicationRecord
  belongs_to :car
  has_many :comments, dependent: :destroy

  validates_presence_of :description
end
