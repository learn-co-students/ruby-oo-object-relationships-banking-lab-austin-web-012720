class Transfer

  attr_accessor :status
  attr_reader :amount, :receiver, :sender

  def initialize(sender, receiver, amount)
    @amount = amount
    @receiver = receiver
    @sender = sender
    @status = "pending"
  end

  # Class Methods

  # Instance Methods
  def execute_transaction
    if !(self.valid?)
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif !(self.status == "complete")
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    end
  end

  def valid?
    # Checks that both accounts are valid
    accounts_valid = self.receiver.valid? && self.sender.valid?
    # Checks that the sender has enough funds to transfer the amount
    amount_valid = self.sender.balance >= self.amount

    # Returns the true if ALL above conditions are satisfied
    accounts_valid && amount_valid
  end
end
