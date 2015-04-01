require "rails_helper"

describe Message do
  it "doesnt save if twilio gives an error" do
    message = Message.new(body: "hi", to: "111111", from: "16466797271")
    expect(message.save).to be false
  end
end
