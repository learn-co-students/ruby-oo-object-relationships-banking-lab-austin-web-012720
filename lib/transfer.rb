class Transfer

attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end

  def valid? #checks if sender && receiver have open accounts with balance > 0 and a balance larger than the transfer amount
    self.sender.valid? && 
      self.receiver.valid? && 
        sender.balance >= self.amount 
    
  end

  def execute_transaction
    if self.status == "pending" && self.valid? 
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    end
  end

end
