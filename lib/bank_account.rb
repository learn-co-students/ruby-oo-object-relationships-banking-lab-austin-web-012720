class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @balance = 1000
        @name = name
        @status = "open"
    end

    # Class Methods

    # Instance Methods
    def close_account
        self.status = "closed"
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        self.status == "open" && self.balance > 0
    end
end