//: Playground - noun: a place where people can play

import UIKit

protocol LockUnlockProtocol {
    func lock() -> String
    func unlock() -> String
}

class House: LockUnlockProtocol {
    func lock() -> String {
        return "House Lock"
    }
    
    func unlock() -> String {
        return "House Unlock"
    }
}

class Vehicle: LockUnlockProtocol {
    func lock() -> String {
        return "Vehicle Lock"
    }
    
    func unlock() -> String {
        return "Vehicle Unlock"
    }
}

let myHouse = House()
myHouse.lock()
myHouse.unlock()

let myVehicle = Vehicle()
myVehicle.lock()
myVehicle.unlock()

//协议中可以增加属性 { set get }
protocol NewLockUnlockProtocal {
    var locked : Bool { set get }
    func lock() -> String
    func unlock() -> String
}

class Safe: NewLockUnlockProtocal {
    var locked: Bool = false
    var test : String?
    
    func lock() -> String {
        locked = true
        return "lock"
    }
    
    func unlock() -> String {
        locked = false
        return "unlock"
    }
}

var mySafe = Safe()
mySafe.lock()
mySafe.unlock()

//可以遵循多协议
protocol AreaComputationProtocol {
    func computerArea() -> Double
}

protocol PerimeterComputationProtocol {
    func computerPerimeter() -> Double
}

struct Rectangle : AreaComputationProtocol, PerimeterComputationProtocol {
    var width , height : Double
    
    func computerArea() -> Double {
        return width * height
    }
    
    func computerPerimeter() -> Double {
        return (width + height) * 2
    }
}

class RectangleClass: AreaComputationProtocol, PerimeterComputationProtocol {
    var width , height : Double
    
    init(width : Double, height : Double) {
        self.width = width
        self.height = height
    }
    
    func computerArea() -> Double {
        return width * height
    }
    
    func computerPerimeter() -> Double {
        return (width + height) * 2
    }
}

var square = Rectangle(width: 10, height: 10);
var rectangle = Rectangle(width: 20, height: 10);

square.computerArea()
square.computerPerimeter()

rectangle.computerArea()
rectangle.computerPerimeter()

let squareClass = RectangleClass(width: 10, height: 10)
squareClass.computerArea()
squareClass.computerPerimeter()

//协议可以继承
protocol TriangleProtocol : AreaComputationProtocol, PerimeterComputationProtocol {
    var a : Double {get set}
    var b : Double {get set}
    var c : Double {get set}
    var base : Double {get set}
    var height : Double {get set}
}

struct Triangle : TriangleProtocol{
    var a, b, c : Double
    var base, height: Double
    
    func computerArea() -> Double {
        return base * height / 2
    }
    
    func computerPerimeter() -> Double {
        return a + b + c
    }
}

let triangle = Triangle(a: 4, b: 5, c: 6, base: 10, height: 12)
triangle.computerPerimeter()
triangle.computerArea()

//委托
protocol VendingMachineProtocol {
    var coinInserted : Bool {get set}
    func shouldVend() -> Bool
}

class Vendor: VendingMachineProtocol {
    var coinInserted: Bool = false
    func shouldVend() -> Bool {
        if coinInserted {
            coinInserted = false
            return true
        }
        return false
    }
}

class ColaMachine {
    var vendor : VendingMachineProtocol
    
    init(vendor : VendingMachineProtocol) {
        self.vendor = vendor
    }
    
    func insertCoin(){
        vendor.coinInserted = true
    }
    
    func pressColaButton() -> String {
        if vendor.shouldVend() {
            return "Here is your cola"
        }else {
            return "You muset insert a coin"
        }
    }
}

var cola = ColaMachine(vendor: Vendor())
cola.pressColaButton()
cola.insertCoin()
cola.pressColaButton()

//扩展
extension ColaMachine {
    func pressDietColaButton() -> String {
        if vendor.shouldVend() {
            return "Here is your Diet Cola"
        }else {
            return "Your must insert a coin"
        }
    }
}

var newCola = ColaMachine(vendor: Vendor())
newCola.pressDietColaButton()
newCola.insertCoin()
newCola.pressDietColaButton()

//在拓展中添加计算属性 var name : type { code }
extension Int {
    var kb : Int { return self * 1024 }
    var mb : Int { return self * 1024 * 1024 }
    var gb : Int { return self * 1024 * 1024 * 1024 }
}

var x : Int = 4.kb
var y : Int = 4.mb
var z : Int = 4.gb

//通过扩展添加方法
extension String {
    func prependString(value : String) -> String {
        return value + self
    }
    
    func appendString(value : String) -> String {
        return self + value
    }
}

var testString = "x".prependString("kobe")
testString = "x".appendString("kobe")

//mutating
extension Int {
    mutating func triple() {
        self *= 3
    }
}

var trip = 3
trip.triple()

//扩展 + 闭包
extension Int {
    func repeats(work : (times : Int) -> ()) {
        for i in 0...self {
            work(times: i)
        }
    }
}

5.repeats { (times) in
    print("repeat \(times)")
}