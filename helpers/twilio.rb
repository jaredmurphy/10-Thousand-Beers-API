class TwilioHelper
 def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token  = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message
      sms(get_message)
  end

  private

  def get_message
      messages = [
          "Congrats, Noah! And, thanks for the beer",
          "Only a blackbelt in Karate could buy beers like you",
          "Thanks!",
          "Guess I should say thanks...",
          "Is EVERY one of these 10,000 beers going to John?!",
          "If Jared was the receiver of that last beer, give him a high five",
          "If Bryan was the receiver of that last beer, ask what his favorite color is",
          "If John was the receiver of that last beer, give Jared a high five",
          "Where do Ruby methods learn?.... in classes! ",
          "Could I have gotten my cast off two weeks ago? *sigh* Yes...",
          "This beer is going to be legend..... wait for it. DARY!"
      ]
      @message = messages.sample
  end

  def sms(message)
    @client.messages.create(
      from:      ENV["TWILIO_NUMBER"],
      to:        ENV["CLIENT_NUMBER"],
      body:      message
    )
  end
end