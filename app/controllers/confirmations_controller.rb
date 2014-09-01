class ConfirmationsController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource)
    root_path
  end
end
