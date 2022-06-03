//
//  ContentView.swift
//  BasicCalculator
//
//  Created by Minyoung Kim on 2022/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FirstCalculator()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
