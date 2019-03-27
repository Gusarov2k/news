class ChangeColumnCreatedInTopNews < ActiveRecord::Migration[5.2]
  def change
    change_column(:top_news, :created, :datetime)
  end
end
