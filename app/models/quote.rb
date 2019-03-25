class Quote < ApplicationRecord
  belongs_to :car

  validates_presence_of :description
end
