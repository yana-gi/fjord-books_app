# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'users/show_follow'
  end
end
