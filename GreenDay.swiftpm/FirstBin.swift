//
//  File.swift
//  GreenDay
//
//  Created by 이영준 on 2022/04/23.
//

import Foundation
import SwiftUI

struct FirstBin: View{
    var body: some View {
        HStack{
            Spacer().frame(width: 30, height: 0)
            
            Image("PaperWaste")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
            
            Image("PlasticWaste")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
            
            Image("MetalWaste")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
            
            Spacer().frame(width: 30, height: 0)
        }
    }
}

