import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var colorViewModel: ColorViewModel
    @EnvironmentObject var contrastViewModel: ContrastViewModel
    
    let text = [
        "Hello, welcome to ColorLand, the most colorful planet in space! My name is Blue and I will guide you on this adventure. For a better experience, it's important that you play in a vertical position. So let's start...",
        "We are all beings of light here, and our colors are made from the mixture of red, green and blue, the primary colors",
        "Unfortunately, not everything is well in our world. Colors have started to disappear, and we don't know what's happening. The blue of the sky has gone and the green of the trees has vanished. We are desperate to bring the colors back and we need your help."
    ]
    
    let image = [
    "blue",
    "blue",
    "sadBlue"]
    
    let bg = [
    "bg",
    "bg",
    "sadBg"
    ]
    
    @State var indexText = 0
    @State var indexImage = 0
    @State var indexBg = 0
    @State private var count = 0
    @State private var showColorEmotionView = false

    
    var body: some View {
            
            ZStack{
                
                Image(bg[indexBg])
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Spacer()
                    
                    ZStack(){
                        
                        Rectangle()
                            .fill(Color(red: 0.093, green: 0.016, blue: 0.312))
                            .opacity(0.6)
                            .cornerRadius(20)
                            .frame(maxWidth: .infinity)
                            .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color(red: 0.531, green: 0.367, blue: 1), lineWidth: 2.0))
                        
                        Text(text[indexText])
                            .fontWeight(.regular)
                            .font(.system(size: 28))
                            .foregroundColor(Color.white)
                            .lineSpacing(2)
                            .padding(24)
                    }
                    .frame(height: 250)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 32)
                    
                    Spacer()
                    
                    
                        Image(image[indexImage])

                    
                    Spacer()
                    
                    HStack{
                        
                        Spacer()
                        
                        Button {
                            if (self.indexText + 1 == self.text.count){
                                showColorEmotionView = true
            
                            } else {
                                self.indexText = (self.indexText + 1) % self.text.count
                                count += 1
                                
                                self.indexImage = (self.indexImage + 1) % self.image.count
                                count += 1
                                
                                self.indexBg = (self.indexBg + 1) % self.bg.count
                                count += 1
                                
                                
                            }
                        } label: { NextButton()}

                    }
                    
                
                    Spacer()
                }
                .padding(56)
           }
            .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $showColorEmotionView, content: {
            ColorEmotionView()
                .environmentObject(colorViewModel)
                .environmentObject(contrastViewModel)
        })
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(dev.vm)
                .environmentObject(dev.contrastVm)
            
        }
    }
}

