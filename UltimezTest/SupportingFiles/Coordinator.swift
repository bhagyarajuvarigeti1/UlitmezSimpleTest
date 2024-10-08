

import SwiftUI

enum AppPages: Hashable {
    
    
   
    case homePage
    case detail(Result)
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .homePage:
            hasher.combine("homePage")
        case .detail(let result):
            hasher.combine("detial")
        }
    }
    
    static func == (lhs: AppPages, rhs: AppPages) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}

enum Sheet: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case detail
}

enum FullScreenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case HomePage
}

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ cover: FullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .homePage:
            HomePage()
        case .detail(let result):
            DetailScreen(result: result)
        }
    }
    
    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .detail:
//            DetailScreen()
            EmptyView()
        }
    }
    
    @ViewBuilder
    func buildCover(cover: FullScreenCover) -> some View {
        switch cover {
        case .HomePage:
            HomePage()
        }
    }
}
