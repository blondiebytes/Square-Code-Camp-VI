// API with two parts:

// 1. Given a long input string and some word, return the number of times that words appears 

// - split over whitespade
// - lowercase the strings
// - We need to keep some punctation, but not others

// make sure you test youreslf

// 2. Given a long input string and some number n, return the nth most frequent word in the string. 

import Foundation

// Recognize get stuff by being opinionated about input 

// Better to have overhead then quick speed later

struct WordCounter {
    
    // NSCountedSet --> happy set methods 
    // init with array --> one line dictionary making
   
    let wordCounts: NSCountedSet
    
    init(longInputString:String) {
        self.wordCounts = NSCountedSet(array: WordCounter.wordList(longInputString))
    }
    
    func countForWord(searchWord:String) -> Int {
        return self.wordCounts.countForObject(searchWord.lowercaseString)
    }
    
    static func wordList(longInputString: String) -> [String] {
        let wordList = longInputString.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        return wordList.map({word in word.lowercaseString.stringByTrimmingCharactersInSet(NSCharacterSet.punctuationCharacterSet())})
    }

}

let testCounter = WordCounter(longInputString: "Yo dawg, I heard you like sentences.")

testCounter.countForWord("YO")
testCounter.countForWord("sentences")



