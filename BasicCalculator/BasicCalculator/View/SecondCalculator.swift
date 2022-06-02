//
//  SecondCalculator.swift
//  BasicCalculator
//
//  Created by Minyoung Kim on 2022/05/25.
//


//https://youtu.be/ULEFrRSPXFE
//https://youtu.be/_hY6e_LWmtg
//https://youtu.be/gxAl4gpyGwY

import SwiftUI
var numArray : [String] = ["0","1","2","3","4","5","6","7","8","9",".","AC"]
enum CalculatorButton: String {
    
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case decimal
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .plus: return "plus"
        case .minus: return "minus"
        case .multiply: return "multiply"
        case .divide: return "divide"
        case .plusMinus: return "plus.forwardslash.minus"
        case .percent: return "percent"
        case .equals: return "equal"
        case .decimal: return "."
        default:
            return "AC"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
    
}

struct SecondCalculator: View {
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    
    var body: some View {
        
        ZStack (alignment: .bottom){
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 12) {
                
                HStack{
                    Spacer()
                    Text("42")
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                }
                .padding()
                
                
                
                ForEach(buttons, id: \.self) { row in
                    HStack (spacing:12) {
                        ForEach(row, id: \.self) { button in
                            
                            Button(action: {
                                
                            }) {
                                if numArray.contains(button.title){
                                    Text(button.title)
                                        .font(.system(size: 40))
                                        .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                                        .foregroundColor(.white)
                                        .background(button.backgroundColor)
                                        .cornerRadius(self.buttonWidth(button: button))
                                }
                                else {
                                    Image(systemName: button.title)
                                        .font(.system(size: 40))
                                        .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                                        .foregroundColor(.white)
                                        .background(button.backgroundColor)
                                        .cornerRadius(self.buttonWidth(button: button))
                                }
                            }


                        }
                        
                        
                    }
                }
                
                
            }
            .padding(.bottom)
        }
        
    }
    
    func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        }
        
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct SecondCalculator_Previews: PreviewProvider {
    static var previews: some View {
        SecondCalculator()
    }
}
