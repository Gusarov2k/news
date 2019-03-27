FactoryBot.define do
  factory :top_news do
    title { 'MyString is' }
    announcement { 'MyString good or bad' }
    context do
      'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et'
    end
    created { '2019-03-26' }
  end
end
