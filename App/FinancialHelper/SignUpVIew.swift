//
//  SignUpView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 31/12/21.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.managedObjectContext) var moc
    @StateObject private var dataController = DataController()
    
    @StateObject private var userController = UserController()
    
    
    @State private var username : String = ""
    @State private var email : String = ""
    @State private var password : String = ""

    func signUp() {
        
        let userModel = User(context: moc)
        userModel.id = UUID()
        userModel.username = self.username
        userModel.email = self.email
        userModel.password = self.password
        
        try? moc.save()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color("ColorDarkBlue"), Color("ColorSecondaryBlue")],
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Financial Helper")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("ColorLightGray"))
                    .padding(.top)
                Text("SignUp")
                    .foregroundColor(Color("ColorLightGray"))
                    .fontWeight(.light)
                
                Spacer()
                
                TextField("Your username", text: $username)
                    .padding()
                    .background()
                    .cornerRadius(5)
                    .padding(.horizontal)
                    .keyboardType(.emailAddress)
                
                TextField("Your email", text: $email)
                    .padding()
                    .background()
                    .cornerRadius(5)
                    .padding(.horizontal)
                
                SecureField("Your password", text: $password)
                    .padding()
                    .background()
                    .cornerRadius(5)
                    .padding(.horizontal)
                
                Button {
                     signUp()
                } label: {
                    VStack {
                        Text("SignUp")
                            .foregroundColor(.yellow)
                    }
                }
                
                Spacer()
                
            }
        }
        .environment(\.managedObjectContext, userController.userContainer.viewContext)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
