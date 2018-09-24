//: Playground

import UIKit

//Basics
var str = "Hello, playground"
let tmp = "temp"

//Tuples
var myTuple1 : (x: Int, y: Int)
myTuple1.x = 0
myTuple1.y = 2

//tuple with type inference
let myTuple = (x: 10, y: 20)
print(myTuple.x)
print(myTuple.y)

//Optionals ---------------------------------------------
//Initializing
var optString:String?
optString = "optstrings" //we must initialize an optional, or unwrapping will cause a crash
print(optString!)

var optional1: String? = nil //will work but, see below
var optional2: String? = .none //The CORRECT way to initialize an optional value to an nothing
print("optional is \(String(describing: optional2))")

//Optional Binding
var someOptional:String?
someOptional = "Hello"

//Optional binding checks for nil value in optional
if let myCopy = someOptional {//automatically unwraps someOptional if valid, so no ! needed
	print(myCopy + " there")
} else {
	print("someOptional is nil")
}

//Nil Coalescing:
//Use ?? (called the nil coalescing operator) to give an optional a default value if it doesn't have one. For example:
var myStr:String? = nil
let constantName = myStr ?? "nothing" //if myStr exits, use the value, else use what comes after ??

//Implicitly unwrapped optional
var myStrUnwrapped: String! = "Hello"//So we don't need to ever unwrap (nil will crash)


// Arrays ---------------------------------------------
var stuff = [String]()
stuff.append("first")
print(stuff)

//Array functions
func combineArrays(_ array1: [Int],
									 _ array2: [Int],
									 _ closure: (Int,Int) -> Int) -> [Int] {
	var result: [Int] = []
	for i in 0..<array1.count {
		result.append(closure(array1[i],array2[i]))
	}
	return result
}

var array1 = [1,2,3,4]
var array2 = [5,5,5,3]
combineArrays(array1,array2) {
	$0 * $1
}

//Loops ---------------------------------------------
for number in [0,1,2,3,4] {
	print(number)
}

for number in array1 {
	print(number)
}

//same loop using Ranges
for number in 0...4 {
	print(number)
}

var n = 0
while n < 5 {
	n = n + 1
	print(n)
}

repeat {
	n = n - 1
} while n > 0

//shortcut
for _ in 0...5 {
	print("Hello!")
}

//for each using closure
let testArray = [11,12,13,14]
testArray.forEach{
	print($0)
}

//Sorting (arrays)  ---------------------------------------------
let animals = ["fish", "cat", "chicken", "dog"]

//Sort the array of names alphabetically

//Long method
var sortedAnimals = animals.sorted { (one: String, two: String) -> Bool in
	return one < two
}

//Another long method
sortedAnimals = animals.sorted { (one, two) -> Bool in
	return one < two
}

//The return type can also be inferred, so drop it:
sortedAnimals = animals.sorted { (one, two) in
	return one < two
}

//The $i notation can substitute the parameter names:
sortedAnimals = animals.sorted {
	return $0 < $1
}

//In single statement closures, the return keyword can be omitted. The return value of the last statement becomes the return value of the closure:
sortedAnimals = animals.sorted {
	$0 < $1
}

//This is simpler already, but don't stop now!


//For strings, there's a comparison function defined as follows:
//func <(lhs: String, rhs: String) -> Bool

//This neat little function makes your code as easy as:
sortedAnimals = animals.sorted(by: <)


//Map will work on each element of the array, for example
var mappedAnimals = animals.map { x in
	return x.capitalized(with: nil)//return capitalized string for each array element
}
print(mappedAnimals)

mappedAnimals = animals.map { x in
	let index = x.index(x.startIndex, offsetBy: 2)//get third character
	return String(x[index])
}
print(mappedAnimals)

//Filter results
//returns elements starting with the letter "f"
var filteredAnimals = animals.filter{ x in
	if(x[x.startIndex] == "f"){
		return true
	} else {
		return false
	}
}
print(filteredAnimals)

// Dictionaries ---------------------------------------------
var dict = [Int:String]()
dict = [0:"first"]
dict.updateValue("second", forKey: 1)
print(dict)


//Functions ---------------------------------------------

//External parameters - Simply requires names for parameters(i.e. from and to
func sendMessage(from name1 :String, to name2 :String) {
	print("Sending message from \(name1) to \(name2)")
}
//Call like:
sendMessage(from: "me", to: "you")

//without external parameters
func sendMessage2(_ name1 :String, _ name2 :String) {
	print("Sending message from \(name1) to \(name2)")
}
//Call like:
sendMessage2("me", "you")

//Basic function - Takes a string parameter, returns a string
func manipulateString(value:String) -> String {
	let output = value
	//do stuff
	return output
}

//Pass a function
func updateString(aFunction:(String)->(String),value:String){
	print("new string: \(aFunction(value))")
}
updateString(aFunction: manipulateString,value: "DoStuffToString")


// Classes ---------------------------------------------
class juice { //abstract class
	var t = "mug"
	var u:String = ""
	let n:Int = 0
	var v = [String]()
	
