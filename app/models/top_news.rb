class TopNews < ApplicationRecord
  validates :title, :announcement, :context, presence: true

  before_create :set_date_create

  private

  def set_date_create
    self.created = Time.zone.now.to_s
  end
end
