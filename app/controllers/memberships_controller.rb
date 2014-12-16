class MembershipsController < ApplicationController
  before_action :require_login

  def create
    @membership = Membership.create(membership_params)

    respond_with do |format|
      if @membership.save
        format.html { redirect_to @membership.team }
        format.json { render json: @membership, status: :created }
        format.js
      else
        format.html { redirect_to @membership.team, alert:"Failed adding member: #{@membership.errors.full_messages}" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    respond_with do |format|
      format.html {redirect_to :back}
    end
  end

  private
  def membership_params
    params.require(:membership).permit(:user_id, :team_id, :role)
  end

end
