class BankAccount

    attr_reader :name
    attr_accessor :status, :balance

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(num)
        @balance += num
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        @status == "open" and @balance > 0
    end

    def close_account
        @status = "closed"
    end
end
