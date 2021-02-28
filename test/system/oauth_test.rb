# frozen_string_literal: true

require 'application_system_test_case'

class OAuthTest < ApplicationSystemTestCase
  setup do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github, { uid: '12345', info: { name: 'github', email: 'github@example.com' } })
  end

  test 'GitHub sign up' do
    visit root_path
    assert_css 'h2', text: 'ログイン'
    click_link 'GitHubでログイン'
    assert_text 'GitHub アカウントによる認証に成功しました。'
    assert_text 'github@example.com としてログイン中'
    click_link 'ユーザ'
    assert_css 'h1', text: 'ユーザ'
    within 'table' do
      assert_text 'github@example.com'
      assert_text 'github'
    end
  end
end
