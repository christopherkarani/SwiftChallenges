import UIKit

// https://www.hackerrank.com/challenges/apple-and-orange/problem
extension Sequence {
    func accumulate<Result>(_ initialResult: Result, accumulate: (Element, Result) -> Result ) -> [Result] {
        var running = initialResult
        return map { next in
            running = accumulate(next, running)
            return running
        }
    }
}

protocol Number: ExpressibleByIntegerLiteral {
    var value: Int { get }
}

extension Int : Number {
    var value: Int {
        return self
    }
}



extension Numeric  {
    subscript (power: Int) -> Self {
        return [Self](repeating: self, count: power).reduce(1) { $0 * $1 }
    }
    
    subscript (power: CGFloat) -> [Self] {
        return [Self](repeating: self, count: Int(power)).accumulate(1) { $0 * $1 }
    }
}

// Complete the countApplesAndOranges function below.
/// s: start of house location on x axis
/// t: end of house location on x axis
/// a: location of the apple tree
/// b: location of the Orange tree
/// apples: an integer array distances at which the apple falls from the tree
/// oranges: an integer array containing distances at which the apple falls from the tree
func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    let samsHouseRange = s...t
    let treeLocations = (apple: a, orange: b)
    let resultApples = apples.map { treeLocations.apple + $0 }.filter { samsHouseRange.contains($0) }
    let resultOranges = oranges.map { treeLocations.orange + $0 }.filter { samsHouseRange.contains($0) }
    print(resultApples.count)
    print(resultOranges.count)
}

