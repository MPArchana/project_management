class UserProject < ActiveRecord::Base
	has_many :tasks
	belongs_to :project
	validates :user_id, :project_id, presence: true
end
