require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build(:user) }

    context 'when user valid' do
      it { expect(user).to be_valid }
    end

    context 'when user invalid' do
      it 'name blank' do
        user.name = nil
        expect(user).not_to be_valid
      end
      it 'email blank' do
        user.email = nil
        expect(user).not_to be_valid
      end
    end
  end
end
