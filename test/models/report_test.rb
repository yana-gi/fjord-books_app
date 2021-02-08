# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'is valid title' do
    report = reports(:alice_report)
    report.title = 'hoge'
    assert report.valid?
    report.title = nil
    assert report.invalid?
  end

  test 'is valid content' do
    report = reports(:alice_report)
    report.content = 'hoge'
    assert report.valid?
    report.content = nil
    assert report.invalid?
  end

  test '#editable?' do
    alice = users(:alice)
    bob = users(:bob)
    alice_report = reports(:alice_report)

    assert alice_report.editable?(alice)
    assert_not alice_report.editable?(bob)
  end

  test '#created_on' do
    alice_report = reports(:alice_report)

    assert_equal alice_report.created_at.to_date, alice_report.created_on
  end
end
