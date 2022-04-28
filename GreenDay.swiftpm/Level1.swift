//
//  File.swift
//  GreenDay
//
//  Created by 이영준 on 2022/04/17.
//

import Foundation
import SwiftUI

struct Level1: View{
    @EnvironmentObject var envObjectManange : EnvObjectData

    @State private var showingSheet = false
    @State private var countVariable1: Int = 0
    
    @State private var progress: CGFloat = 0
    
    @State private var boxTransitionView: Bool = true
    @State private var clickCount: CGFloat = 0
    
    @State private var bearOpacity: Double = 0
    
    let boxBackground = Color(red: 71/255, green: 118/255, blue: 145/255)
    
    let columns = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    @ViewBuilder
    func NavBar()-> some View{
        HStack(spacing: 12){
            Spacer().frame(width: 3)
            
            Text("Level 1")
                .font(.title3)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.green))
                .padding(.top,15)

            
            GeometryReader{ proxy in
                ZStack(alignment: .leading){
                    Capsule()
                        .fill(.gray.opacity(0.25))
                    Capsule()
                        .fill(Color.accentColor)
                        .frame(width: proxy.size.width * progress)
                }
            }
            .frame(height: 20)
            .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
            
            if self.clickCount != 6.0 {
                Image("Leaf")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .padding(EdgeInsets(top: 15, leading: 25, bottom: 0, trailing: 23))
            } else {
                NavigationLink(destination: Level2()){
                    Text("Next")
                        .font(.title3)
                        .foregroundColor(.green)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(color: .green, radius: 2, x: 0, y: 2))
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 15))
                }
            }
        }
    }
    
    var body: some View {
            VStack {
                NavBar()
                
                Spacer().frame(width: 0, height: 30)
                
                FirstBin()
                
                Spacer().frame(width: 0, height: 30)
                
                SecondBin()
                
                Spacer().frame(width: 0, height: 30)
                            
                
                if boxTransitionView {
                    Image("recycleBox")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 260, height: 260)
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                    
                } else {
                    VStack{
                        Text("Click and Throw Away Your Garbage")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green))
                        
                        
                        ZStack{
                            Image("iceland")
                                .resizable()
                                .frame(width: 360, height: 220)
                                .padding(.top, 33)
                                .background(RoundedRectangle(cornerRadius: 20)
                                    .fill(boxBackground)
                                    .frame(width: 350, height: 220)
                                
                                )
                                .opacity(0.8)
                                .transition(AnyTransition.opacity.animation(.easeInOut))

                            
                            Image("polarBear")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .offset(x: 80, y: 0)
                                .opacity(
                                    bearOpacity
                                )
                            
                            LazyVGrid(columns: columns, spacing: 15){
                                ForEach(0 ..< 6, id: \.self){ waste in
                                    wasteList[waste].wasteImage
                                        .resizable().aspectRatio(contentMode: .fit)
                                        .frame(width: 60, height: 60)
                                        .padding(10)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                                        .offset(x: envObjectManange.isImageThrow[waste] ? 0 : wasteList[waste].dic_x, y: envObjectManange.isImageThrow[waste] ? 0 : wasteList[waste].dic_y)
                                        .onTapGesture{
                                            withAnimation(.easeInOut(duration: 0.5)) {
                                                envObjectManange.isImageThrow[waste].toggle()
                                            }
                                            withAnimation(.easeInOut(duration: 3)) {
                                                envObjectManange.tempOpacity[waste] = 0
                                            }
                                            clickCount += 1
                                            let progress = (clickCount / CGFloat(6.0))
                                            self.progress = progress
                                            
                                            if clickCount == 6 {
                                                withAnimation {
                                                  bearOpacity  = 1.0
                                                }
                                            }
                                        }
                                        .opacity(envObjectManange.tempOpacity[waste])
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                }
                    
                
                Spacer().frame(width: 0, height: 20)
                
                Button(action: {
                    boxTransitionView.toggle()
                }){
                    if boxTransitionView {
                        Text("Press Here")
                            .font(.title3)
                            .foregroundColor(.green)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(color: .green, radius: 2, x: 0, y: 0))
                    }
                    
                }
                
            }
            .navigationBarHidden(true)
            Spacer()
        }
}

struct Level1_Previews: PreviewProvider {
    static var previews: some View {
        Level1()
    }
}
