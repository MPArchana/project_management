class UserTask < ActiveRecord::Base
	belongs_to :task
	belongs_to :user
	validates :user_id, :task_id, presence: true
end
