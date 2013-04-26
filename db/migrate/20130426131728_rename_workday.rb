class RenameWorkday < ActiveRecord::Migration
  def up
    rename_table :work_days, :attendance_days
  end

  def down
    rename_table :attendance_days, :work_days
  end
end
