//
//  AboutView.swift
//  Athenaeum
//
//  Created by Colin Kugler on 1/17/25.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.presentationMode) var presentationMode
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let buttonColor = Color(#colorLiteral(red: 0.02285457216, green: 0.01912862621, blue: 0.9728235602, alpha: 0.9074658526))
    let appName: String = "Athenaeum"
    @State var toggleHomeView: Bool = false
    
// Creates a white color font
    init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
    
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(backgroundColor).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .shadow(color: .purple, radius: 2)
                
                VStack(spacing: 25) {
                    
                    ScrollView {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(buttonColor.opacity(0.3))
                            .frame(height: 500)
                            .overlay(
                                Text("This will be the About section info to show info on project as well as warnings for terms!!!")
                                    .lineLimit(nil)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundStyle(Color.white)
                                    .font(.custom("Palatino", size: 20))
                            )
                        
                    } // End of Scroll View
                    
                } // End of VStack
                
            } // End of ZStack
            .navigationTitle("About")
            .font(.title)
            
        } // End of Nav Stack
      
    }
}

#Preview {
    AboutView()
}
