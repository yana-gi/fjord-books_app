# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # プロフィール更新時のパスワード入力を不要にする
  def update_resource(resource, params)
    if params[:password].present? && params[:password_confirmation].present?
      resource.update(params)
    else
      resource.update_without_password(params)
    end
  end
end
