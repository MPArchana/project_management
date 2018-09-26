class Comment < ActiveRecord::Base
  belongs_to :task
  validates :comment, presence: true, :length => { maximum: 5000 }
end
