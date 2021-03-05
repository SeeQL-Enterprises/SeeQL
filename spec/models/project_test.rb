# spec/models/project_spec.rb

require 'rails_helper'

RSpec.describe Project, type: :model do
    user = User.new(
        email: 'test@email.com',
        password: '123456',
        first_name: 'Bruno',
        last_name: 'Brunckhorst'
    )

    subject do
        described_class.new(
            name: 'Test Project',
            user: user
        )
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a name' do
        subject.name = nil
        expect(subject).to be_invalid
    end

    it 'is not valid without a user' do
        subject.user = nil
        expect(subject).to be_invalid
    end
end
