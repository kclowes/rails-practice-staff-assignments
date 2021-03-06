class Person < ActiveRecord::Base

  validates :last_name, presence: true
  validate :first_name_and_title
  has_many :assignments


  def first_name_and_title
    if !first_name.present? && !title.present?
      errors.add(:first_name, message: 'You must enter a title/last name, or a first/last name')
    end
  end

end