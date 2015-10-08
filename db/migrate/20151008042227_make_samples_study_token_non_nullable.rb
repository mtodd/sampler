class MakeSamplesStudyTokenNonNullable < ActiveRecord::Migration
  def change
    change_column_null :samples, :study_token, false
  end
end
