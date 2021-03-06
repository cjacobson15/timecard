class Company < ActiveRecord::Base

  has_many :admins, :class_name => "Admin", :foreign_key => "company_id"
  has_many :jobs, :class_name => "Job", :foreign_key => "company_id"

  validates :name, presence: true, uniqueness:{ scope: city }
  validates :city, presence: true
  validates :state, presence: true
end
