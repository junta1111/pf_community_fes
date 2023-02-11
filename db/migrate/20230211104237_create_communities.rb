class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.integer :user_id
      t.integer :admin_id
      t.string :fes_name
      t.string :venue
      t.string :venue_month
      t.string :venue_year

      t.timestamps
    end
  end
end
