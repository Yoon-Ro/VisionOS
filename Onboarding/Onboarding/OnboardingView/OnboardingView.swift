//
//  OnboardingView.swift
//  Onboarding
//
//  Created by Yoon Ro on 2024-04-30.
//

import SwiftUI



struct OnboardingView: View {
    
    // Onboarding states:
    /*
     0 - Welcome Screen
     1-  Add name
     2 - Add Age
     3 - Add Gender
     */
    
    @State var onboardingState: Int = 0
    
    
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    
    var body: some View {
        ZStack{
            //content
            ZStack{
                switch onboardingState {
                case 0:
                    welcomeSection
                    
                case 1:
                    addNameSection
                    
                case 2:
                    addAgeSection
                    
                case 3:
                    addGenderSection
                    
                

                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(.green)
                }
                
                
                //buttons
                VStack{
                    Spacer()
                    bottomButton
                }.padding()
            }
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
}
    
    
// MARK: COMPONENTS

    extension OnboardingView {
        
        private var bottomButton: some View {
            Text(onboardingState == 0 ? "SIGN UP" : onboardingState == 2 ? "FINISH" : "NEXT")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
                .background(.blue)
                .glassBackgroundEffect()
 

                .onTapGesture {
                    handleNextButtonPressed()
                }
        }
        
        
        private var welcomeSection: some View {
            VStack(spacing: 40){
                Spacer()

                Image(systemName: "heart.text.square.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:200, height: 200)
                    .foregroundStyle(.white)
                Text("Onboarding")
                    .font(.extraLargeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .overlay(
                        Capsule(style: .continuous)
                            .frame(height: 3)
                            .offset(y: 5)
                        , alignment: .bottom
                    )
                Text("This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI techniques.")
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                
                Spacer()
                Spacer()

            }
            .multilineTextAlignment(.center)
            .padding()
        }
        
        
        private var addNameSection: some View {
            VStack(spacing: 40){
                Spacer()

 
                Text("What's your name?")
                    .font(.extraLargeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)

                
                TextField("Your name here...", text: $name)
                    .font(.headline)
                    .frame(height: 55)
                    .foregroundStyle(.blue)
                    .padding(.horizontal)
                    .glassBackgroundEffect()
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                
                
                Spacer()
                Spacer()

            }
            .multilineTextAlignment(.center)
            .padding()
        }
        
        private var addAgeSection: some View {
            VStack(spacing: 40){
                Spacer()

 
                Text("What's your age?")
                    .font(.extraLargeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Text("\( String(format: "%.0f", age))")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                   

                Slider(value: $age, in: 18...60, step: 1)
                    .tint(Color.white)
                
                Spacer()
                Spacer()

            }
            .multilineTextAlignment(.center)
            .padding()
        }
        
        private var addGenderSection: some View {
            VStack(spacing: 40){
                Spacer()

 
                Text("What's your gender?")
                    .font(.extraLargeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Picker(selection: $gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("None").tag("None")

                } label: {
                    Text(gender.count > 1 ? gender : "Select a gender")
                } .pickerStyle(MenuPickerStyle())

                
                
                Spacer()
                Spacer()

            }
            .multilineTextAlignment(.center)
            .padding()
        }
        
    }
    
    
// MARK: FUNCTIONS

extension OnboardingView {
    
    func handleNextButtonPressed() {
        
        // CHeck Input
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 characters long!")
                return
            }
            
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender before moving forward!")
                return
            }
        default:
            break
        }
        
        
        // GO TO NEXT SECTION
        if onboardingState == 3 {
            signIn()        } else {
            onboardingState += 1
        }
    }
    
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        currentUserSignedIn = true
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
}



    
    #Preview {
        OnboardingView().background()
    }