	func testFunction() {
		var tmp:String? = nil
		tmp = "temp"
		print(tmp!)
	}
}

class orangejuice : juice { //concrete class
	 override func testFunction() {
		var tmp:String? = nil
		tmp = "override Temp"
		print(tmp!)
	}
}

var oj = orangejuice()
oj.v.append("initval")

//Class - member update example
class Address {
	var fullAddress: String
	var city: String
	
	init(fullAddress: String, city: String) {
		self.fullAddress = fullAddress
		self.city = city
	}
}

class Person {
	var name: String
	var address: Address
	
	init(name: String, address: Address) {
		self.name = name
		self.address = address
	}
}

var headquarters = Address(fullAddress: "123 Tutorial Street", city: "Appletown")
var ray = Person(name: "Ray", address: headquarters)
var brian = Person(name: "Brian", address: headquarters)

//What happens when we do this?
brian.address.fullAddress = "148 Tutorial Street"
//answer: this will update both Ray and Brian's address due to reference semantics

print(brian.address.fullAddress)
print(ray.address.fullAddress)

//Class deinitializer
//If you need to perform additional cleanup of your custom classes,
//it's possible to define a block called deinit. The syntax is the following:
//deinit { //Your statements for cleanup here }
	
// Structs ---------------------------------------------
struct levels {
	var begin:Int
	var middle:Double?
	func aStructFunction() -> Void {
		
	}
}

let lvl = levels(begin: 1,middle: 2.1)
print(lvl)


//Enumerations -------------------------
enum CompassPoint : String {
	case north = "N"
	case south
	case east
	case west
	func dothis() -> Bool { return true }
}

let cpa = CompassPoint.north.rawValue //raw value is the assigned value, if there is one
let cpq = CompassPoint.north

let cp = CompassPoint.south.rawValue //if no assigned value

let cpn = CompassPoint.north.dothis()


enum errors : Int {
	case basic = 1 //when first case is assigned an int, the subsequent cases will adopt the next integer value
	case serious
	case critical
}

print(errors.serious.rawValue)
print(errors.critical.rawValue)

//Use of Convertibles ---------------------------------------------
//Declare struct
public struct Thermometer {
	public var temperature: Double
	public init(temperature: Double) {
		self.temperature = temperature
	}
}
//add extension
extension Thermometer : ExpressibleByFloatLiteral {
	public init(floatLiteral value: FloatLiteralType) {
		self.init(temperature: value)
	}
}

//The extension allows us to initialize like this(using the ExpressibleByFloatLiteral protocol )
var thermometer: Thermometer = 56.8


//Generics  ---------------------------------------------
func iterateArray1<T>(arrayVal myArray:[T]) {
	for value in myArray{
		print(value)
	}
}
iterateArray1(arrayVal: [1.001,2.002])

//(note: the underscore in parameters allows calling without "myArray" in caller)
func iterateArray<T>(_ myArray:[T]) {
	for value in myArray{
		print(value)
	}
}

iterateArray([100,200])
iterateArray(["floyd","zeppelin"])

//Generic class
protocol smokeable {
  func smokeit()
}

class smokingbar<T:smokeable> {
  func dostuff(){}
  var tmp : String = ""
}

struct cigar : smokeable {
  func smokeit() {
    print("smoking")
  }
}

//cigar must conform to smokeable protocol to satisfy smokingbar class constraint
let bar = smokingbar<cigar>()


//Advanced generic class with more constraints etc..
protocol Stackable: class { //constraint: conforming type must be a class
  //An Associated Type is just
  // different syntax for Generics in protocols(i.e. protocol Stackable:<Element>)
  //An associated type gives a placeholder name to a type that is used as part of the protocol
  //the Element alias provides a way to refer to the type of the items in a Container
  associatedtype Element: Comparable //for example: Element is what we are refering to in this protocol
  func push(_ element: Element)
  func pop() -> Element?
}

class Stack<Element>: Stackable where Element: Comparable { //constraint: Element must be Comparable
  private var storage: [Element] = []
  func push(_ element: Element) { storage.append(element) }
  func pop() -> Element? { return storage.popLast() }
}

var stack1 = Stack<Int>()
stack1.push(13)
stack1.push(3)
stack1.pop()

var stack2 = Stack<Int>()

func pushToAll<S: Stackable>(stacks: [S], value: S.Element) {
  stacks.forEach { $0.push(value) }
}

pushToAll(stacks: [stack1, stack2], value: 4)

dump(stack1)
dump(stack2)



//A Closure is a Function without a name --------------------------------------
// example
let someInt = 11
var one: (Int) {
	return someInt;
}
print(one)

// example - (takes an int, and returns an int)
var double: (Int) -> (Int) = {
	return $0 * 2 //$0 is first parameter
}
print(double(1))

// example - (takes 2 ints, and returns an int)
var double2: (Int, Int) -> (Int) = { x,y in
	return 2 * x * y
}
print(double2(2,4))

