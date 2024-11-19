
class BankAccount:
    def __init__(self):
        self.__balance = 0
        self.__transactions_today = 0
        self.__transaction_log = []

    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            self.__transactions_today += 1
            self.__transaction_log.append(("deposit", amount))
        else:
            print("Deposit amount must be positive")
    
    def withdraw(self, amount):
        if amount > self.__balance:
            print("Insufficient funds")
        elif self.__transactions_today >= 3:
            print("Transaction limit reached")
        else:
            self.__balance -= amount
            self.__transactions_today += 1
            self.__transaction_log.append(("withdraw", amount))
    
    def get_transaction_log(self):
        return self.__transaction_log
    
    def reset_transactions(self):
        self.__transactions_today = 0
        self.__transaction_log = []

account = BankAccount()
account.deposit(-5)
account.deposit(100)
account.withdraw(30)
account.withdraw(50)
print(account.get_transaction_log())
account.reset_transactions()
