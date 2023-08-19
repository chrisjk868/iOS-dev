import Foundation
import CloudKit
struct DomainModel {
    var text = "Hello, World!"
        // Leave this here; this value is also tested in the tests,
        // and serves to make sure that everything is working correctly
        // in the testing harness and framework.
}

////////////////////////////////////
// Money
//
public struct Money {
    let exchangeRates : [String : Double] = ["USD": 1.0, "GBP": 0.5, "EUR": 1.5, "CAN": 1.25]
    var amount : Int
    var currency : String
    
    init(amount : Int, currency : String) {
        self.amount = amount
        self.currency = currency
    }
    
    func convert(_ targetCurr : String) -> Money {
        let amountInUSD : Int = normalize()!.amount
        var conversion : Int = 0
        switch targetCurr {
        case "USD":
            return Money(amount: amountInUSD, currency: "USD")
        case "GBP":
            conversion = Int((Double(amountInUSD) * exchangeRates["GBP"]!).rounded(.up))
            return Money(amount: conversion, currency: "GBP")
        case "EUR":
            conversion = Int((Double(amountInUSD) * exchangeRates["EUR"]!).rounded(.up))
            return Money(amount: conversion, currency: "EUR")
        case "CAN":
            conversion = Int((Double(amountInUSD) * exchangeRates["CAN"]!).rounded(.up))
            return Money(amount: conversion, currency: "CAN")
        default:
            return Money(amount: self.amount, currency: self.currency)
        }
    }
    
    func add(_ sibMoney : Money) -> Money {
        let convertSelf = normalize()!.convert(sibMoney.currency)
        return Money(amount: convertSelf.amount + sibMoney.amount, currency: sibMoney.currency)
    }
    
    func subtract(_ sibMoney : Money) -> Money {
        let convertSelf = normalize()!.convert(sibMoney.currency)
        return Money(amount: convertSelf.amount - sibMoney.amount, currency: sibMoney.currency)
    }
    
    private func normalize() -> Money? {
        var conversion : Int = 0
        switch self.currency {
        case "USD":
            return Money(amount: self.amount, currency: "USD")
        case "GBP":
            conversion = Int((Double(self.amount) / exchangeRates["GBP"]!).rounded(.up))
            return Money(amount: conversion, currency: "GBP")
        case "EUR":
            conversion = Int((Double(self.amount) / exchangeRates["EUR"]!).rounded(.up))
            return Money(amount: conversion, currency: "EUR")
        case "CAN":
            conversion = Int((Double(self.amount) / exchangeRates["CAN"]!).rounded(.up))
            return Money(amount: conversion, currency: "CAN")
        default:
            return nil
        }
    }
}

////////////////////////////////////
// Job
//
public class Job {
    let title : String
    var type : JobType
    
    public enum JobType {
        case Hourly(Double)
        case Salary(UInt)
        
        mutating func setHourly(_ val : Double) {
            print("val, \(val)")
            self = .Hourly(val)
        }
        
        mutating func setSalary(_ val : UInt) {
            self = .Salary(val)
        }
    }
    
    init(title : String, type : JobType) {
        self.title = title
        self.type = type
    }
    
    func calculateIncome(_ multiplier : Int) -> Int {
        switch self.type {
        case .Hourly(let h):
            return Int(h.rounded(.up)) * multiplier
        case .Salary(let s):
            return Int(s)
        default:
            return 0
        }
    }
    
    func raise(byAmount: Int) {
        switch self.type {
        case .Salary(let s):
            self.type.setSalary(s + UInt(byAmount))
        default:
            print("Do Nothing")
        }
    }
    
    func raise(byAmount: Double) {
        switch self.type {
        case .Hourly(let h):
            self.type.setHourly(h + Double(UInt(byAmount)))
        default:
            print("Do Nothing")
        }
    }
    
    func raise(byPercent: Double) {
        switch self.type {
        case .Hourly(let h):
            self.type.setHourly(h * (1.0 + Double(byPercent)))
        case .Salary(let s):
            self.type.setSalary(UInt((Double(s) * (1.0 + byPercent)).rounded(.up)))
        default:
            print("Do Nothing")
        }
    }
}

////////////////////////////////////
// Person
//
public class Person {
    var firstName : String
    var lastName : String
    var age : Int
    var job : Job? {
        didSet {
            if self.age < 18 {
                self.job = nil
            }
        }
    }
    var spouse : Person? {
        didSet {
            if self.age < 18 {
                self.spouse = nil
            }
        }
    }
    
    init(firstName : String, lastName : String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    func toString() -> String {
        return "[Person: firstName:\(self.firstName) lastName:\(self.lastName) age:\(self.age) job:\(self.job) spouse:\(self.spouse)]"
    }
}

////////////////////////////////////
// Family
//
public class Family {
    var members : [Person] = []
    
    init(spouse1 : Person, spouse2 : Person) {
        if spouse1.spouse == nil && spouse2.spouse == nil {
            self.members.append(contentsOf: [spouse1, spouse2])
            spouse1.spouse = spouse2
            spouse2.spouse = spouse1
        }
    }
    
    func haveChild(_ child : Person) -> Bool {
        if self.members[0].age > 21 || self.members[1].age > 21 {
            self.members.append(child)
            return true
        } else {
            return false
        }
    }
    
    func householdIncome() -> Int {
        var totalIncome : Int = 0
        for person in self.members {
            switch person.job?.type {
            case .Hourly(let hourlyIncome):
                totalIncome += Int(hourlyIncome * 2000.0)
            case .Salary(let yearlyIncome):
                totalIncome += Int(yearlyIncome)
            default:
                totalIncome += 0
            }
        }
        return totalIncome
    }
}
