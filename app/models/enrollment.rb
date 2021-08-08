class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :user, :course, presence: true

  validates_uniqueness_of :user_id, scope: :course_id
  # user can't be subscribed the same course twice
  validates_uniqueness_of :course_id, scope: :user_id
  # user can't be subscribed the same course twice


  validate :cant_subscribe_to_own_course
  # user cant create a subscription if course.user == current_user

  def to_s
    user.to_s + " " + course.to_s
  end

  protected
  def cant_subscribe_to_own_course
    if self.new_record?
      if user_id == course.user_id
        errors.add(:base, "You can't subscribe to your own course")
      end
    end
  end
end