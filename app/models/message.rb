class Message < ActiveRecord::Base
  before_create :send_sms

  private

  def send_sms
     response = RestClient::Request.new(
       method: :post,
       url: "https://api.twilio.com/2010-04-01/Accounts/ACb762e8fa9bd752333b26385272bc8780/SMS/Messages.json",
       user: "ACb762e8fa9bd752333b26385272bc8780",
       password: "f968058441cf061d883c7222f01df9d5",
       payload: { Body: body, To: to, From: from }

    ).execute

  end
end
