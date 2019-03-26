require 'rails_helper'

RSpec.describe TopNews, type: :model do
  describe 'validates' do
    let(:news) { build(:top_news) }

    context 'when true' do
      it { expect(news).to be_valid }
    end
  end
end
