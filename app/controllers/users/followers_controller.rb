# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    @user  = User.find(params[:id])
    @users = @user.followers.with_attached_avatar
    render 'users/followers/show'
  end
end
