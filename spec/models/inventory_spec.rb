require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject { 
    user = User.create(name: 'John', email: 'john@example.com', password: 'password', confirmed_at: Time.now)
    Inventory.new(name: "Inventory 1", user: user)
  }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end
end
