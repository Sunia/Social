class VideoGame < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  acts_as_followable

  include PublicActivity::Model
  tracked
end
