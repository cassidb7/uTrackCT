class FriendshipsController < ApplicationController
  before_action :set_member, only: [:create]
  before_action :set_friend, only: [:create]


  def create
    respond_to do |format|
      if @member.befriend(member: @friend)
        format.html { redirect_to member_path(@member), notice: "Member #{@friend.name} successfully added as friend" }
      else
        format.html { redirect_to member_path(@member), notice: "Member #{@friend.name} is already a Friend" }
      end
    end
  end

  private

  def set_member
    @member = Member.find(params[:member_id])
  end

  def set_friend
    @friend = Member.find(params[:friend_id])
  end
end