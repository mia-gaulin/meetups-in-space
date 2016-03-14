class CreateAttendees < ActiveRecord::Migration
  def change
    create_join_table :users, :meetups, table_name: :attendees do |t|
      t.index :user_id
      t.index :meetup_id
    end
  end
end

# class CreateAppointments < ActiveRecord::Migration
#   def change
#     create_table :physicians do |t|
#       t.string :name
#       t.timestamps null: false
#     end
#
#     create_table :patients do |t|
#       t.string :name
#       t.timestamps null: false
#     end
#
#     create_table :appointments do |t|
#       t.belongs_to :physician, index: true
#       t.belongs_to :patient, index: true
#       t.datetime :appointment_date
#       t.timestamps null: false
#     end
#   end
# end
