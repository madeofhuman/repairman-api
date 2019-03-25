require 'rails_helper'

RSpec.describe Quote, type: :model do
  it { should belong_to(:car) }

  it { should validate_presence_of(:description) }
end
