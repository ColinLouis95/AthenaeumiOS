//
//  AboutView.swift
//  Athenaeum
//
//  Created by Colin Kugler on 1/17/25.
//

import SwiftUI
import Foundation

struct AboutView: View {
    @Environment(\.presentationMode) var presentationMode
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let buttonColor = Color(#colorLiteral(red: 0.02285457216, green: 0.01912862621, blue: 0.9728235602, alpha: 0.9074658526))
    let appName: String = "Athenaeum"
    let fontType = "/System/Library/Fonts/Palatino.ttc"
    @State var toggleHomeView: Bool = false
    @State var fileContents = ""
    
// Creates a white color font
    init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }

// func to read About txt file and present it to user once page loads.
    func printAbout(named fileName: String) -> String {
        if let textFileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt") {
            do {
                return try String(contentsOf: textFileUrl, encoding: .utf8)
            } catch {
                print("Error reading file: \(error)")
            }
        }
      return "Failed to load text file."
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(backgroundColor).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .shadow(color: .purple, radius: 2)
                
                VStack(spacing: 25) {
                    
                    ScrollView {
                        Text(fileContents)
                            .padding()
                            .font(.custom("Palatino", size: 30))
                            .foregroundStyle(Color.white)
                        
                    } // End of Scroll View
                    .onAppear {
                        fileContents = printAbout(named: "About")
                    }
                    
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
