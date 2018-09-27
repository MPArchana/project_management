class User < ActiveRecord::Base
	has_and_belongs_to_many :projects
	has_and_belongs_to_many :tasks
	validates :name, presence: :true
	validates :phone,:presence => true, :numericality => true, :length => { :minimum => 10, :maximum => 15 }
	validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  USER_ROLES = ["Admin", "Employee"].freeze

  DEPARTMENTS = ["Project"]



  def name_with_email
    "#{self.name} - #{self.email}"
  end
	
end
