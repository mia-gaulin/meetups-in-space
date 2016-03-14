class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :title, null: false
      t.string :meetup_date, null: false
      t.text :description, null: false
      t.integer :creator_id, null: false
      t.integer :location_id, null: false

      t.timestamps null: false
    end
  end
end
