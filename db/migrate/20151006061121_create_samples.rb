class CreateSamples < ActiveRecord::Migration
  def up
    create_table :samples do |t|
      t.integer :score, null: false
      t.text    :notes

      t.timestamps null: false
    end

    add_index :samples, :score
    add_index :samples, [:created_at, :score]
  end

  def down
    drop_table :samples
  end
end
