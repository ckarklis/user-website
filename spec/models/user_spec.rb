require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates first name presence' do
    # Organizar: qual é a entrada e saída?
    user = User.create(first_name: nil, last_name: 'Karklis')

    expect(user.errors.messages[:first_name]).to eq(["can't be blank"])
  end

  it 'validates last name presence' do
    # Organizar: qual é a entrada e saída?
    user = User.create(first_name: "Carolina", last_name: nil)

    expect(user.errors.messages[:last_name]).to eq(["can't be blank"])
  end

  it 'validates email presence' do
    # Organizar: qual é a entrada e saída?
    user = User.create(first_name: "Carolina", email: nil)

    expect(user.errors.messages[:email]).to eq(["can't be blank"])
  end

  it 'validate uniqueness of email' do
    user_a = User.create(first_name: 'Carolina', last_name: 'Karklis', email: 'carolkarklis@gmail.com')

    user_b = User.new(first_name: 'Maria', last_name: 'Silva', email: 'carolkarklis@gmail.com')

    expect(user_b).to be_invalid
  end
end
