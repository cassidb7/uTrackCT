class MembersController < ApplicationController
  before_action :set_member, only: [:show]

  def index
    @search = params[:query] || nil
    @members = Member.return_other_members(search: params[:query])
  end

  def show
    @active_tab = params[:active_tag] || 'tab-overview'
    @search = params[:query] || nil
    @tags = @member.tags
    @members = Member.return_other_members(@member.id, search: @search)
    @friends = @member.friends
  end

  def create
    @member = Member.create(member_params)
    respond_to do |format|
      if @member.save
        format.html { redirect_to member_path(@member), notice: 'Member Successfully Created' }
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
