//: Playground - noun: a place where people can play

import UIKit

protocol Bird {
	var name: String { get }
	var canFly: Bool { get }
}
//use extensions to define default behavior for protocol members
extension Bird {
	// Flyable birds can fly!
	var canFly: Bool { return self is Flyable }
}


protocol Flyable {
	var airspeedVelocity: Double { get }
}

struct FlyingBird: Bird, Flyable {
	let name: String
	let flappyAmplitude: Double
	let flappyFrequency: Double
	
	var airspeedVelocity: Double {
		return 3 * flappyFrequency * flappyAmplitude
	}
}

struct Penguin: Bird {
	let name: String
}

struct FastBird: Bird, Flyable {
	var name: String { return "Swift \(version)" }
	let version: Double
	var airspeedVelocity: Double { return version * 1000.0 }
}

enum UnladenSwallow: Bird, Flyable {
	case african
	case european
	case unknown
	
	var name: String {
		switch self {
		case .african:
			return "African"
		case .european:
			return "European"
		case .unknown:
			return "What do you mean? African or European?"
		}
	}
	
	var airspeedVelocity: Double {
		switch self {
		case .african:
			return 10.0
		case .european:
			return 9.9
		case .unknown:
			fatalError("You are thrown from the bridge of death!")
		}
	}
}


extension UnladenSwallow {
	var canFly: Bool {
		return self != .unknown
	}
}


UnladenSwallow.unknown.canFly  // false
UnladenSwallow.african.canFly  // true
Penguin(name: "King Penguin").canFly  // false

UnladenSwallow.european.airspeedVelocity

let swbird = FlyingBird(version: 0.1, flappyAmplitude: 1.5).name
print(swbird)




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
