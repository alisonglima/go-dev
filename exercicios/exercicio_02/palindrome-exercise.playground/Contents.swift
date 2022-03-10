import UIKit


func isPalindrome(_ word: String) -> Bool {
    let lowecasedWord: String = word.lowercased()
    let wordReversed: String = String(lowecasedWord.reversed())
    
    return lowecasedWord == wordReversed
}


print(isPalindrome("osso"))
