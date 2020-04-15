
require_relative '../lib/live_like_follow'

describe "the login_twitter method" do
  it "should return client, and client is not nil" do
    expect(live_twitter).not_to be_nil
  end
end