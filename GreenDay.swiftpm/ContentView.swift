import SwiftUI

struct ContentView: View {
    let backgroundColor = Color(red: 204/255, green: 229/255, blue: 248/255)

    var body: some View {
        NavigationView{
            ZStack {
                Rectangle()
                    .fill(backgroundColor)
                    .frame(width: .infinity, height: .infinity)
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    Text("Green Day")
                        .font(Font.custom("Noteworthy", size: 40, relativeTo: .title))
                    Spacer()
                    ZStack{
                        Image("titleBear")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 250)
                            .padding(.bottom, 40)
                        
                        Image("Title")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 210, height: 210)
                            .padding(.top, 18)
                    }
                    Spacer()
                    NavigationLink(destination: Level1()){
                        HStack(spacing: 5){
                            Image("Leaf")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)

                            Text("Press Start")
                                .font(.title2)
                                .foregroundColor(.green)
                                .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 10))
                        }
                        .padding(.leading, 7)
                        .background(RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white))

                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
