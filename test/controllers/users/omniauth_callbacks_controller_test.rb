# frozen_string_literal: true

require 'test_helper'

module Users
  class OmniauthCallbacksControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    test '#github_signup_success' do
      OmniAuth.config.test_mode = true
      request.env['devise.mapping'] = Devise.mappings[:user]
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                                                    provider: 'github',
                                                                    uid: '12345',
                                                                    info: {
                                                                      email: 'Carol@example.com',
                                                                      name: 'Carol'
                                                                    }
                                                                  })
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
      get :github

      assert_redirected_to books_path
    end
  end
end
