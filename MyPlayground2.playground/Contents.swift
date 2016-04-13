//: Playground - noun: a place where people can play

import UIKit

func fahrenheitToCelsius(fahrenheitValue : Double) -> Double {
    var result : Double = 0
    
    result = ((fahrenheitValue - 32) * 5) / 9
    
    return result
}

var result = fahrenheitToCelsius(41)

print(result)

func reverseFunc(para : Double) -> Double {
    var result : Double = 0
    
    result = (para * 9) / 5 + 32
    
    return result
}

result = reverseFunc(5)

print(result)

func buildSentence(subject : String, verb : String, noun : String) -> String {
    return subject + " " + verb + " " + noun
}

buildSentence("my name",  verb: "is ", noun: "robert")

//可变参数,也可以用数组作为参数代替 见addAccountBalanceArray
func addAccountBalance(name : String, balances : Double...) -> Double {
    var result : Double = 0
    for balance in balances {
        result += balance
    }
    return result
}

addAccountBalance("1", balances: 1)
addAccountBalance("1", balances: 1, 2)
addAccountBalance("1", balances: 1, 2, 3)

func addAccountBalanceArray(name : String, balances : Array<Double>) -> Double {
    var result : Double = 0
    for balance in balances {
        result += balance
    }
    return result
}

addAccountBalanceArray("1", balances: [1])
addAccountBalanceArray("1", balances: [1, 2])
addAccountBalanceArray("1", balances: [1, 2, 3])

let account1 = ("State Bank Personal", 1011.10)
let account2 = ("State Bank Business", 24309.63)

func deposit(amount : Double, account : (name : String, balance : Double)) -> (String, Double) {
    let result = account.balance + amount
    return (account.name, result)
}

func withdraw(amount : Double, account : (name : String, balance : Double)) -> (String, Double) {
    let result = account.balance - amount
    return (account.name, result)
}

let mondayTransation = deposit
let fridayTransation = withdraw

let mondayBalance = mondayTransation(300.0, account: account1)
let fridayBakance = fridayTransation(100.0, account: account2)

//函数参数(type : String)->返回的函数参数(Double, (String, Double))->返回的函数的返回值(String, Double)
func chooseTransaction(type : String) -> (Double, (String, Double)) -> (String, Double) {
    if type == "deposit" {
        return deposit
    }
    return withdraw
}

//1
let myChoose = chooseTransaction("deposit")
var option1 = myChoose(300, ("option1", 300))
//2
var option2 = chooseTransaction("withdraw")(100, ("option2", 100))

//嵌套函数
func bankVault(passCode : String) -> String {
    func openBankVault() -> String {
        return "open"
    }
    func closeBankVault() -> String {
        return "close"
    }
    
    if passCode == "123456" {
        return openBankVault()
    }else {
        return closeBankVault()
    }
}

bankVault("123456")
bankVault("654321")

//默认参数
func writeCheck(payee : String = "robert", amount : String = "100") -> String {
    return "Check payable to \(payee) for $ \(amount)"
}

writeCheck()
writeCheck("Jerry")
writeCheck("Tom", amount : "10")

//函数名包含参数
func writeCheck(payer : String, payee : String, amount : Double) -> String {
    return "Check payable from \(payer) to \(payee) for $ \(amount)"
}

writeCheck("Tom", payee: "Jerry", amount: 300)

//显示参数列表
func writeBetterCheck(from payer : String, to payee : String,  total amount : Double) -> String {
    return "Check payable from \(payer) to \(payee) for $ \(amount)"
}

writeBetterCheck(from: "Tom", to: "Jerry", total: 300)

//可修改参数
func cashBetterCheck(from : String, var to : String, total : Double) -> String {
    if to == "Cash" {
        to = from
    }
    return "Check payable from \(from) to \(to) for $ \(total)"
}

cashBetterCheck("Robert", to: "Cash", total: 100)

//inout 参数修改反映到调用者 调用时参数加上&
func cashCheckInout(from : String, inout to : String, total : Double) -> String {
    if to == "Cash" {
        to = from
    }
    return "Check payable from \(from) to \(to) for $ \(total)"
}

var payer = "Robert"
var payee = "Cash"

cashCheckInout(payer, to: &payee, total: 100);

print(payee)

//闭包
//{(parameters) -> return_type in
//  statement
//}
let simpleInterestCalculationClosure = {
    (loanAmount : Double, interestRate : Double, years : Int) -> Double in
        var interest = Double(years) * interestRate / 100 * loanAmount
        return loanAmount + interest
}

func loanCalculator(loanAmount : Double, interestRate : Double, years : Int, calculator : (Double, Double, Int) -> Double) -> Double {
    let totalPayout = calculator(loanAmount, interestRate, years)
    return totalPayout
}

var simple = loanCalculator(10_000, interestRate: 3.875, years: 5, calculator: simpleInterestCalculationClosure)

let futureInterestCalculationClosure = {
    (loanAmount : Double, interestRate : Double, years : Int) -> Double in
    var mutiplier = pow((1 + interestRate / 100), Double(years))
    var result = loanAmount * mutiplier
    return result
}

var future = loanCalculator(10_000, interestRate: 3.875, years: 5, calculator: futureInterestCalculationClosure)

