require "test_helper"

class ShareMailerTest < ActionMailer::TestCase
  def test_share_taco
    mail = ShareMailer.share_taco
    assert_equal "Share taco", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
