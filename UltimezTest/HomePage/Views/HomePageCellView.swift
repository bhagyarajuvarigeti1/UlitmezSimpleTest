//
//  HomePageCellView.swift
//  UltimezTest
//
//  Created by bhagyaraju on 28/09/24.
//

import SwiftUI


struct HomePageCellView: View {
    
    var result: Result
    @State private var visibleImageIndex: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    TabView(selection: $visibleImageIndex) {
                        ForEach(0..<result.imageUrlsThumbnails.count, id: \.self) { index in
                            AsyncCachedImage(url: URL(string: result.imageUrlsThumbnails[index])) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: UIScreen.main.bounds.width - 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 5)
                            .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Enables pagination
                    .frame(height: 100)
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(result.name)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        
                        HStack {
                            Image(systemName: "dollarsign.circle")
                                .foregroundColor(.green)
                            Text(result.price)
                                .font(.system(size: 18, weight: .bold))
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }
                        
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.blue)
                            Text("Posted on: \n \(result.createdAt.getDataAndTime())")
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        
                        Divider()
                    }
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.horizontal)
            }
        }
       
    }
}


#Preview {
    HomePageCellView(result: Result(createdAt: "2019-02-24 04:04:17.566515", price: "AED 5", name: "Notebook", uid: "4878bf592579410fba52941d00b62f94", imageIDS: [
        "9355183956e3445e89735d877b798689"
      ], imageUrls: [
        "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689?AWSAccessKeyId=ASIASV3YI6A4TKGQAK7Q&Signature=MNrTtNPhLXYPoutV2Tm0IEoXi9g%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEBIaCXVzLWVhc3QtMSJHMEUCIQCP0LI7b2qq3nV9dX6ma41vuzhyw03JAWXE2qJFrOuLHQIgNvf7krewe0UCTmL45%2Bp7Cyn7xBn80FkMWRW0selvwAIq8gIIWxAFGgwxODQzOTg5NjY4NDEiDLhxGOjXfdnWNyklrCrPAk%2FJnrPq28urnA5EBI3HomLOe5fiFtFRvqxuApwSo7zGMD4xMPyBuE%2BxZgMtwl0%2F9gla%2FGAy0NnuMCQASNjKYJ7XsI4gVfl2Mix425fgKYC50GfJWcTuv5%2BXBUrVZfeEAGJkiesJTjKOnOtUOy3x8J4q3i7V1d4Uz81Hy3680Ey%2FJQpOtt6JjqDJuUxT%2BGDnM%2FEBfuTt8Qd4FvToqFZRMpbtYVGEeM6zSQ8WS%2FDMOQYrFQkcbaEA%2FwPyVzg6M5LJ52oEnPb%2Bc9RbZcvrtI4mjjPMtSivNT8%2BCGFrhymYfLGh%2FSM0n%2F43BMEv6tQz19yZgzcJ6lAK4bDutYSJA3LuwQC84AaiPZZaTN73MX4eaJqsl%2BDpTHZ3vxNooetSS7JLaTkN%2BcINt9TEZkJf4BHUh249WMk%2Fl52NITQJrorWapclw%2Bbi9sLP0dTK%2BVmC%2BErvMPW65LcGOp4Bc0cIfL7vDd4gkTE8E6T2L5ZQlKxURshBhoAw4Alu8i0%2FBehqtJyTGe8sONwtSOMitvDFpYxE39f8OwMV12Xn0N1SaZZmvTrZQjBAnAnHJp4iDr97tlMrj3Lxca2lTvbNljtF6M1Yp7I9nngjuLUQKyiOoQBs3T6q9tWOixxp0Q7f5B5WlXHjWi%2F2%2FfoRuBvkQMUj8nWbAt%2Bq%2BJi0ga4%3D&Expires=1727605641"
      ], imageUrlsThumbnails: [
        "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A4TKGQAK7Q&Signature=iSS7p5%2F1tpG%2FXkC%2BhM2yhDeCzH8%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEBIaCXVzLWVhc3QtMSJHMEUCIQCP0LI7b2qq3nV9dX6ma41vuzhyw03JAWXE2qJFrOuLHQIgNvf7krewe0UCTmL45%2Bp7Cyn7xBn80FkMWRW0selvwAIq8gIIWxAFGgwxODQzOTg5NjY4NDEiDLhxGOjXfdnWNyklrCrPAk%2FJnrPq28urnA5EBI3HomLOe5fiFtFRvqxuApwSo7zGMD4xMPyBuE%2BxZgMtwl0%2F9gla%2FGAy0NnuMCQASNjKYJ7XsI4gVfl2Mix425fgKYC50GfJWcTuv5%2BXBUrVZfeEAGJkiesJTjKOnOtUOy3x8J4q3i7V1d4Uz81Hy3680Ey%2FJQpOtt6JjqDJuUxT%2BGDnM%2FEBfuTt8Qd4FvToqFZRMpbtYVGEeM6zSQ8WS%2FDMOQYrFQkcbaEA%2FwPyVzg6M5LJ52oEnPb%2Bc9RbZcvrtI4mjjPMtSivNT8%2BCGFrhymYfLGh%2FSM0n%2F43BMEv6tQz19yZgzcJ6lAK4bDutYSJA3LuwQC84AaiPZZaTN73MX4eaJqsl%2BDpTHZ3vxNooetSS7JLaTkN%2BcINt9TEZkJf4BHUh249WMk%2Fl52NITQJrorWapclw%2Bbi9sLP0dTK%2BVmC%2BErvMPW65LcGOp4Bc0cIfL7vDd4gkTE8E6T2L5ZQlKxURshBhoAw4Alu8i0%2FBehqtJyTGe8sONwtSOMitvDFpYxE39f8OwMV12Xn0N1SaZZmvTrZQjBAnAnHJp4iDr97tlMrj3Lxca2lTvbNljtF6M1Yp7I9nngjuLUQKyiOoQBs3T6q9tWOixxp0Q7f5B5WlXHjWi%2F2%2FfoRuBvkQMUj8nWbAt%2Bq%2BJi0ga4%3D&Expires=1727605641"
      ]))
}
