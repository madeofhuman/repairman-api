require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should have_many(:quotes).dependent(:destroy) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:make) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:trim) }
  it { should validate_presence_of(:created_by) }
end
