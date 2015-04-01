class Message < ActiveRecord::Base
  before_create :send_sms

  private

  def send_sms
    begin
      response = RestClient::Request.new(
        method: :post,
        url: "https://api.twilio.com/2010-04-01/Accounts/ACb762e8fa9bd752333b26385272bc8780/SMS/Messages.json",
        user: ENV["TWILIO_ACCOUNT_SID"],
        password: ENV["TWILIO_AUTH_TOKEN"],
        payload: { Body: body, To: to, From: from }

      ).execute

    rescue
      false
    end  
  end
end
