class MembersController < ApplicationController
  before_action :set_member, only: [:show]

  def index
    @members = Member.all
  end

  def show
    @tags = @member.tags
  end

  def create
    @member = Member.create(member_params)
    respond_to do |format|
      if @member.save
        format.html { redirect_to members_path, notice: 'Member Successfully Created' }
      else
        format.html { redirect_to new_member_path, notice: @member.errors.full_messages }
      end
    end
  end

  def new
    @member = Member.new
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :website_url)
  end
end
