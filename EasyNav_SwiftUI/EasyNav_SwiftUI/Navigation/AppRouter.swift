//
//  AppRouter.swift
//  NavigationStackDemo
//
//  Created by JeetRajput on 24/02/23.
//

import SwiftUI

/// `AppPage`
///     - description: app route in the form of enum
enum AppPage: Hashable {
    case appRouterView,loginView,mainTabView,courseView,CourseListView(finalDataModel:finalModel),CourseSingleView(indexDataModel: IndexModel)
    
    func hash(into hasher: inout Hasher) {}
    
    static func == (lhs: AppPage, rhs: AppPage) -> Bool {
        return true
    }
}

/// `AppAlert`
///     - description: app alert in the form of struct
struct AppAlert: Identifiable {
    var id: UUID { return UUID() }

    var title, message: String
    var actions: AnyView

    init<Content>(title: String, message: String, actions: Content) where Content: View {
        self.title = title
        self.message = message
        self.actions = AnyView(actions)
    }
}

/// `AppConfirmationDialog`
///     - description: app confirmation dialog in the form of struct
struct AppConfirmationDialog: Identifiable {
    var id: UUID { return UUID() }
    
    var title, message: String
    var actions: AnyView
    
    init<Content>(title: String, message: String, actions: Content) where Content: View {
        self.title = title
        self.message = message
        self.actions = AnyView(actions)
    }
}

/// `AppSheets`
///     - description: app sheet in the form of enum
struct AppSheet: Identifiable {
    var id: UUID { return UUID() }

    var type: AppSheetType
    var onDismiss: () -> Void

    enum AppSheetType {
        case lemon
    }
}

/// `AppFullScreenCover`
///     - description: app full screen cover in the form of enum
struct AppFullScreenCover: Identifiable {
    var id: UUID { return UUID() }
    
    var type: AppFullScreenCoverType
    var onDismiss: () -> Void

    enum AppFullScreenCoverType {
        case olive
    }
}

/// `AppRouter`
///     - description: app router by which navigation is possible in swiftui
///     - it also opens alerts, sheets, fullScreenCovers & confirmationDialogs
class AppRouter<Page>: ObservableObject where Page: Hashable {
    @Published var root: Page
    @Published var path: [Page] = []
    @Published var openAlert: Bool = false
    @Published var alert: AppAlert? = nil

    @Published var openConfirmationDialog: Bool = false
    @Published var confirmationDialog: AppConfirmationDialog? = nil

    @Published var sheet: AppSheet? = nil
    @Published var fullScreenCover: AppFullScreenCover? = nil

    @Published var selectedTabIdx: Int = 0

    /// `at initialization set the root view`
    init(root: Page) {
        self.root = root
    }
}

class MainRouter: ObservableObject {
    static let shared = MainRouter()

    @Published private(set) var contentID = UUID()
    @Published var isShowSplashScreen:Bool = true

    func toContentView() {
        contentID = UUID()
    }
}


// MARK: - AppPage Extensions
extension AppRouter {
    /// `push to a specific view`
    func push(page appPage: Page) -> Void {
        self.path.append(appPage)
    }
    
    /// `pops back to previous view`
    func pop() -> Void {
        self.path.removeLast()
    }
    
    /// `pops back to a specific view`
    func pop(to appPage: Page) -> Void {
        
        guard let foundIdx = self.path.firstIndex(where: { $0 == appPage }) else { return }
        let idxToPop = (foundIdx ..< self.path.endIndex).count - 1
        
        self.path.removeLast(idxToPop)
       
    }
    
    ///`pops back to root view`
    func popToRoot() -> Void {
        self.path.removeAll()
    }
    
    /// `update root`
    func updateRoot(to root: Page) -> Void {
        self.root = root
    }
    
    /// `build app page`
 
    @ViewBuilder func build(page appPage: AppPage) -> some View {
        switch appPage {
        case .appRouterView:
            AppRouterView()
        case .loginView:
            LoginView()
        case .mainTabView:
            MainTabView()
        case .courseView:
            CourseView()
        case .CourseListView(finalDataModel: let finalDataModel):
            CourseListView(finalData: finalDataModel)
        case .CourseSingleView(indexDataModel: let indexDataModel):
            CourseSingleView(indexData: indexDataModel)
      
        }
    }

}

// MARK: - Alert Functions
extension AppRouter {
    /// `open alert`
    func open(alert appAlert: AppAlert) -> Void {
        self.alert = appAlert
        self.openAlert = true
    }
    
    /// `dismiss alert`
    func dismissAlert() -> Void {
        self.alert = nil
        self.openAlert = false
    }
}

// MARK: - Confirmation Dialog Functions
extension AppRouter {
    /// `open confirmation dialog`
    func open(confirmationDialog appConfirmationDialog: AppConfirmationDialog) -> Void {
        self.confirmationDialog = appConfirmationDialog
        self.openConfirmationDialog = true
    }
    
    /// `dismiss confirmation dialod`
    func dismissConfirmationDialog() -> Void {
        self.confirmationDialog = nil
        self.openConfirmationDialog = false
    }
}

// MARK: - Sheet Functions
extension AppRouter {
    /// `present sheet`
    func present(sheet appSheet: AppSheet) -> Void {
        self.sheet = appSheet
    }
    
    /// `dismiss sheet`
    func dismissSheet() -> Void {
        self.sheet = nil
    }
    
    /// `build sheet`
    @ViewBuilder func build(sheet appSheet: AppSheet) -> some View {
        switch appSheet.type {
            case .lemon:
                Text("lemon")
        }
    }
}

// MARK: - FullScreenCover Functions
extension AppRouter {
    /// `present full screen cover`
    func present(fullScreenCover appFullScreenCover: AppFullScreenCover) -> Void {
        self.fullScreenCover = appFullScreenCover
    }
    
    /// `dismiss full screen cover`
    func dismissFullScreenCover() -> Void {
        self.fullScreenCover = nil
    }
    
    /// `build full screen cover`
    @ViewBuilder func build(fullScreenCover appFullScreenCover: AppFullScreenCover) -> some View {
        switch appFullScreenCover.type {
            case .olive:
                VStack(spacing: 8.0) {
                    Text("olive")
                    
                    Button(action: {
                        self.dismissFullScreenCover()
                    }, label: {
                        Text("Cancel")
                    })
                }
        }
    }
}
