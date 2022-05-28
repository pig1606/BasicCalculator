//
//  ThirdCalculator.swift
//  BasicCalculator
//
//  Created by Minyoung Kim on 2022/05/25.
//

import SwiftUI

struct ThirdCalculator: View {
    
    let button: [[String]] = [
        ["AC", "⁺∕₋", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "−"],
        ["1", "2", "3", "+"]
    ]
    
    func buttonColor(_ item: String) -> Color {
        switch item {
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
                                            .fill(self.buttonColor(item)))
                                    
                                }
                            }
                        }
                    }
                    
                    HStack{
                        
                        CustomButton(num: "0", ratio: 2, edges: .leading, length: 30, alignment: .leading)
                        CustomButton(num: ".")
                        CustomButton(num: "=", color: Color.orange)
                        
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

struct CustomButton: View {
   
    let num: String
    let ratio: CGFloat
    let edges: Edge.Set
    let length: CGFloat?
    let alignment: Alignment
    let color: Color
    
    init(num: String, ratio: CGFloat = 1, edges: Edge.Set = .all, length: CGFloat? = nil, alignment: Alignment = .center, color: Color = Color(UIColor.darkGray)) {
        self.num = num
        self.ratio = ratio
        self.edges = edges
        self.length = length
        self.alignment = alignment
        self.color = color
    }
    
    var body: some View {
        Button(action: {
            
        }){
            Text(num)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .padding(edges, length)
                .frame(width: (UIScreen.main.bounds.width - 4 * 12) / 4 * ratio,
                       height: (UIScreen.main.bounds.width - (5 * 12)) / 4,
                       alignment: alignment)
                .background(Capsule()
                    .fill(color))
        }
    }
}
