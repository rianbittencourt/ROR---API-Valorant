class CreateChampions < ActiveRecord::Migration[7.1]
  def change
    create_table :champions do |t|
      t.string :name
      t.float :winrate
      t.float :pickrate

      t.timestamps
    end
  end
end
