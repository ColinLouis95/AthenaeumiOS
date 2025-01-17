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

struct Groups: View {
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let buttonColor = Color(#colorLiteral(red: 0.02285457216, green: 0.01912862621, blue: 0.9728235602, alpha: 0.9074658526))
    let textFieldColor = Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1))
    @State var searchText: String = ""
    
    @State var toggleGroup: Bool = false

// Creates a white color font
    init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
    
    func checkForGroup() -> Bool {
        // Todo: add logic to check if user has groups set up
        // if true -> show groups + new group button
        // if false -> only show new group button
        // for now, return false to only show new group button
        return false
        
    }
    
    var groupLayer: some View {
        
        return ScrollView(.vertical, showsIndicators: false) {
            Button(action: {
                print("hello world")
            }) {
                VStack {
                    Image(systemName: "key")
                        .foregroundStyle(Color.purple)
                    Text("All")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                } // End of HStack
                .padding()
                .background(buttonColor)
                .foregroundStyle(Color.white)
                .cornerRadius(10)
            } // End of Button
                
            
        } // End of Scroll
        
    } // End of groupLayer
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(backgroundColor).ignoresSafeArea(edges: .all)
                    .shadow(color: .purple, radius: 2)
                
                VStack(spacing: 10) {
                    
                    Spacer()
                        .frame(height: 30)
                    
                    TextField("Search", text: $searchText)
                        .padding()
                        .background(textFieldColor.cornerRadius(25))
                        .foregroundColor(.white)
                        .font(.headline)
                        .accentColor(.purple)
                        .shadow(color: .purple, radius: 2)
                    
                    if checkForGroup() {
                        
                    }
                } // End of VStack
                
            } // End of ZStack
            
        } // End of Nav Stack
        
    } // End of Body

    
} // End of Groups Struct


/*
 Todo:
 - struct Home(group) Page
 - struct/form creating new password
 - struct/form showing a group

 */

#Preview {
    ContentView()
}
