class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, status='pending', amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      TRUE
    else 
      FALSE
    end
  end
  
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
end
