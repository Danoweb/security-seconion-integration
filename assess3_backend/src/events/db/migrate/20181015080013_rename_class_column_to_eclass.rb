class RenameClassColumnToEclass < ActiveRecord::Migration
  def change
  end

  def self.up
	rename_column :events, :class, :eclass
  end

  def self.down
	rename_column :events, :eclass, :class
  end
end
