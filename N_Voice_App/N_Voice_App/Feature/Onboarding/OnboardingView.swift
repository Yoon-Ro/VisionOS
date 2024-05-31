//
//  OnboardingView.swift
//  N_Voice_App
//
//  Created by Yoon Ro on 2024-05-29.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    @StateObject private var pathModel = PathModel()
    
    
    var body: some View {
        // TODO: - 화면 전환 구현 필요

        NavigationStack(path: $pathModel.paths) {
                    onboardingContentView(onboardingViewModel: onboardingViewModel)
                .navigationDestination(for: PathType.self, destination: { pathType in
                    switch pathType {
                    case .homeView:
                        Text("HomeView()").navigationBarBackButtonHidden()
                    case .memoView:
                        Text("HomeView()")
                    case .todoView:
                        Text("HomeView()")
                    }
                })
                .glassBackgroundEffect()
        }
        .environmentObject(pathModel)
    }
}

// MARK: 온보딩 컨텐츠 뷰
private struct onboardingContentView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    
    // Create init using fileprivate init()
    fileprivate init(onboardingViewModel: OnboardingViewModel) {
        self.onboardingViewModel = onboardingViewModel
    }
    
    internal var body: some View {
        VStack{
            // onboarding cell list
            OnboardingCellListView(onboardingViewModel: onboardingViewModel, selectedIndex: 0)
            // start button view
//            StartButtonView()
        }
    }
}



// MARK: ONBOARDING CELL LIST
private struct OnboardingCellListView: View {
    
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    @State private var selectedIndex: Int
    
    init(onboardingViewModel: OnboardingViewModel, selectedIndex: Int) {
        self.onboardingViewModel = onboardingViewModel
        self.selectedIndex = selectedIndex
    }
    
    var body: some View {
        TabView(selection: $selectedIndex){
            // onboarding cell
            ForEach(Array(onboardingViewModel.onboardingContents.enumerated()), id: \.element) { index, onboardingContent in
                OnboardingCellView(content: onboardingContent)
                    .tag(index)
            }
        }
        .tabViewStyle(.page)
        .frame(width: .infinity)
        .background(
            selectedIndex % 2 == 0
            ? Color.customBackgroundGreen.opacity(0.8)
            : Color.customOrange.opacity(0.8)
        )
        .clipped()
    }
}

// MARK: ONBOARDING CELL
private struct OnboardingCellView: View {
    private var content: OnboardingContent
    
    init(content: OnboardingContent) {
        self.content = content
    }
    
    var body: some View {
        VStack {
//            Spacer()
//                .frame(height: 46)
            
            Image(content.imageFileName)
                .resizable()
                .scaledToFill()
                .opacity(0.8)
            
            VStack {
                HStack {
                    Spacer()
                    
                    VStack {
                        Spacer()
                            .frame(height: 46)
                        
                        Text(content.title)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.black)
                        
                        Spacer()
                            .frame(height: 6)
                        
                        Text(content.subTitle)
                            .font(.system(size: 16))
                            .foregroundStyle(.black)
                        
                        Spacer()
                            .frame(height: 46)
                    }
                    
                    Spacer()
                    
                
                }
                StartButtonView()
                Spacer()
                    .frame(height: 46)
            }                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

// MARK: GET STARTED BUTTON
private struct StartButtonView: View {
    
    @EnvironmentObject private var pathModel: PathModel
    var body: some View {

        Button("Button \(Image(systemName: "arrow.right"))"){
            pathModel.paths.append(.homeView)
        }
        .tint(Color.customGreen)
        
        
    }
}


#Preview {
    OnboardingView()
}
