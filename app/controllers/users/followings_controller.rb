# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @user  = User.find(params[:id])
    @users = @user.followings.with_attached_avatar
    render 'users/followings/show'
  end
end
