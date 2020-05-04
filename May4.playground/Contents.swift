import Foundation
// 2 = 10
// 3 = 11
// 4 = 100
// 5 = 101


func complementNumber(number: Int)-> Int {
    var binaryArray:[Int] = []
    if number<1 {return 0}
    var numberToConvert = number
    while numberToConvert != 1 {
        
        binaryArray.append(numberToConvert % 2)
        numberToConvert = numberToConvert/2
    }
    binaryArray.append(1)
    let complementArray = complementArrayFunc(numbers: binaryArray.reversed())
    let complementDecimal = convertToDecimal(numbers: complementArray)
    return complementDecimal
}

func complementArrayFunc(numbers: [Int])-> [Int]{
    return numbers.map {
        $0 == 1 ? 0: 1
    }
}

func convertToDecimal(numbers:[Int])->Int{
    var number:Int = 0
    
    for i in 0..<numbers.count{
        number += Int(Double(numbers [i]) * (pow(Double(2), Double(numbers.count-1 - i))))
    }
    return number
}

print(complementNumber(number: 3))

