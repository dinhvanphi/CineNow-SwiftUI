//
//  IntroView.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 18/1/26.
//

import Foundation
import SwiftUI

struct IntroView: View {
    @State private var showLogin = false
    @State private var showSignup = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack {
                
                // Header
                HStack {
                    Text("CineNow")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.yellow)
                    
                    Spacer()
                    
                    Button("Vietnamese") { }
                        .font(.footnote.bold())
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(.white.opacity(0.15))
                        .cornerRadius(20)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.top, 10)

                Spacer()

                // Logo + Text
                VStack(spacing: 24) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 260)
                        .shadow(color: .yellow.opacity(0.6), radius: 20)

                    VStack(spacing: 8) {
                        Text("Chào mừng đến với CineNow!")
                            .font(.title.bold())
                            .foregroundColor(.white)

                        Text("Thưởng thức những bộ phim yêu thích của bạn")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                }

                Spacer()

                // Buttons
                VStack(spacing: 14) {
                    Button {
                        showLogin = true
                    } label :{
                        Text("Đăng nhập")
                            .navigationDestination(isPresented: $showLogin ){
                                LoginView()
                            }
                            .frame(maxWidth: .infinity, minHeight: 52)
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(14)
                            .font(.headline)
                    }
                    
                    Button {
                        showSignup = true
                    }  label : {
                        Text("Đăng Ký")
                            .navigationDestination(isPresented: $showSignup){
                                SignupView()
                            }
                        
                            .frame(maxWidth: .infinity, minHeight: 52)
                            .background(.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.yellow, lineWidth: 2)
                            )
                            .foregroundColor(.yellow)
                            .font(.headline)
                    }
                }
                
                .padding(.horizontal, 32)

                // Footer
                Text("Bằng cách đăng nhập hoặc đăng ký, bạn đồng ý với Điều khoản dịch vụ và Chính sách bảo mật của chúng tôi")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                    .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    IntroView()
}
