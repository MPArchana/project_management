class Task < ActiveRecord::Base
	belongs_to :project
  has_and_belongs_to_many :user
  has_many :comments
	validates :name, presence: true

end
