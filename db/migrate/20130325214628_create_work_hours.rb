class CreateWorkHours < ActiveRecord::Migration
  def change
    create_table :work_hours do |t|
      t.references :user
      t.date :date
      t.time :attendance
      t.time :leaving

      t.timestamps
    end
    add_index :work_hours, :user_id
  end
end
