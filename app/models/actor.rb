class ActorDOBValidator < ActiveModel::Validator
  def validate(record)
    if record.dob.blank?
      record.errors[:dob] << "Date can't be blank!"
    elsif record.dob > Date.today
      record.errors[:dob] << "Date can't be later than today!"
    elsif record.dob > 10.years.ago
      record.errors[:dob] << "Can't insert information about actors younger than 10!"
    end
  end
end

class Actor < ActiveRecord::Base
  # validates(:name, { :presence => true, :uniqueness => true })
  validates :name, presence: true, uniqueness: true
  # validates :dob, presence: true
  validates_with ActorDOBValidator
end
