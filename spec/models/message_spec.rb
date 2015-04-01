require "rails_helper"

describe Message, :vcr => true do
  it "doesnt save if twilio gives an error" do
    message = Message.new(body: "hi", to: "1234567", from: "16466797271")
    expect(message.save).to be false
  end

  it "Adds an error if number is invalid" do
    message = Message.new(body: "hi", to: "1234567", from: "16466797271")
    message.save
    expect(message.errors.messages[:base]).to eq ["The 'To' number 1234567 is not a valid phone number."]
  end
end
