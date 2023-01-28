class CreateFavoriteEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_events do |t|
      t.string :event_name
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
