//
//  GroupView.swift
//  Athenaeum
//
//  Created by Colin Kugler on 1/17/25.
//

import SwiftUI
import SwiftData

struct AddPassword: View {
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let textFieldColor = Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1))
    let fontType = "/System/Library/Fonts/Palatino.ttc"
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var isPresented: Bool
    
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
}   
// end of AddPassword View


struct ViewPassword: View {
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let textFieldColor = Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1))
    let fontType = "/System/Library/Fonts/Palatino.ttc"
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State var path = [UserInfo]()
    
    @Bindable var userInfo: UserInfo
  
    var body: some View {
        NavigationStack {
            Form {
                Text("Username:    \(userInfo.username)")
                Text("Password:    \(userInfo.password)")
                Text("Site:    \(userInfo.site)")
                Text("Notes:    \(userInfo.notes)")
            }
            .scrollContentBackground(.hidden).background(backgroundColor)
            .font(.title2)
            .navigationTitle("\(userInfo.site)")
        }
        
    }
}
// end of ViewPassword View


struct GroupView: View {
    @Environment(\.modelContext) var modelContext
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let buttonColor = Color(#colorLiteral(red: 0.02285457216, green: 0.01912862621, blue: 0.9728235602, alpha: 0.9074658526))
    let textFieldColor = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    let fontType = "/System/Library/Fonts/Palatino.ttc"
    
    @Query(sort: [SortDescriptor(\UserInfo.site, order: .reverse),
                  SortDescriptor(\UserInfo.username)]) var userInfo: [UserInfo]
    
    @State var sortOrder = SortDescriptor(\UserInfo.site)
    @State var searchText: String = ""
    @State var isShowingNewPassView = false
    @State var isShowingSortingEditView = false

// Creates a white color font for Navigation Header and font for search bar
    init(sort: SortDescriptor<UserInfo>, searchString: String) {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        let textFieldAppearance = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        textFieldAppearance.backgroundColor = UIColor.lightGray
    }
    
    func deleteInfo(_ indexSet: IndexSet) {
        for index in indexSet {
            let info = userInfo[index]
            modelContext.delete(info)
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(backgroundColor).ignoresSafeArea(edges: .all)
                    .shadow(color: .purple, radius: 2)
                
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                            ForEach(userInfo, id: \.id) { input in
                                NavigationLink(destination: ViewPassword(userInfo: input)) {
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
                                                .font(.custom("Palatino", size: 30))
                                                .foregroundStyle(Color.white)
                                                .padding(.vertical, 5)
                                            
                                            Text("\(input.username)")
                                                .font(.custom("Palatino", size: 20))
                                                .foregroundStyle(Color.white)
                                        }
                                        
                                    }
                                        .frame(height: 75)
                                        .frame(maxWidth: .infinity)
                                        .background(backgroundColor)
                                        .cornerRadius(10)
                                }
                            }
                            .onDelete(perform: deleteInfo)
                            
                    
                    } 
// End of ScrollView
                    
                    Spacer()
                    
// for making the buttons on the bottom for adding new password or for changing order of passwords
                    HStack(spacing: 100) {
// This Menu is for changing sorting of passwords
                        Menu("", systemImage: "arrow.up.arrow.down") {
                            Picker("", selection: $sortOrder) {
                                Text("Ascending")
                                    .tag(SortDescriptor(\UserInfo.site, order: .forward))
                                Text("Descending")
                                    .tag(SortDescriptor(\UserInfo.site, order: .reverse))
                                Text("Username")
                                    .tag(SortDescriptor(\UserInfo.username))
                                Text("Password")
                                    .tag(SortDescriptor(\UserInfo.password))
                            }
                        }
                        .foregroundStyle(Color.white)

// To show how many passwords a user has in total
                        Text("\(userInfo.count) Passwords")
                            .foregroundStyle(Color.white)
                            .font(.custom("Palatino", size: 20))

                        
// This is the button to bring up a sheet so a user can add a new password
                        Button(action: {
                           isShowingNewPassView = true
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundStyle(Color.white)
                                .font(.title2)
                        })
                        .sheet(isPresented: $isShowingNewPassView, content: {
                            AddPassword(isPresented: $isShowingNewPassView)

                        })
                        
                        
                    } 
// End of HStack
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .opacity(0.8)
                  
                } 
// End of VStack
                .navigationTitle("Passwords")
                
                
                
            } 
// End of ZStack
            .navigationBarBackButtonHidden(true)
            .searchable(text: $searchText)
            .tint(.white)
        } 
// End of Nav Stack
        
    } 
// End of Body
    
}
// end of Struct

#Preview {
    GroupView(sort: SortDescriptor(\UserInfo.site), searchString: "")
}