//example - closure scope
//this prints "I love cars" since the thing is not updated before let closure
var thing = "cars"
let closure = { [thing] in
	print("I love \(thing)")
}
thing = "airplanes"
closure()

let cls : (String)->() = {
	print($0)
}
cls("...value.....")

let cls2 : (String)->() = { a in
	print(a)
}
cls2("...value222.....")


//Another example
func forEach(_ array: [Int], _ closure: (Int) -> ()) {
	for number in array {
		closure(number)
	}
}
forEach([10, 20, 30, 40]) {
	print($0 + 1)
}


//Extension Methods ---------------------------------------------
//- Allow you to override a generic type...like Array
func countUniques<T: Comparable>(array: Array<T>) -> Int {
	let sorted = array.sorted(by: <)
	let initial: (T?, Int) = (.none, 0)
	let reduced = sorted.reduce(initial) { ($1, $0.0 == $1 ? $0.1 : $0.1 + 1) }
	return reduced.1
}

//Above as Extension method
extension Array where Element: Comparable {
	func countUniques() -> Int {
		let sorted1 = sorted(by: <)
		let initial: (Element?, Int) = (.none, 0)
		let reduced = sorted1.reduce(initial) { ($1, $0.0 == $1 ? $0.1 : $0.1 + 1) }
		return reduced.1
	}
}


//Guard Statement ---------------------------------------------
//you tell guard what you want to be the case rather than the reverse. guard is used specifically for trapping invalid parameters being passed to a method
func checkAge(age: Int) {
	guard age > 18 else {
		print("rejected")
		return
	}
}
checkAge(age: 17)


//Protocols  ---------------------------------------------
//Short Definition: A set of rules/requirements that are required by a class to implement some particular task or functionality.
//Long Definition: A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol

//Alt Definition: a protocol says to a struct,class or enum that if you want to be THAT, then do this and this and this.

//Example: if you want to be a human, you have to EAT, SLEEP, and Take REST

protocol SomeProtocol {
	// protocol definition
	var how_much:Int {get set}
	func stuff() -> String //protocol methods cannot have bodies
}

//extension on protocol
extension SomeProtocol {
	func stuff() -> String {
		return "main stuff"
	}
}

struct someStruct: SomeProtocol {
	var how_much: Int = 1
	//since there is an extension on SomeProtocol, we don't need to implement the stuff() method
}

var ss = someStruct()
let sstuff = ss.stuff()
print(sstuff)

class SomeClass: SomeProtocol {
	//implement protocol - required
	var how_much: Int = 5
	func stuff() -> String {
		return "more stuff"
	}
}

var sc = SomeClass()
let scstuff = sc.stuff()
print(scstuff)


//Protocol as a type
protocol RandomNumberGenerator {
  func random() -> Double
}

class Dice {
  let sides: Int
  let generator: RandomNumberGenerator //Protocol
  init(sides: Int, generator: RandomNumberGenerator) {
    self.sides = sides
    self.generator = generator
  }
  func roll() -> Int {
    return Int(generator.random() * Double(sides)) + 1
  }
}

//myGenerator adopts the RandomNumberGenerator protocol
struct myGenerator : RandomNumberGenerator {
  func random() -> Double {
    return 1.1
  }
}

//create instance to pass to the dice
let theGenerator = myGenerator()
//init the dice
let theDice = Dice(sides: 5,generator: theGenerator)

//Error Handling  ---------------------------------------------
//	In Swift, it's possible to declare that a function throws an error. It is, therefore, the caller's responsibility to handle the error or propagate it. This is similar to how Java handles the situation.
//
//	You simply declare that a function can throw an error by appending the throws keyword to the function name. Any function that calls such a method must call it from a try block.
	
func canThrowErrors() throws -> Bool {
	return false
}
	
//How to call a method that throws an error
try canThrowErrors()//must use try

// or..
do {
	try canThrowErrors()
} catch {
	print(error) //error is a magic variable with the thrown error
}
	
//Or specify it as an optional
let maybe = try? canThrowErrors()


//can also use enum with Error protocol
enum FileError : Error {
	case fileNotFound(String)
}

do {
	throw FileError.fileNotFound("no file found")
}
catch FileError.fileNotFound(let message){
	print(message)
}
	
	
////can convert error to NSError
//catch(let error as NSError){
//	print("NSError:", error.code, error.domain,error.userInfo)
//}
catch {
	print(error)
}

//Allow multi-line string declaration
let st = """
hello world
"""
print(st)

//Strings

//reverse a string
//var myString = "Hello"
//
//var index = 0
//while index < myString.count {
//	var lastchar = myString.last
//	print(lastchar ?? "")
//	myString.insert(lastchar!, at: myString.index(myString.startIndex, offsetBy: index))
//	myString.remove(at: myString.index(of: myString.last!)!)
//	index = index + 1
//}
//
//print(myString)


//Recursion
func printFrom(_ N: Int) {
	print(N)
	if N > 1 {
		printFrom(N - 1)
	}
}

printFrom(5)

