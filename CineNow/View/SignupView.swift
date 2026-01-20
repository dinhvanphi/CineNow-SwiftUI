//
//  SignupView.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 20/1/26.
//

import Foundation
import SwiftUI

struct SignupView : View {
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isShowPassword = false
    @State private var isShowComfirmPassword = false
    @State private var isAccepted = false
    @State private var showLogin = false
    var body: some View{
        ZStack(){
            Color.black.ignoresSafeArea()
            VStack(spacing : 20) {
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
                Spacer().frame(height: 5)
                VStack(spacing : 1){
                    Text ("Đăng Ký Tài Khoản")
                        .foregroundColor(.white)
                        .font(.system(size : 35 , weight: .bold))
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding()
                    
                    Text("Tạo tài khoản để trải nghiệm đầy đủ chức năng")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding()
                }
                HStack(spacing : 12){
                    Image(systemName: "person.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 20, weight: .semibold))
                    
                    TextField("Họ và tên" , text : $name)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(14)
                
                HStack(spacing : 12){
                    Image(systemName: "phone.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 20, weight: .semibold))
                    
                    TextField("Số điện thoại" , text : $phone)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(14)
                
                HStack(spacing : 12){
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 20, weight: .semibold))
                    
                    TextField("Email" , text : $email)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(14)
                
                HStack(spacing : 12){
                    Image(systemName: "lock.fill")
                        .font(.system(size: 20, weight: .semibold))
                    
                        .foregroundColor(.yellow)
                    TextField("Mật khẩu" , text : $password)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(14)
                
                HStack(spacing : 12){
                    Image(systemName: "lock.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 20, weight: .semibold))
                    
                    TextField("Xác nhận mật khẩu" , text : $confirmPassword)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(14)
                
                
                HStack(alignment: .top , spacing: 12){
                    Button{
                        isAccepted.toggle()
                    } label : {
                        Image(systemName: isAccepted ? "checkmark.square.fill" : "square")
                            .font(.system(size: 20))
                            .foregroundColor(isAccepted ? .yellow : .gray)
                    }
                    Text("Tôi đã đọc kĩ và đồng ý với Điều khoản sử dụng và Chính sách bảo mật  ")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding()
                
                Button {}
                label : {
                    Text("Đăng Ký")
                        .foregroundColor(isAccepted ? Color.white : Color.black)
                        .font(.headline)
                        .frame(maxWidth: .infinity , minHeight: 52 )
                        .background(
                            isAccepted ? Color.yellow : Color.gray
                        )
                        .cornerRadius(20)
                    
                }
                .disabled(!isAccepted)
                .padding()
                
                HStack(spacing : 12){
                    Text ("Đã có tài khoản?")
                        .foregroundColor(.gray)
                    Button("Đăng nhập") {
                        showLogin = true
                    }
                    .navigationDestination(isPresented : $showLogin){
                        LoginView()
                    }
                        .foregroundColor(.yellow)
                        
                    }

                
           
                
                Spacer()
                
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview{
    SignupView()
}
