class CreateAttendanceCategories < ActiveRecord::Migration
  def change
    create_table :attendance_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
