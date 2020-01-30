class Transfer
  attr_accessor :sender, :receiver, :transfer, :status, :amount
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @transfer = transfer
    @status = "pending"
    @amount = amount
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && status == "pending" && sender.balance > amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end