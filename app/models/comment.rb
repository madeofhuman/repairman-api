class Comment < ApplicationRecord
  belongs_to :quote

  validates_presence_of :text
end
