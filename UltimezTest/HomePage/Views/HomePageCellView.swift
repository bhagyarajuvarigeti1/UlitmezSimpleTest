//
//  HomePageCellView.swift
//  UltimezTest
//
//  Created by bhagyaraju on 28/09/24.
//

import SwiftUI


struct HomePageCellView: View {
    
    let result: Result
    @State private var visibleImageIndex: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                TabView(selection: $visibleImageIndex) {
                    ForEach(0..<result.imageUrlsThumbnails.count, id: \.self) { index in
                        CachedAsyncImage(urlString: result.imageUrlsThumbnails[index]) 
                        .frame(width: UIScreen.main.bounds.width - 100, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 5)
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Enables pagination
                .frame(height: 300)
    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(result.name)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.black)
                        
                        HStack {
                            Image(systemName: "dollarsign.circle")
                                .foregroundColor(.green)
                            Text(result.price)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }
                        
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.blue)
                            Text("Posted on: \(result.createdAt)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Divider()
                        
                        HStack {
                            Button(action: {
                                // Contact Seller Action
                            }) {
                                Text("Contact Seller")
                                    .fontWeight(.bold)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                            
                            Button(action: {
                                // Share Action
                            }) {
                                Image(systemName: "square.and.arrow.up")
                                    .padding()
                                    .frame(width: 50, height: 50)
                                    .background(Color.gray.opacity(0.2))
                                    .foregroundColor(.black)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
       
    }
}
