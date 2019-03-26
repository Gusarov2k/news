class TopNews < ApplicationRecord
  before_validation :set_date_create

  private

  def set_date_create
    self.created = Time.zone.now.to_s
  end
end
