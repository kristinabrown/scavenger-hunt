class Messenger

  attr_reader :client

  def initialize
      @client = Twilio::REST::Client.new ENV["twilio_sid"], ENV["twilio_auth_token"]
  end

  def send(number)
    from = "+13036225805" # Your Twilio number. Will change per account

    client.account.messages.create(
              :from => from,
              :to => number.to_i,
              :body => "DO NOT REPLY TO THIS TEXT. Welcome to the Turing Scavenger Hunt. Just go to the following link and start hunting. https://turing-scavengerhunt.herokuapp.com/teams/#{number}"
            )
    puts "Sent message"
  end
end
