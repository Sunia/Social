class VideoGame < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name

  include PublicActivity::Model
  tracked
end
