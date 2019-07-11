require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:cars) }
  it { should have_many(:quotes) }
  it { should have_many(:comments) }
  it { should have_secure_password }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

  subject { described_class.new }

  it "does not have details when created improperly" do
    expect(subject.details[:id]).to be_nil
    expect(subject.details[:name]).to be_nil
    expect(subject.details[:email]).to be_nil
    expect(subject.details[:admin]).to be false
  end
end
