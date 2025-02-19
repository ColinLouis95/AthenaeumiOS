//
//  GroupView.swift
//  Athenaeum
//
//  Created by Colin Kugler on 1/17/25.
//

import SwiftUI
import SwiftData

struct SortingEditView: View {
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
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                        
                    }
                }
                
            }
            
        }
    }
}   // end of NewPasswordView

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
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                        
                    }
                }
                
            }
            
        }
    }
}   // end of NewPasswordView

struct viewPassword: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State var path = [UserInfo]()
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let textFieldColor = Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1))
    @Bindable var userInfo: UserInfo
    
    var body: some View {
        NavigationStack {
            Form {
                Text("Username:    \(userInfo.username)")
                Text("Password:    \(userInfo.password)")
                Text("Site:    \(userInfo.site)")
                Text("Notes:    \(userInfo.notes)")
            }
            .padding()
            .font(.title2)
            .navigationTitle("Passwords")
        }
    }
    
    
}


struct GroupView: View {
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let buttonColor = Color(#colorLiteral(red: 0.02285457216, green: 0.01912862621, blue: 0.9728235602, alpha: 0.9074658526))
    let textFieldColor = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    
    @Query var userInputs: [UserInfo]
    
    //@Bindable var info: UserInfo
    @State var searchText: String = ""
    @State var toggleGroup: Bool = false
    @State var isShowingNewPassView = false
    @State var isShowingSortingEditView = false

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
                            .foregroundStyle(Color.white)
                            
                        
                        if searchText.isEmpty {
                            Image(systemName: "mic.fill")
                                .foregroundStyle(Color.gray)
                        }
                        
                    } // End of HStack
                    
                    .padding()
                    .background(textFieldColor.cornerRadius(15).opacity(0.8))
                    .font(.headline)
                    .accentColor(.green)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 10, y: 10)
                    .blur(radius: 0.2, opaque: false)
                    
                    Spacer()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                            ForEach(userInputs, id: \.id) { input in
                                NavigationLink(destination: viewPassword(userInfo: input)) {
                                    HStack(spacing: 5) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 15.0)
                                                .frame(width: 70, height: 70)
                                                .padding(.horizontal, 5)
                                                .foregroundStyle(Color.gray.opacity(0.1))
                                            
                                            Image(systemName: "key")
                                                .foregroundStyle(Color.white)
                                                .font(.system(size: 35))
                                        }
                                        
                                        LazyVStack(alignment: .leading) {
                                            Text("\(input.site)")
                                                .font(.title2)
                                                .foregroundStyle(Color.white)
                                                .padding(.vertical, 5)
                                            
                                            Text("\(input.username)")
                                                .font(.caption)
                                                .foregroundStyle(Color.white)
                                        }
                                        
                                    }
                                        .frame(height: 75)
                                        .frame(maxWidth: .infinity)
                                        .background(backgroundColor)
                                        .cornerRadius(10)
                                }
                            }
                    
                    } // End of Scroll
                    
                    Spacer()
                    
                    HStack {    // for making the buttons on the bottom for adding new password or for changing order of passwords
                    
                        Button(action: {
                            isShowingSortingEditView = true
                        }, label: {
                            Image(systemName: "slider.vertical.3")
                                .foregroundStyle(Color.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                        })
                        .sheet(isPresented: $isShowingSortingEditView, content: {
                            NewPasswordView(isPresented: $isShowingSortingEditView)
                                
                        })
                        
                        Spacer()
                            .frame(width: 100)
                            .background(Color.orange)
                        
                        Text("\(userInputs.count) Passwords")
                            .foregroundStyle(Color.white)

                        
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
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .opacity(0.8)
                  
                } // End of VStack
                .navigationTitle("Passwords")
                
                
                
            } // End of ZStack
            
        } // End of Nav Stack
        
    } // End of Body

    
}

#Preview {
    GroupView()
}
