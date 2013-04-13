class CreateLeavingTimes < ActiveRecord::Migration
  def change
    create_table :leaving_times do |t|
      t.references :user
      t.date :date
      t.time :time

      t.timestamps
    end
    add_index :leaving_times, :user_id
  end
end
