//
//  File.swift
//  GreenDay
//
//  Created by 이영준 on 2022/04/20.
//

import Foundation
import SwiftUI

final class EnvObjectData: ObservableObject{
    @Published var level1Count: Int = 10
    @Published var wasteAniAmount: [CGFloat] = [CGFloat](repeating: 1, count: 12)
    @Published var isImageThrow: [Bool] = [Bool](repeating: true, count: 12)
    @Published var tempOpacity: [Double] = [Double](repeating: 1, count: 12)
}
