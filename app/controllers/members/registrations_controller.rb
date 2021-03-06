# frozen_string_literal: true

class Members::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:cancel]
  #before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  def new
    @group_id = params[:group_id] 

     super
  end

  # POST /resource
  def create
    member = Member.new(sign_up_params)
    #@group_id = member.group_id
    @group_id = sign_up_params[:group_id]
    if member.valid?
      super
        # if @member.save
        # @group = @member.group
        # @ability_titles = AbilityTitle.where(gtoup_id: @group)
        # @ability_titles.each do |ability_title|
        # Ability.create!(
        #   member: @member,
        #   ability_title_id: @ability_title.id
        #   )
        # end  
        # end  
    else  
      flash[:alert] = member.errors.full_messages
      redirect_to new_member_registration_path(group_id: @group_id)
    end
    
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroySS
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the Member wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:member, keys: [:group_id])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end
  def after_sign_in_path_for(resource)
    @ability_titles = AbilityTitle.where(group_id: @group_id)
    @ability_titles.each do |ability_title|
      Ability.create!(
        member_id: @member.id,
        ability_title_id: ability_title.id
      )
    end
    manager_group_path(@group_id)
  end  
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
