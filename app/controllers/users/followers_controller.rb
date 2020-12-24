# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'users/show_follower'
  end
end
