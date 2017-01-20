import Foundation
import XCTest

class Foo {
    private let bar = Bar()
    func getStuff() -> String {
        return bar.funTimes()
    }
}

class Bar {
    private let snafu = Snafu()
    func funTimes() -> String {
        return snafu.doReallyHardStuff("REALLY")
    }
}

class Snafu {
    func doReallyHardStuff(_ howBad: String) -> String {
        // Really Hard Stuff happens here
        return "This string was \(howBad) hard to get"
    }
}

let foo = Foo()

XCTAssertEqual(foo.getStuff(), "This string was REALLY hard to get") // Problem! This requires a concrete Snafu implementation and therefore takes 10 seconds to run

class FooTwo {
    private let bar: BarProtocol
    init(bar: BarProtocol) {
        self.bar = bar
    }
    func getStuff() -> String {
        return bar.funTimes()
    }
}

protocol BarProtocol {
    func funTimes() -> String
}

class BarWho: BarProtocol {
    func funTimes() -> String {
        return "This string was really FUN to get :D"
    }
}

let foo2 = FooTwo(bar: BarWho())

XCTAssertEqual(foo2.getStuff(), "This string was really FUN to get :D")
