//
//  SignInView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 31/12/21.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    
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
                
                Spacer()
                
                TextField("Your email", text: $email)
                    .padding()
                    .background()
                    .cornerRadius(5)
                    .padding(.horizontal)
                    .keyboardType(.emailAddress)
                
                SecureField("Your password", text: $password)
                    .padding()
                    .background()
                    .cornerRadius(5)
                    .padding(.horizontal)
                
                HStack {
                    NavigationLink(destination: SignUpView()) {
                        Text("SignUp")
                            .padding(.horizontal)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        
                    } label: {
                            Text("SignIn")
                                .font(.body)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(.yellow)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .preferredColorScheme(.light)
    }
}
