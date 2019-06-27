class AddForeignKeyToCars < ActiveRecord::Migration[5.2]
  def change
    change_column :cars, :created_by, 'integer USING CAST(created_by AS integer)'
    add_foreign_key :cars, :users, column: :created_by
  end
end
