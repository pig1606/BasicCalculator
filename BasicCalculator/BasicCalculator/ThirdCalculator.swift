//
//  ThirdCalculator.swift
//  BasicCalculator
//
//  Created by Minyoung Kim on 2022/05/25.
//

import SwiftUI

struct ThirdCalculator: View {
    
    let button = [
        ["AC", "⁺∕₋", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "−"],
        ["1", "2", "3", "+"]
    ]
    
    @State var OriginalCondition: String = ""
    
    var buttonColor: Color {
        switch OriginalCondition {
        case "1", "2", "3", "4", "5", "6", "7", "8", "9":
            return Color(.darkGray)
        case "AC", "⁺∕₋", "%":
            return Color(.lightGray)
        default:
            return .orange
        }
    }
    
    var body: some View {
        
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                
                // Result of Calculation
                HStack{
                    Spacer()
                    Text("228")
                        .font(.system(size: 85))
                        .foregroundColor(.white)
                    
                }.padding()
                
                // Buttons of Calculator
                
                VStack{
                    ForEach(button, id: \.self) { row in
                        HStack {
                            ForEach(row, id: \.self) { item in
                                Button(action: {
                                    
                                }){
                                    
                                    Text(item)
                                        .font(.system(size: 40))
                                        .foregroundColor(.white)
                                        .frame(width: (UIScreen.main.bounds.width - 5 * 12) / 4,
                                               height: (UIScreen.main.bounds.width - (5 * 12)) / 4)
                                        .background(Circle()
                                            .fill(buttonColor))
                                    
                                }
                            }
                        }
                    }
                    
                    HStack{
                        
                        Button(action: {
                            
                        }){
                            Text("0")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .padding(.leading, 30)
                                .frame(width: (UIScreen.main.bounds.width - 4 * 12) / 4 * 2,
                                       height: (UIScreen.main.bounds.width - (5 * 12)) / 4,
                                       alignment: .leading)
                                .background(Capsule()
                                    .fill(Color(UIColor.darkGray)))
                        }
                        
                        Button(action: {
                            
                        }){
                            Text(".")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .frame(width: (UIScreen.main.bounds.width - 5 * 12) / 4,
                                       height: (UIScreen.main.bounds.width - (5 * 12)) / 4)
                                .background(Circle()
                                    .fill(Color(UIColor.darkGray)))
                        }
                        
                        Button(action: {
                            
                        }){
                            Text("=")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .frame(width: (UIScreen.main.bounds.width - 5 * 12) / 4,
                                       height: (UIScreen.main.bounds.width - (5 * 12)) / 4)
                                .background(Circle()
                                    .fill(Color.orange))
                        }
                    }
                }
            }
        }
    }
}



struct ThirdCalculator_Previews: PreviewProvider {
    static var previews: some View {
        ThirdCalculator()
    }
}
