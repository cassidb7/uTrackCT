class MembersController < ApplicationController
  before_action :set_member, only: [:show]

  def index
    @members = params.blank? ? return_all_members : return_relevant_members(search: params[:member])
  end

  def show
    @tags = @member.tags
    @members = Member.return_other_members(@member)
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

  def return_all_members
    Member.all
  end

  def return_relevant_members(search:)
    Member.return_relevant(search: search)
  end
end
