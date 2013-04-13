class CreateAttendanceTimes < ActiveRecord::Migration
  def change
    create_table :attendance_times do |t|
      t.references :user
      t.date :date
      t.time :time

      t.timestamps
    end
    add_index :attendance_times, :user_id
  end
end
