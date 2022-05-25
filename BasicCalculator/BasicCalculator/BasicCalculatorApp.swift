//
//  BasicCalculatorApp.swift
//  BasicCalculator
//
//  Created by Minyoung Kim on 2022/05/20.
//

import SwiftUI

@main
struct BasicCalculatorApp: App {
    
    @StateObject private var MemoData = VarCollection()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(MemoData)
        }
    }
}
