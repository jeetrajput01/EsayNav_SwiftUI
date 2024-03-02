//
//  LoginView.swift
//  navigationSWIFTUI
//
//  Created by JeetRajput on 20/04/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var appRouter: AppRouter<AppPage>
    
    var body: some View {
        
        ZStack {
            
            Image("\(kpexels)9")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Button {
//                    appRouter.push(page: .mainTabView)
                    withAnimation {
                        UserDefaults.standard.set(true, forKey: "isLogin")
                        MainRouter.shared.toContentView()
                    }
//                    appRouter.changeRootViewId = UUID().uuidString
                   
                    
                } label: {
                    Text("Login in App")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 60)
                }
                .background(Color.brown.opacity(0.85))
                .cornerRadius(30)
                .padding(.bottom, 20)

                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
