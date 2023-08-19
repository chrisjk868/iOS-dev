import Foundation

print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    
    var operand = args.last!
    if args.count == 1 {
        return 0
    } else if args.count == 3 {
        operand = args[1]
    }
    switch operand {
    case "+":
        return Int(args[0])! + Int(args[2])!
    case "-":
        return Int(args[0])! - Int(args[2])!
    case "*":
        return Int(args[0])! * Int(args[2])!
    case "/":
        return Int(args[0])! / Int(args[2])!
    case "%":
        return Int(args[0])! % Int(args[2])!
    case "count":
        return args.count - 1
    case "avg":
        var sum : Int = 0
        for index in 0...args.count - 2 {
            sum += Int(args[index])!
        }
        return sum / (args.count - 1)
    case "fact":
        let max : Int = Int(args[0])!
        var result : Int = 1
        if max == 0 {
            return 1
        }
        for num in 1...max {
            result *= num
        }
        return result
    default:
        return 0
    }
    
}

func calculate(_ arg: String) -> Int {
    let args = arg.components(separatedBy: " ")
    var operand = args.last!
    if args.count == 1 {
        return 0
    } else if args.count == 3 {
        operand = args[1]
    }
    switch operand {
    case "+":
        return Int(args[0])! + Int(args[2])!
    case "-":
        return Int(args[0])! - Int(args[2])!
    case "*":
        return Int(args[0])! * Int(args[2])!
    case "/":
        return Int(args[0])! / Int(args[2])!
    case "%":
        return Int(args[0])! % Int(args[2])!
    case "count":
        return args.count - 1
    case "avg":
        var sum : Int = 0
        for index in 0...args.count - 2 {
            sum += Int(args[index])!
        }
        return sum / (args.count - 1)
    case "fact":
        let max : Int = Int(args[0])!
        var result : Int = 1
        if max == 0 {
            return 1
        }
        for num in 1...max {
            result *= num
        }
        return result
    default:
        return 0
    }
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1


calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values
func calculate(_ args: [String]) -> Double {
    
    var operand = args.last!
    if args.count == 1 {
        return 0
    } else if args.count == 3 {
        operand = args[1]
    }
    switch operand {
    case "+":
        return Double(args[0])! + Double(args[2])!
    case "-":
        return Double(args[0])! - Double(args[2])!
    case "*":
        return Double(args[0])! * Double(args[2])!
    case "/":
        return Double(args[0])! / Double(args[2])!
    case "%":
        return Double(args[0])!.truncatingRemainder(dividingBy: Double(args[2])!)
    default:
        return 0
    }
    
}

func calculate(_ arg: String) -> Double {
    
    let args = arg.components(separatedBy: " ")
    let operand = args.last!
    switch operand {
    case "count":
        return Double(args.count) - 1.0
    default:
        return 0
    }

}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5.0
