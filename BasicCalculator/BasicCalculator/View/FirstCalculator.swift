//
//  ContentView.swift
//  BasicCalculator
//
//  Created by Minyoung Kim on 2022/05/20.
//


//https://youtu.be/cMde7jhQlZI

import SwiftUI

extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

enum CalcButton: String {
    
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case plus = "+"
    case minus = "−"
    case divide = "÷"
    case multiply = "×"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "⁺∕₋"
    
    var buttonColor: Color {
        switch self {
        case .plus, .minus, .multiply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(.darkGray)
        }
    }
    
    var buttonTextColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return .black
        default:
            return .white
            
        }
    }
}

class GlobalEnvironment: ObservableObject {
    
    @Published var display = "0"
    
    private var isFinishedTypingNumber: Bool = true
    private var lastInput: CalcButton?
    
    private var displayValue: Double {
        get {
            guard let number = Double(self.display) else { fatalError("Cannot convert display label text to a Double") }
            return number
        }
        set {
            self.display = newValue.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", newValue) : String(newValue)
        }
    }

    private var calculator = CalculatorLogic()
    
    private func isLastInputOperator() -> Bool {
        guard let lastInput = lastInput else { return false }
            return lastInput == .divide || lastInput == .multiply || lastInput == .plus || lastInput == .minus
    }
    
    func receiveInput(calculatorButton: CalcButton) {

        switch calculatorButton {
        case .clear, .negative, .percent, .divide, .multiply, .minus, .plus, .equal:
            
            // check for two consecutive operators
            if isLastInputOperator() { break }
            
            isFinishedTypingNumber = true
            
            calculator.setNumber(displayValue)

            if let result = calculator.calculate(symbol: calculatorButton) {
                displayValue = result
            }
            
        default:
            
            if isFinishedTypingNumber {
                
                // do not duplicate zeros
                if displayValue == 0 && calculatorButton == .zero { return }
                
                if calculatorButton == .decimal {
                    self.display = "0" + calculatorButton.rawValue
                } else { self.display = calculatorButton.rawValue }
                
                isFinishedTypingNumber = false
                
            } else {
                
                if calculatorButton == .decimal {
                    
                    // check if number is whole number
                    if self.display.contains(".") { return }

                    // check if number already has a decimal
                    let isInt = floor(displayValue) == displayValue
                    if !isInt { return }
                }
                self.display = self.display + calculatorButton.rawValue
            }
        }
        lastInput = calculatorButton
    }
}


struct FirstCalculator: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero , .decimal, .equal],
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // 계산 결과
                HStack {
                    Spacer()
                    Text(env.display)
                        .font(.system(size: 85))
                        .foregroundColor(.white)
                }
                .padding()
                
                
                // 계산기 버튼
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12){
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.env.receiveInput(calculatorButton: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 40))
                                    .fontWeight(.medium)
                                    .padding(.leading, self.buttonPadding(item: item))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight(),
                                        alignment: self.buttonAlignment(item: item)
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(item.buttonTextColor)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
        
    }
    
    
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonAlignment(item: CalcButton) -> Alignment {
        if item == .zero {
            return .leading
        }
        return .center
    }
    
    func buttonPadding(item: CalcButton) -> CGFloat {
        if item == .zero {
            return 30
        }
        return 0
    }
}


struct FirstCalculator_Previews: PreviewProvider {
    static var previews: some View {
        FirstCalculator().environmentObject(GlobalEnvironment())
    }
}
