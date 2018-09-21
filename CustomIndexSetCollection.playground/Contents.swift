import XCTest

var str = "Hello, playground"

struct IndexSet {
    var sortedRanges: [ClosedRange<Int>] = []
    
    mutating func append(_ element: ClosedRange<Int>) {
        sortedRanges.append(element)
        sortedRanges.sort { $0.lowerBound < $1.lowerBound }
    }
}

var i = IndexSet()
i.append(1...3)
i.append(3...5)

class IndexSetTests: XCTestCase {
    func testInsertion() {
        var indexSet = IndexSet()
        indexSet.append(1...3)
        indexSet.append(5...7)
        XCTAssert(indexSet.sortedRanges == [1...3, 5...7])
    }
}

let test = IndexSetTests()
test.testInsertion()

