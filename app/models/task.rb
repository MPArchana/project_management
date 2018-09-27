class Task < ActiveRecord::Base
	belongs_to :project
  has_and_belongs_to_many :users, dependent: :destroy
  has_many :comments
	validates :name, presence: true

  STATUS = {
    pending: 'Pending',
    process: 'Process',
    done: 'Done'
  }.freeze

  LABEL = {
    feature: 'Feature',
    Enhancement: 'Enhancement',
    bug: 'Bug',
    rework: 'Rework', 
    ui_work: 'UI-Work' 

  }.freeze


  def done?
    status == STATUS[:done]
  end
end
