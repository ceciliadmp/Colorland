import SwiftUI

@main
struct MyApp: App {
    
    @StateObject private var colorViewModel = ColorViewModel()
    @StateObject private var contrastViewModel = ContrastViewModel()
    
    init(){
    }
    
    var body: some Scene {
        WindowGroup {
            MenuView()
                .environmentObject(colorViewModel)
                .environmentObject(contrastViewModel)
        }
    }
    
    
}
