//
//  VarCollection.swift
//  BasicCalculator
//
//  Created by Minyoung Kim on 2022/05/25.
//

import Foundation

final class VarCollection : ObservableObject{
    @Published var viewNumS : String = "0"
    
    @Published var value = "0"
}

// 변수를 모아서 정리한 후 다른 파일에 불러 올 수 있음
