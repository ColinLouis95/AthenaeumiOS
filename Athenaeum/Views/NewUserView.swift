//
//  NewUser.swift
//  Athenaeum
//
//  Created by Colin Kugler on 1/17/25.
//

import SwiftUI

struct NewUserView: View {
    @Environment(\.presentationMode) var presentationMode
    let backgroundColor = Color(#colorLiteral(red: 0.09300225228, green: 0.10428413, blue: 0.4961095452, alpha: 0.8674461921))
    let textFieldColor = Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1))
    let buttonColor = Color(#colorLiteral(red: 0.02285457216, green: 0.01912862621, blue: 0.9728235602, alpha: 0.9074658526))
    
        let appName: String = "Athenaeum"
        @State var toggleHomeView: Bool = false
        @State var toggleCreateUser: Bool = false
        
    // stuff for TextField, need to clean this up
        @State var input1: String = ""
        @State var input2: String = ""
        @State var input3: String = ""
        @State var input4: String = ""
        @State var dataArray: [String] = []
        
        func saveText() {
            // need to clean this up, it is gross
            dataArray.append(input1)
            dataArray.append(input2)
            dataArray.append(input3)
            dataArray.append(input4)
            input1 = ""
            input2 = ""
            input3 = ""
            input4 = ""
        }
        
        func checkEmailInput (_ email: String) -> Bool {
            let emailPattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
            return emailPredicate.evaluate(with: email)
         
        }
    
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
                        
                        Spacer()
                            .frame(height: 80)
                        
                        TextField("Enter the Email", text: $input2)
                            .padding()
                            .background(textFieldColor.cornerRadius(25))
                            .foregroundColor(.white)
                            .font(.custom("Palatino", size: 20))
                            .accentColor(.purple)
                            .shadow(color: .purple, radius: 2)
                        
                        TextField("Email the username", text: $input2)
                            .padding()
                            .background(textFieldColor.cornerRadius(25))
                            .foregroundColor(.white)
                            .font(.custom("Palatino", size: 20))
                            .accentColor(.purple)
                            .shadow(color: .purple, radius: 2)
                        
                        TextField("Enter the password", text: $input2)
                            .padding()
                            .background(textFieldColor.cornerRadius(25))
                            .foregroundColor(.white)
                            .font(.custom("Palatino", size: 20))
                            .accentColor(.purple)
                            .shadow(color: .purple, radius: 2)
                        
                        TextField("Enter the password again", text: $input3)
                            .padding()
                            .background(textFieldColor.cornerRadius(25))
                            .foregroundColor(.white)
                            .font(.custom("Palatino", size: 20))
                            .accentColor(.purple)
                            .shadow(color: .purple, radius: 2)
                        
                        Spacer()
                            .frame(height: 5)
                        
                        Button(action: {
                            //ToDo: if valid inputs, send to next view else alert error
                    }, label: {
                        Text("Create User")
                    })
                        .font(.custom("Palatino", size: 20))
                    .foregroundStyle(Color.white)
                    .padding()
                    .frame(width: 200)
                    .background(Color.blue)
                    .cornerRadius(25)
                    .shadow(color: .purple, radius: 5)
                    
                } // End of VStack
                
                
            } // End of ZStack
            .navigationTitle("New User")
            .font(.title)
            
        } // End of Nav Stack

    }
}

#Preview {
    NewUserView()
}
