//
//  AccountVerificationView.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 21/1/26.
//

import Foundation
import SwiftUI

struct AccountVerificationView : View {
    @StateObject private var viewModel : AccountVerificationViewModel
    
    init(email : String){
        _viewModel = StateObject (wrappedValue:AccountVerificationViewModel(email: email)   )
    }
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer().frame(height: 100)
                Image(systemName: "envelope.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 60 , weight: .bold))
                Spacer().frame(height: 30)
                
                
                Text("Xác thực email của bạn")
                    .foregroundColor(.white)
                    .font(.system(size : 30 , weight: .medium))
                Spacer().frame(height : 10)
                
                
                Text("Chúng tôi đã gởi mã OTP đến email:")
                    .foregroundColor(.gray)
                Spacer().frame(height : 50)
                
                
                TextField("Nhập mã OTP 6 chữ số" , text : $viewModel.otp)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size : 22 , weight: .bold))
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(20)
                    .keyboardType(.numberPad)
                
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .transition(.opacity)
                }
                
                Text("Mã hết hạn sau : 10:00")
                    .foregroundColor(.yellow)
                    .frame(maxWidth: .infinity , alignment: .trailing)
                    .padding()
                Spacer().frame(height : 50)
                
                Button{
                    viewModel.verifyAccount()
                }
                label : {
                    Text("Xác nhận")
                        .frame(maxWidth: .infinity , minHeight: 60 )
                        .background(Color.yellow.opacity(1))
                        .foregroundColor(.black)
                        .font(.system(size : 22 , weight: .bold))
                        .cornerRadius(20)
                        .padding()
                    
                }
                .navigationDestination(isPresented: $viewModel.isVerified) {
                    LoginView()
                }
                Spacer().frame(height : 50)
                
                Text("Gởi lại mã sau : 10:00")
                    .foregroundColor(.gray)
                
                Spacer()
            }
        }
  
    }
}
#Preview {
    AccountVerificationView(email : "phi.dev@gmail.com")
}
