require 'rails_helper'

RSpec.describe TopNews, type: :model do
  describe 'validates' do
    let(:news) { build(:top_news) }

    context 'when true' do
      it { expect(news).to be_valid }
    end

    context 'when false' do
      it 'title nil' do
        news.title = nil
        expect(news).not_to be_valid
      end

      it 'announcement nil' do
        news.announcement = nil
        expect(news).not_to be_valid
      end

      it 'context nil' do
        news.context = nil
        expect(news).not_to be_valid
      end

      it 'title short' do
        news.title = 'help'
        news.valid?
        expect(news.errors.messages[:title]).to include('is too short (minimum is 10 characters)')
      end

      it 'announcement short' do
        news.announcement = 'rest'
        news.valid?
        expect(news.errors.messages[:announcement]).to include('is too short (minimum is 10 characters)')
      end

      it 'context short' do
        news.context = 'help_as'
        news.valid?
        expect(news.errors.messages[:context]).to include('is too short (minimum is 30 characters)')
      end
    end
  end

  describe 'Add time when create news' do
    let(:news) { create(:top_news) }

    it 'create time' do
      expect(news.created).to be_within(1.second).of(Time.zone.now)
    end
  end
end
