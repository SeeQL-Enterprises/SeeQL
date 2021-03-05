# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
    subject do
        described_class.new(
            email: 'test@email.com',
            password: '123456',
            first_name: 'Bruno',
            last_name: 'Brunckhorst'
        )
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without an email' do
        subject.email = nil
        expect(subject).to be_invalid
    end

    it 'is not valid without a password' do
        subject.password = nil
        expect(subject).to be_invalid
    end

    it 'is not valid with a password shorter than 6 characters' do
        subject.password = '12345'
        expect(subject).to be_invalid
    end

    it 'is not valid without a first name' do
        subject.first_name = nil
        expect(subject).to be_invalid
    end

    it 'is not valid without a last name' do
        subject.last_name = nil
        expect(subject).to be_invalid
    end
end
