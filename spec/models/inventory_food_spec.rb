require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  subject { 
    user = User.create(name: 'John', email: 'john@example.com', password: 'password', confirmed_at: Time.now)
    ivnentory = Inventory.create(name: "Inventory 1", user: user)
    food = Food.create(name: "Food 1", measurement_unit: "KG", price: 20, user: user)
    InventoryFood.new(inventory: ivnentory, food: food, quantity: 1)
  }

  before { subject.save }

  it 'inventory should be present' do
    subject.inventory = nil
    expect(subject).to_not be_valid
  end

  it 'food should be present' do
    subject.food = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be equal to or greater than 1' do
    subject.quantity = 0
    expect(subject).to_not be_valid
  end
end
