require 'pry'

class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount = 50, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      return true
    end
  end

  def execute_transaction
    if self.status != "complete" && self.sender.balance >= amount && self.valid?
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      if self.sender.balance > amount
        self.sender.balance += amount
        self.receiver.balance -= amount
        self.status = "reversed"
      end
    end
  end
end
