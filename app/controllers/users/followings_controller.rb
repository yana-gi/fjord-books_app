# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'users/followings/show'
  end
end
