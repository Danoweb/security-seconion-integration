class RenameClassColumn2 < ActiveRecord::Migration
  def change
	rename_column :events, :class, :eclass
  end
end
