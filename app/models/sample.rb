class Sample < ActiveRecord::Base
  validates :study_token, presence: true
  validates :score, presence: true
end
