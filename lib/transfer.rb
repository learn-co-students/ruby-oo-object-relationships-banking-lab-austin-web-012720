class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      return true
    else
      return false
    end    
  end

  def execute_transaction
    if self.status == "pending" && self.sender.balance > @amount && valid?
      self.receiver.balance += @amount 
      self.sender.balance -= @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end   
  end

  def reverse_transfer
      if self.status == "complete"
      self.receiver.balance -= @amount
      self.sender.balance += @amount
      self.status = "reversed" 
      end
  end


end
