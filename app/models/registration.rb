require 'composite_primary_keys'
class Registration < ActiveRecord::Base

  self.primary_keys = :user_id, :session_id

  belongs_to :user
  belongs_to :session

  validate :validate_allowness

  def validate_allowness
    if not self.user.experiments.exists?(id: self.session.experiment.id)
      errors.add(:user, "isn't assigned to the corresponding experiment")
    end
    if Registration.where.not(session_id: self.session).exists?(session_id: self.session.experiment.sessions, user_id: self.user.id, participated: true)
      errors.add(:session, "already participated")
    end
  end
  self.primary_keys = :user_id, :session_id
end
