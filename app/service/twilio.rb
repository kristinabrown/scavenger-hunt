class Messenger

  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send(number)

    account_sid = ENV["twilio_sid"]
    auth_token = ENV["twilio_auth_token"]

    from = "+13036225805" # Your Twilio number. Will change per account

    client.account.messages.create(
              :from => from,
              :to => number.to_i,
              :body => "https://turing-scavengerhunt.herokuapp.com/teams/#{number}"
            )
    puts "Sent message"
  end
end
