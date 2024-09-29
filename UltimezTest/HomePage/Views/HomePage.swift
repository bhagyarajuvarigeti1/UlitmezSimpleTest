//
//  HomePage.swift
//  UltimezTest
//
//  Created by bhagyaraju on 28/09/24.
//

import SwiftUI

struct HomePage: View {
    @StateObject var homePageViewModel: HomePageViewModel = HomePageViewModel()
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        ZStack {
            if let data = homePageViewModel.data {
                List( data.results, id: \.uid) { result in
                 
                        HomePageCellView(result: result)
                        .onTapGesture {
                            coordinator.push(page: .detail(result))
                        }
                    
                }
                .scrollIndicators(.hidden, axes: [.horizontal, .vertical])
                .listStyle(.plain)
            } else {
                ProgressView()
            }
        }
        .task {
            await homePageViewModel.fetchData()
        }
        .navigationTitle("Home")
        
    }
}

#Preview {
    NavigationStack {
        HomePage()
    }
}

