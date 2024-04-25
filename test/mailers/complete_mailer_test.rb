require "test_helper"

class CompleteMailerTest < ActionMailer::TestCase
  test "complete_mail" do
    mail = CompleteMailer.complete_mail
    assert_equal "Complete mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
