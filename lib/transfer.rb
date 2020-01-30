require 'pry'

class Transfer
  attr_accessor :sender, :transfer, :receiver, :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @transfer = transfer
    @receiver = receiver
    @status = "pending"
    @amount =  amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @sender.balance > @amount && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      "Transaction rejected. Please check your account balance."
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && @receiver.balance > @amount && self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
      "Transaction rejected. Please check your account balance."
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end



end
