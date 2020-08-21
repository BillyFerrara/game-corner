class Game < ActiveRecord::Base
  belongs_to :user
  validates :name, :description, :genre, :platform, :average_playtime, presence:true
end
