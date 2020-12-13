# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def follow
    @user = User.find(params[:id])
    if Relationship.find_by(following_id: @user.id, follower_id: current_user.id).blank?
      current_user.follow(@user)
      @flag = true
    else
      current_user.unfollow(@user)
      @flag = false
    end
  end
end
