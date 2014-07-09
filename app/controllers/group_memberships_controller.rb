class GroupMembershipsController < ApplicationController
  def create
    group = Group.find(params[:id])
    current_user.join(group)
    redirect_to group, notice: "Joined group successfully"
  end
end
