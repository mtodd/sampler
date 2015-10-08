class SetStudyTokenForExistingSamples < ActiveRecord::Migration
  KEY = "LEGACY_SAMPLES_STUDY_TOKEN"

  def up
    raise "set the #{KEY} ENV variable and run the migration" unless ENV[KEY]
    Sample.where(:study_token => nil).update_all :study_token => ENV[KEY]
  end

  def down
    # noop, rerunnable
  end
end
