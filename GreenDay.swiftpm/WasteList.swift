//
//  File.swift
//  GreenDay
//
//  Created by 이영준 on 2022/04/20.
//

import Foundation
import SwiftUI

struct Waste : Identifiable{
    var id = UUID().uuidString
    var wasteImage : Image
    var dic_x : CGFloat
    var dic_y : CGFloat
    
}

var wasteList : [Waste] = [
    Waste(wasteImage: Image("documents"), dic_x: -10, dic_y: -360),
    Waste(wasteImage: Image("can"), dic_x: 140, dic_y: -360),
    Waste(wasteImage: Image("soy-sauce"), dic_x: -270, dic_y: -200),
    Waste(wasteImage: Image("egg-shell"), dic_x: -10, dic_y: -330),
    Waste(wasteImage: Image("toothbrush"), dic_x: -140, dic_y: -330),
    Waste(wasteImage: Image("receipt"), dic_x: -270, dic_y: -330),
    Waste(wasteImage: Image("bolt"), dic_x: 270, dic_y: -360),
    Waste(wasteImage: Image("petBottle"), dic_x: 0, dic_y: -360),
    Waste(wasteImage: Image("straw"), dic_x: -270, dic_y: -200),
    Waste(wasteImage: Image("orangePeel"), dic_x: 130, dic_y: -330),
    Waste(wasteImage: Image("bone"), dic_x: -140, dic_y: -330),
    Waste(wasteImage: Image("brokenBottle"), dic_x: 10, dic_y: -330)
]
