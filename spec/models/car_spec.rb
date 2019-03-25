require 'rails_helper'

RSpec.describe Car, type: :model do
it { should have_many(:quotes).dependent(:destroy) }

it { should validate_presence_of(:make) }
it { should validate_presence_of(:created_by) }
it { should validate_presence_of(:model) }
it { should validate_presence_of(:trim) }
end
