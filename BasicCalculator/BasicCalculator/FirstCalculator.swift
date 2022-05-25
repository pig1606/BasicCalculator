//
//  ContentView.swift
//  BasicCalculator
//
//  Created by Minyoung Kim on 2022/05/20.
//




//https://youtu.be/cMde7jhQlZI

import SwiftUI

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
    case add = "+"
    case subtract = "-" 
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct FirstCalculator: View {
    
    @EnvironmentObject var VarCollectionSheet : VarCollection
    //varCollection에서 끌어오기
    

    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero , .decimal, .equal],
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                // Text display
                HStack {
                    Spacer()
                    Text(VarCollectionSheet.value)
                    //밸류 varCollectionSheet에서 끌어오기
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                
                // Our buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12){
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 40))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
        
    }
    
    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = Int(VarCollectionSheet.value) ?? 0
            }
            else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Int(VarCollectionSheet.value) ?? 0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Int(VarCollectionSheet.value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(VarCollectionSheet.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(VarCollectionSheet.value) ?? 0
                switch self.currentOperation {
                case .add: VarCollectionSheet.value = "\(runningValue + currentValue)"
                case .subtract: VarCollectionSheet.value = "\(runningValue - currentValue)"
                case .multiply: VarCollectionSheet.value = "\(runningValue * currentValue)"
                case .divide: VarCollectionSheet.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            
            if button != .equal {
                VarCollectionSheet.value = "0"
            }
        case .clear:
            VarCollectionSheet.value = "0"
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if VarCollectionSheet.value == "0" {
                VarCollectionSheet.value = number
            }
            else {
                VarCollectionSheet.value = "\(VarCollectionSheet.value)\(number)"
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
}

struct FirstCalculator_Previews: PreviewProvider {
    static var previews: some View {
        FirstCalculator()
    }
}
