class CreateWorkDays < ActiveRecord::Migration
  def change
    create_table :work_days do |t|
      t.references :user
      t.date :date
      t.references :attendance_category
      t.time :clock_in
      t.time :clock_out
      t.time :break_time
      t.text :remarks

      t.timestamps
    end
    add_index :work_days, :user_id
    add_index :work_days, :attendance_category_id
  end
end
