class AddStudyTokenToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :study_token, :string
    add_index  :samples, :study_token
  end
end
