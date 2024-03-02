//
//  AppRouterView.swift
//  navigationSWIFTUI
//
//  Created by JeetRajput on 20/04/23.
//

import SwiftUI

let kpexels = "pexels"
let kisLogin = "isLogin"

struct AppRouterView: View {
    
    @State var isShowSplashScreen: Bool = true
    @State var isLogin: Bool = false
    @State var rootView: AppPage = .loginView
    @StateObject var appRouter = AppRouter<AppPage>(root: .appRouterView)
    
    var body: some View {
        
        ZStack {
            
            
            if self.isShowSplashScreen {
                
                Image("pexels8")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
            } else {
                
                NavigationStack(path: $appRouter.path) {
                    
                    if self.isLogin {
                        
                        self.appRouter.build(page: .mainTabView)
                            .navigationDestination(for: AppPage.self) { page in
                                self.appRouter.build(page: page)
                            }
                            .alert(Text(self.appRouter.alert?.title ?? ""), isPresented: self.$appRouter.openAlert, actions: {
                                if let actions = self.appRouter.alert?.actions {
                                    actions
                                }
                            }, message: {
                                Text(self.appRouter.alert?.message ?? "")
                            })
                            .confirmationDialog(Text(self.appRouter.confirmationDialog?.title ?? ""), isPresented: self.$appRouter.openConfirmationDialog, actions: {
                                if let actions = self.appRouter.confirmationDialog?.actions {
                                    actions
                                }
                            }, message: {
                                Text(self.appRouter.confirmationDialog?.message ?? "")
                            })
                            .sheet(item: self.$appRouter.sheet, onDismiss: self.appRouter.sheet?.onDismiss) { sheet in
                                self.appRouter.build(sheet: sheet)
                            }
                            .fullScreenCover(item: self.$appRouter.fullScreenCover, onDismiss: self.appRouter.fullScreenCover?.onDismiss) { fullScreenCover in
                                self.appRouter.build(fullScreenCover: fullScreenCover)
                            }
                            .onChange(of: self.appRouter.openAlert) { openAlert in
                                if openAlert == false {
                                    self.appRouter.dismissAlert()
                                }
                            }
                            .onChange(of: self.appRouter.openConfirmationDialog) { openConfirmationDialog in
                                if openConfirmationDialog == false {
                                    self.appRouter.dismissConfirmationDialog()
                                }
                            }
                        
                    } else {
                        
                        self.appRouter.build(page: .loginView)
                            .navigationDestination(for: AppPage.self) { page in
                                self.appRouter.build(page: page)
                            }
                            .alert(Text(self.appRouter.alert?.title ?? ""), isPresented: self.$appRouter.openAlert, actions: {
                                if let actions = self.appRouter.alert?.actions {
                                    actions
                                }
                            }, message: {
                                Text(self.appRouter.alert?.message ?? "")
                            })
                            .confirmationDialog(Text(self.appRouter.confirmationDialog?.title ?? ""), isPresented: self.$appRouter.openConfirmationDialog, actions: {
                                if let actions = self.appRouter.confirmationDialog?.actions {
                                    actions
                                }
                            }, message: {
                                Text(self.appRouter.confirmationDialog?.message ?? "")
                            })
                            .sheet(item: self.$appRouter.sheet, onDismiss: self.appRouter.sheet?.onDismiss) { sheet in
                                self.appRouter.build(sheet: sheet)
                            }
                            .fullScreenCover(item: self.$appRouter.fullScreenCover, onDismiss: self.appRouter.fullScreenCover?.onDismiss) { fullScreenCover in
                                self.appRouter.build(fullScreenCover: fullScreenCover)
                            }
                            .onChange(of: self.appRouter.openAlert) { openAlert in
                                if openAlert == false {
                                    self.appRouter.dismissAlert()
                                }
                            }
                            .onChange(of: self.appRouter.openConfirmationDialog) { openConfirmationDialog in
                                if openConfirmationDialog == false {
                                    self.appRouter.dismissConfirmationDialog()
                                }
                            }
                        
                    }
                    
                    
                }
                .environmentObject(self.appRouter)
                
            }
            
            
        }
        .onAppear {
            self.isShowSplashScreen = MainRouter.shared.isShowSplashScreen
            if MainRouter.shared.isShowSplashScreen {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    withAnimation {
                        self.isShowSplashScreen = false
                        MainRouter.shared.isShowSplashScreen = false
                    }
                })
            }
            DispatchQueue.main.async {
                self.isLogin = UserDefaults.standard.bool(forKey: kisLogin)
                self.rootView = self.isLogin ? AppPage.mainTabView : AppPage.loginView
            }
        }
        
        
    }
}

struct AppRouterView_Previews: PreviewProvider {
    static var previews: some View {
        AppRouterView()
    }
}
