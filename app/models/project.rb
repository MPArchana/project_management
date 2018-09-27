class Project < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy
  validates :name, presence: :true
  validates :client_details, presence: :true 
  validates :description, :presence => true, :length => { :maximum => 1024 }
end
