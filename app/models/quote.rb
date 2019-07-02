class Quote < ApplicationRecord
  belongs_to :car
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_presence_of :description
end
