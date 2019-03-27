class TopNews < ApplicationRecord
  validates :title, :announcement, :context, presence: true
  validates :title, :announcement, length: { minimum: 10 }
  validates :context, length: { minimum: 30 }

  before_create :set_date_create

  private

  def set_date_create
    self.created = Time.zone.now.to_s
  end
end
