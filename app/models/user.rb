class User < ActiveRecord::Base
	has_and_belongs_to_many :project
	has_and_belongs_to_many :task
	validates :name, presence: :true
	validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
	validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
	
end
