class Error
  attr_reader :message, :status_code

  def initialize(message)
    @message = message
  end
end