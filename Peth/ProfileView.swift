//
//  ProfileView.swift
//  Peth
//
//  Created by masbek mbp-m2 on 07/08/23.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("username") var username: String = ""
    @AppStorage("authID") var authID: String = ""
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            List{
                VStack{
                    Text(username)
                        .font(.body)
                }
                VStack{
                    Text("Logout")
                        .font(.body)
                        .foregroundColor(.red)
                        .onTapGesture{
                            // Clear user-related data from UserDefaults or any other storage
                            UserDefaults.standard.removeObject(forKey: "userFullName")
                            UserDefaults.standard.removeObject(forKey: "userEmail")
                            
                            authID = ""
                            username = ""
                            isLoggedIn = false
                            dismiss()
                            LoginView()
                            
                        }
                }
            }
            .navigationBarTitle("Account", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(
                        action: {
                            dismiss()
                        }
                    ) {
                        Text("Done")
                            .foregroundColor(Color.accentColor)
                            .padding(.horizontal)
                    }
                }
                
            }
            .toolbarBackground(Color(UIColor.systemGray6), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
