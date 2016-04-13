//: Playground - noun: a place where people can play

import UIKit

class Door {
    var opened : Bool = false
    var locked : Bool = false
    let width : Int
    let height : Int
    let weight : Int
    var color : String
    
    init(width : Int = 32, height : Int = 72, weight : Int = 10, color : String = "Red"){
        self.width = width
        self.height = height
        self.weight = weight
        self.color = color
    }
    
    func open() -> String {
        opened = true
        return "the door is open"
    }
    
    func close() -> String {
        opened = false
        return "the door is closed"
    }
    
    func lock() -> String {
        locked = true
        return "the door is locked"
    }
    
    func unlock() -> String {
        locked = false
        return "the door is unlocked"
    }
}

let frontDoor = Door(width: 11, height: 12, weight: 13, color: "Green")
frontDoor.open()
frontDoor.close()

frontDoor.lock()
frontDoor.unlock()

frontDoor.opened
frontDoor.locked

frontDoor.color = "Yellow"

//父类
class Portal {
    var opened : Bool = false
    var locked : Bool = false
    let width : Int
    let height : Int
    let weight : Int
    let name : String
    var color : String
    
    init(name : String, width : Int = 32, height : Int = 72, weight : Int = 10, color : String = "Red"){
        self.name = name
        self.width = width
        self.height = height
        self.weight = weight
        self.color = color
    }
    
    func open() -> String {
        if opened {
            return "The \(name) is already open"
        }else {
            opened = true
            return "The \(name) is open"
        }
    }
    
    func close() -> String {
        if opened {
            opened = false
            return "The \(name) is closed"
        }else {
            return "The \(name) is already closed"
        }
    }
    
    func lock() -> String {
        if opened {
            return "Can't lock a open \(name)"
        }else {
            locked = true
            return "The \(name) is lock"
        }
    }
    
    func unlock() -> String {
        if opened {
            return "Can't unlock a open \(name)"
        }else {
            locked = false
            return "The \(name) is unlock"
        }
    }
}

//子类
class NiceDoor: Portal {
    init(width: Int, height: Int, weight: Int, color: String) {
        super.init(name: "Door", width: width, height: height, weight: width, color: color)
    }
}

class NiceWindow: Portal {
    init(width: Int, height: Int, weight: Int, color: String) {
        super.init(name: "Window", width: width, height: height, weight: weight, color: color)
    }
}

let niceDoor = NiceDoor(width: 11, height: 22, weight: 33, color: "Black")
let niceWindow = NiceWindow(width: 11, height: 22, weight: 33, color: "White")

//便利初始化方法
class Tractor {
    let horsePower : Int
    let color : String
    
    init(horsePower : Int, color : String) {
        self.horsePower = horsePower
        self.color = color
    }
    
    convenience init(horsePower : Int) {
        self.init(horsePower: horsePower, color: "Red")
    }
    
    convenience init() {
        self.init(horsePower: 40, color: "Green")
    }
}

let tractor1 = Tractor(horsePower: 1, color: "Yellow")
let tractor2 = Tractor(horsePower: 2)
let tractor3 = Tractor()

//枚举
enum FuelType : String {
    case Gasoline = "89 octane"
    case Diesel = "sulphur free"
}

let fuelCase = FuelType.Gasoline.rawValue
var engine : FuelType = FuelType.Gasoline


enum TransmissionType {
    case Manual4Gear
    case Manual5Gear
    case Automatic
}
//结构体 结构体可以有方法
struct Vehicle {
    var fuel : FuelType
    var transmission : TransmissionType
    func log() -> String {
        return "\(fuel) \(transmission)"
    }
}

var dieselAutomatic = Vehicle(fuel: FuelType.Diesel, transmission: TransmissionType.Automatic)
dieselAutomatic.log()

//值类型 深拷贝
struct Structure {
    var copyVar : Int = 10
}

var structure1 = Structure()
var structure2 = structure1

structure2.copyVar = 20

print("\(structure1.copyVar) \(structure2.copyVar)")

//引用类型 引用
class Class {
    var copyVar : Int = 10
}

var class1 = Class()
var class2 = class1

class2.copyVar = 20

print("\(class1.copyVar) \(class2.copyVar)")