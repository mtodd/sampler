class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.integer :score, null: false
      t.text    :notes

      t.timestamps null: false
    end
  end
end
