# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'users/followers/show'
  end
end
