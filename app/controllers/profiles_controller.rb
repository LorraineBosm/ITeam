class ProfilesController < ApplicationController
  before_action :set_agreements, only: :my_profile

  def my_profile

  end

  def company_profile

  end

  def add_agreement
    agreement = Agreement.find_by_agreement_code(agreement_params[:agreement_code])
    current_user.agreements << agreement unless agreement.nil?
    redirect_to my_profile_profiles_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Record already exists'
    redirect_to my_profile_profiles_path
  end

  private

  def set_agreements
    @agreements = User.find(current_user.id).agreements
  end

  def agreement_params
    params.require(:agreements).permit(:agreement_code)
  end
end
