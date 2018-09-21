import UIKit

var str = "Hello, playground"

let camel = "HelloWorldHowAreYouDoingToday"

var testString = "a     b      c"
var testString2 = "    a"

func condenseWhiteSpace(for input: String) -> String {
    var result = [Character]()
    var lastSpace = false
    
    for char in input {
        if let lastElement = result.last {
            if char == " " && lastElement == " " {
                lastSpace = true
            } else {
                lastSpace = false
            }
        }
        if !lastSpace {
            result.append(char)
        }
    }
    
    return String(result)
}


let result = condenseWhiteSpace(for: str)
print(result.count)



let r = camel.components(separatedBy: .uppercaseLetters)
r
