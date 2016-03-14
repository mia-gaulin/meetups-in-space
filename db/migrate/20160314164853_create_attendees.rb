class CreateAttendees < ActiveRecord::Migration
  def change
    create_join_table :users, :meetups, table_name: :attendees do |t|
      t.index :user_id
      t.index :meetup_id
    end
  end
end
