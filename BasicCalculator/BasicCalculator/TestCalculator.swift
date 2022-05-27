//
//  TestCalculator.swift
//  BasicCalculator
//
//  Created by Minyoung Kim on 2022/05/26.
//

import SwiftUI



struct TestCalculator: View {

    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero , .decimal, .equal],
    ]
    
//    @State var OriginalCondition: String = ""
//
//    var buttonColor: Color {
//        switch OriginalCondition {
//        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
//            return Color(.darkGray)
//        case "AC", "⁺∕₋", "%":
//            return Color(.lightGray)
//        default:
//            return .orange
//        }
//    }
//
//    let button = [
//        ["AC", "⁺∕₋", "%", "÷"],
//        ["7", "8", "9", "×"],
//        ["4", "5", "6", "−"],
//        ["1", "2", "3", "+"],
//        ["0" , ".", "="]
//    ]
    

    
    var body: some View {
        
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                
                // Result of Calculation
                HStack{
                    Spacer()
                    Text("0228")
                        .font(.system(size: 85))
                        .foregroundColor(.white)
                    
                }.padding()
                
                // Buttons of Calculator
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { item in
                            Button(action: {

                            }){
                                
                                Text(item.rawValue)
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 80)
                                    .background(Circle()
                                        .fill(.gray))
                            }
                        }
                    }
                }
            }
        }
    }
}



struct TestCalculator_Previews: PreviewProvider {
    static var previews: some View {
        TestCalculator()
    }
}

