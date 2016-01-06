//: Playground - noun: a place where people can play

import Foundation

// Value-type
// Once we set values, they aren't mutable.
// Structs b/c we don't want mutability
struct StockGrant {
    
    struct GrantDate
    {
        let month:UInt
        let day:UInt
        let year:UInt
        
        init(month:UInt, day:UInt, year:UInt) {
            self.month = month
            self.day = day
            self.year = year
        }
        
    }
    
    let shares: UInt
    let strikePrice: Double
    // NS -> Next Step
    let grantDate: GrantDate
    let cliffMonths: UInt
    let endMonths: UInt
    
    init(shares: UInt, strikePrice:Double, grantDate: GrantDate, cliffMonths: UInt, endMonths:UInt) {
        self.shares = shares
        self.strikePrice = strikePrice
        self.grantDate = grantDate
        self.cliffMonths = cliffMonths
        self.endMonths = endMonths
    }
    
    func valueAfter(months:Int, atPrice: Double) -> Double {
        // Protect yourself against bad inputs
        if (months < Int(self.cliffMonths)) {
            return 0
        }
        
        if (months > Int(self.endMonths)) {
            return self.valueAfter(Int(self.endMonths), atPrice: atPrice)
        }
        
        if (atPrice < self.strikePrice) {
            return 0
        }
        
        let shareValue = atPrice - self.strikePrice
        let sharesAccrued = floor(Double(months) / Double(self.endMonths) * Double(self.shares))
        return shareValue * sharesAccrued
    }
    
    // returning a function
    func curriedValue(months:Int) -> (Double) -> Double {
        // returning a closure
        // code
        return { price in return self.valueAfter(months, atPrice: price) }
    }
    
}

let newYears = StockGrant.GrantDate(month: 1, day: 1, year: 2016)

let test = StockGrant(shares: 10000, strikePrice: 4.00, grantDate: newYears, cliffMonths: 12, endMonths: 48)

test.valueAfter(11, atPrice: 200000)
test.valueAfter(12, atPrice: 200000)
test.valueAfter(11, atPrice: 200000)

let curriedTest = test.curriedValue(12)
curriedTest(10)
curriedTest(100)




