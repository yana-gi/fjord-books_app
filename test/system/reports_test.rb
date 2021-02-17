# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
    assert_text "Today's Report"
    assert_text 'alice'
  end

  test 'creating a report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: "Yesterday's Report"
    fill_in '内容', with: 'Yesterday was a good day!'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text "Yesterday's Report"
    assert_text 'Yesterday was a good day!'
  end

  test 'updating a report' do
    visit report_url(reports(:alice_report).id)

    assert_text "Today's Report"
    assert_text 'Today was a good day!'

    click_on '編集'

    fill_in 'タイトル', with: "Yesterday's Report"
    fill_in '内容', with: 'Yesterday was a good day!'
    click_on '更新'

    assert_text '日報が更新されました'
    assert_text "Yesterday's Report"
    assert_text 'Yesterday was a good day!'
  end

  test 'destroying a report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました'
  end
end
