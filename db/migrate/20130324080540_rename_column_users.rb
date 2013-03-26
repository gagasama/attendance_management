class RenameColumnUsers < ActiveRecord::Migration
def self.up
    rename_column :users, :etype, :type
  end

  def self.down
    rename_column :users, :type, :etype
  end
end
