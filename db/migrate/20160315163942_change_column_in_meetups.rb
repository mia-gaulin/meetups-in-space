class ChangeColumnInMeetups < ActiveRecord::Migration
  def change
    rename_column :meetups, :creator_id, :user_id
  end
end
