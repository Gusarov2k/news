class CreateTopNews < ActiveRecord::Migration[5.2]
  def change
    create_table :top_news do |t|
      t.string :title
      t.string :announcement
      t.text :context
      t.date :created
    end
  end
end
