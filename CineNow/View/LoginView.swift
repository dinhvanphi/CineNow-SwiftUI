//
//  LoginView.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 18/1/26.
//

import Foundation
import SwiftUI

struct LoginView : View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var isShowPassword = false
    @State private var showSignup = false
    var body : some View {
        ZStack(){
            Color.black.ignoresSafeArea()
            
            VStack(spacing : 30){
                HStack(spacing : 10){
                    Button{
                        dismiss()
                    } label : {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.title.bold())
                    }
                    Spacer()
                }
                VStack(spacing : 10){
                    Image(systemName: "film")
                        .font(.system(size: 60 , weight: .bold))
                        .foregroundColor(.yellow)
                    Text("CineNow")
                        .foregroundColor(.white)
                        .font(.system(size: 40 , weight: .bold))
                    
                        .padding()
                    
                }
                VStack(spacing : 13){
                    Text("Đăng nhập")
                        .foregroundColor(.white)
                        .font(.system(size : 35 , weight: .bold))
                        .frame(maxWidth: .infinity , alignment: .leading)
                    
                    Text("Vui lòng đăng nhập để tiêp tục")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    HStack{
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.yellow)
                        
                        TextField("Email hoặc số điện thoại" , text : $email)
                            .foregroundColor(.white)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                    }
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(14)
                    HStack{
                        Image(systemName: "lock.fill")
                            .foregroundColor(.yellow)
                        TextField("Mật khẩu" , text : $password)
                            .foregroundColor(.white)
                        Spacer()
                        
                        Button {
                            isShowPassword.toggle()
                        } label: {
                            Image(systemName: isShowPassword ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(14)
                    
                    Button("Quên mật khẩu"){}
                        .foregroundColor(.yellow)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Spacer().frame(height: 30)
                    
                    Button { } label:{
                        Text("Đăng nhập")
                        .frame(maxWidth: .infinity , minHeight: 52)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(20)
                        .font(.headline)
                    }
                    HStack(spacing: 12) {
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)

                        Text("Hoặc")
                            .foregroundColor(.gray)

                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                    }
                    .padding(.horizontal, 32)
                    .foregroundColor(.white.opacity(0.3))
                    Button{
                        
                    }
                    label : {
                        HStack(spacing : 12) {
                            Image(systemName: "g.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20 , height : 20)
                                .foregroundColor(.white)
                            Text ("Google")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity , minHeight: 52)
                        .background(Color.white.opacity(0.12))
                        .cornerRadius(20)
                        
                    }
                    Spacer().frame(height: 30)
                    
                    HStack(spacing : 20){
                        Text("Chưa có tài khoản?")
                            .foregroundColor(.gray)
                        Button("Đăng ký"){
                            showSignup = true
                        }
                        .navigationDestination(isPresented: $showSignup){
                            SignupView()
                        }
                            .foregroundColor(.yellow)
                    }
                    
                  
                    }
                .padding()
               Spacer()

            }
           
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    LoginView()
}
