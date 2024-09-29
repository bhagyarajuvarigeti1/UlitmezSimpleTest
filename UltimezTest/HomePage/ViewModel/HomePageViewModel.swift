//
//  HomePageViewModel.swift
//  UltimezTest
//
//  Created by bhagyaraju on 28/09/24.
//

import Foundation

class HomePageViewModel: ObservableObject {
    
    @Published var data: HomePageModel?
    private let apiClient: APIClient
    
    init(apiClient: APIClient = NetworkManager()) {
        self.apiClient = apiClient
    }
    
    
    func fetchData() async {
        guard let url = URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer") else { return }
        
        do {
            let fetchedData: HomePageModel = try await apiClient.get(url: url)
            DispatchQueue.main.async {
                self.data = fetchedData
            }
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
}
