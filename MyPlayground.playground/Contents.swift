print("hello world")

var x = 12

var s = String(x)

var y = Int(s)

var doubleValue: Double = 20

print(doubleValue)

var robert : String = "robert"

var hello : String = "hello"

print(hello == "hello")

var helloRobert = hello + " " + robert

var charValue : Character = "A"

var hexValue = 0x32

var strinValue = "\(hello) \(robert)"

var tupleValue = (1, "2", 3.0)

print("\(tupleValue.0) \(tupleValue.1) \(tupleValue.2)")

//可选类型 可为nil
var nilValue : Int?

nilValue = 4

var arrayValue : [String] = ["1", "2", "3"]

arrayValue.append("4")

arrayValue += ["5"]

arrayValue += ["6", "7"]

arrayValue[2] = "-3"

print(arrayValue)

arrayValue.removeAtIndex(2)

print(arrayValue)

arrayValue.insert("33", atIndex: 2)

//数组合并
var arrayAdd = arrayValue + arrayValue

var dicValue = ["a" : 1, "b" : 2, "c" : 3, "d" : 4]

print(dicValue["a"])

print(dicValue["e"])

dicValue["e"] = 5

dicValue["a"] = 0

print(dicValue)

dicValue.removeValueForKey("a")

var emptyArray : Array<Int> = []

emptyArray = [1, 2, 3]

emptyArray += [4]

emptyArray = []

var emptyDic : Dictionary<String, Double> = [:]

emptyDic = ["a" : 1]

print(emptyDic)

for char in arrayValue {
    print(char);
}

for (index, char) in arrayValue.enumerate() {
    print("\(char) \(index)")
}

for (key, value) in dicValue {
    print("\(key) \(value)")
}

var loopCount : Int = 0

//循环次数控制 1...10 1到10
for loopCount in 1...10 {
    print(loopCount)
}

//循环次数控制 1..<10 1到9
for loopCount in 1..<10 {
    print(loopCount)
}

for loopCount = 0; loopCount < 10; loopCount += 2 {
    print(loopCount)
}

var str = "hello"

//字符串相等判断 使用==
if str == "hello" {
    print("hi")
}else {
    print("bye")
}

var treeArray = ["Oak", "Pecan", "Maple", "Cherry"]

//switch 可以比较字符串 不需要break case可以是个范围 4...9
for tree in treeArray {
    switch tree {
        case "Oak":
            print("Oak")
        case "Pecan", "Cherry":
            print("Pecan")
        case "Maple":
            print("Maple")
        default:
            print("Wood")
    }
}

