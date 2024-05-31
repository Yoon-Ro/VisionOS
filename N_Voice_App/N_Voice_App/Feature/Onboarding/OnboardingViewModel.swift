//
//  OnboardingViewModel.swift
//  N_Voice_App
//
//  Created by Yoon Ro on 2024-05-29.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var onboardingContents: [OnboardingContent]
    
    init(onboardingContents: [OnboardingContent] = [
        .init(
            imageFileName: "onboarding_1",
            title: "Today's task",
            subTitle: "투두리스트로 언제 어디서든 해야할일을 한눈에"
        ),
        .init(
            imageFileName: "onboarding_2",
            title: "똑똑한 나만의 기록장",
            subTitle: "메모장으로 생각나는 기록은 언제든지"
        ),
        .init(
            imageFileName: "onboarding_3",
            title: "하나라도 놓치지 않도록",
            subTitle: "음성메모로 기능을 놓치지 말고"
        ),
        .init(
            imageFileName: "onboarding_4",
            title: "정확한 시간의 경과",
            subTitle: "타이머 기능으로 원하는 시간을 확인"
        ),
    ]
    ) {
        self.onboardingContents = onboardingContents
    }
}
