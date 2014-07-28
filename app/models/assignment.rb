class Assignment < ActiveRecord::Base
  belongs_to :person
  belongs_to :location

  validates :role, presence: true
  validates_uniqueness_of :role, scope: :location_id, message: "This assignment could not be created"
  validates :location_id, presence: true
  validates :person_id, presence: true
end