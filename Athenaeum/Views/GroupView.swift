//
//  GroupView.swift
//  Athenaeum
//
//  Created by Colin Kugler on 1/17/25.
//

import SwiftUI
import SwiftData

struct NewPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var isPresented: Bool
    
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let textFieldColor = Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1))
    
    @State var name = ""
    @State var pass = ""
    @State var site = ""
    @State var info = ""
    
    func saveData () {
        let newPass = UserInfo(username: name, password: pass, site: site, notes: info)
        modelContext.insert(newPass)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Username", text: $name)
                TextField("Password", text: $pass)
                TextField("Site", text: $site)
                TextField("Notes", text: $info)
            }
            .scrollContentBackground(.hidden).background(backgroundColor)
            .navigationTitle("New Password")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(backgroundColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveData()
                        isPresented = false // close window
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                        isPresented = false // close window
                    }
                }
                
            }
            
        }
    }
}   // end of NewPasswordView

struct GroupView: View {
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let buttonColor = Color(#colorLiteral(red: 0.02285457216, green: 0.01912862621, blue: 0.9728235602, alpha: 0.9074658526))
    let textFieldColor = Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1))
    
    //@Bindable var info: UserInfo
    @State var searchText: String = ""
    @State var toggleGroup: Bool = false
    @State var isShowingNewPassView = false

// Creates a white color font for Navigation Header
    init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }

    
    func showPasswords() {
        // MARK: function to pull user's passwords and put them on screen.
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(backgroundColor).ignoresSafeArea(edges: .all)
                    .shadow(color: .purple, radius: 2)
                
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.gray)

                        TextField("Search", text: $searchText)
                            
                        
                        if searchText.isEmpty {
                            Image(systemName: "mic.fill")
                                .foregroundStyle(Color.gray)
                        }
                        
                    } // End of HStack
                    
                    .padding()
                    .background(textFieldColor.cornerRadius(25))
                    .foregroundColor(.white)
                    .font(.headline)
                    .accentColor(.purple)
                    .shadow(color: .purple, radius: 2)
                    
                    Spacer()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        //MARK: add logic from showGropups method for adding buttons based on number of groups user has...
                        
                        //MARK: add logic for button press to change view, either a NavigationStack or include a button to go back to this view...
                        Button(action: {
                            print("hello world")
                        }) {
                            HStack {
                                VStack {
                                    Image(systemName: "key")
                                        .foregroundStyle(Color.purple)
                                        .frame(alignment: .leading)
                                    Text("All")
                                        .font(.headline)
                                        .foregroundStyle(Color.white)
                                } // End of VStack
                                Spacer()
                                
                                //MARK: for this VStack, we will need to check and see how many passwords are assoicated to this group.
                                VStack {
                                    Text("115 >")
                                }
                                
                            } // End of HStack
                            .frame(width: 350, height: 50, alignment: .leading)
                            .padding()
                            .background(buttonColor)
                            .foregroundStyle(Color.white)
                            .cornerRadius(10)
                            
                        } // End of Button1
                            
                        
                    } // End of Scroll
                    .background(Color.red)
                    .frame(width: .infinity, height: 550)
                    
                    Spacer()
                    
                    HStack {    // for making the buttons on the bottom for adding new password or for changing order of passwords
                    
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "slider.vertical.3")
                                .foregroundStyle(Color.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                        })
                        
                        Spacer()
                            .frame(width: 100)
                            .background(Color.orange)
                        
                        Text("Number of passwords total")

                        
                        Spacer()
                            .frame(width: 100)
                            .background(Color.orange)
// This is the button to being up form for new password
                        Button(action: {
                           isShowingNewPassView = true
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundStyle(Color.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                        })
                        .sheet(isPresented: $isShowingNewPassView, content: {
                            NewPasswordView(isPresented: $isShowingNewPassView)
                                
                        })
                        
                    } // End of HStack
                    .background(Color.gray)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .opacity(0.8)
                  
                } // End of VStack
                .navigationTitle("Athenaeum")
                
                
                
            } // End of ZStack
            
        } // End of Nav Stack
        
    } // End of Body

    
}

#Preview {
    GroupView()
}
