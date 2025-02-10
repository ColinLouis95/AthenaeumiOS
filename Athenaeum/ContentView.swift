//
//  ContentView.swift
//  Athenaeum
//
//  Created by Colin Kugler on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    let appName: String = "Athenaeum"
    let login: String = "Sign in"
    let newUser: String = "New User"
    let about: String = "About"
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let buttonColor = Color(#colorLiteral(red: 0.02285457216, green: 0.01912862621, blue: 0.9728235602, alpha: 0.9074658526))
    let fontType = "/System/Library/Fonts/Palatino.ttc"
    @State var toggleLoginView: Bool = false
    @State var toggleNewUserView: Bool = false
    @State var toggleAboutView: Bool = false

// Creates a white color font
    init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(backgroundColor).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .navigationTitle("Athenauem")
                    .shadow(color: .purple, radius: 2)
                    
                
                VStack(spacing: 10) {
                    Spacer()
                        .frame(height: 30)
                    Image("welcome")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 30, height: 20)))
                        .shadow(color: .purple, radius: 2)
                    
                    Spacer()
                        .frame(height: 90)
                    Button(action: {
                        // ToDo: Switch to new Screen
                        toggleLoginView.toggle()
                    }, label: {
                        Text(login)
                            //.font(.headline)
                            .font(.custom("Palatino", size: 20))
                            .foregroundStyle(Color.white)
                            .padding()
                            .frame(width: 200)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .shadow(color: .purple, radius: 5)
                    }) //End of Login Button
                    .navigationDestination(isPresented: $toggleLoginView, destination: {
                        LoginView()
                    })
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Button(action: {
                        // ToDo: Switch to new Screen
                        toggleNewUserView.toggle()
                    }, label: {
                        Text(newUser)
                            .font(.custom("Palatino", size: 20))
                            .foregroundStyle(Color.white)
                            .padding()
                            .frame(width: 200)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .shadow(color: .purple, radius: 5)
                    }) //End of Login Button
                    .navigationDestination(isPresented: $toggleNewUserView, destination: {
                        NewUserView()
                    })
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Button(action: {
                        toggleAboutView.toggle()
                    }, label: {
                        Text(about)
                            .font(.custom("Palatino", size: 20))
                            .foregroundStyle(Color.white)
                            .padding()
                            .frame(width: 200)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .shadow(color: .purple, radius: 5)
                    }) //End of Login Button
                    .navigationDestination(isPresented: $toggleAboutView, destination: {
                        AboutView()
                    })
                    
                    
                } // end of VStack
                
            } // End of ZStack
            .navigationTitle(appName)
            .navigationBarTitleDisplayMode(.automatic)
            .font(.custom("Palatino", size: 20))
            
        } // End of NavStack
        
    } // End of body
    
}

/*
 Todo:
 - struct Home(group) Page
 - struct/form creating new password
 - struct/form showing a group

 */

#Preview {
    ContentView()
}
