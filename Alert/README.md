# Alert

- Alerts are the quickest and simplest way to display a popup to users.
- To present the alert, toggle the boolean.
- Functions can be added within the alert action.
- You can customize alerts with empty strings by defining string values within the button action.
- Using an enum and switch allows for individual alert customization.

# 1. Create a button with boolean toggle

```swift
struct ContentView: View {
    
    @State var showAlert: Bool = false
    
    var body: some View {
        Button("Click here"){
            showAlert.toggle()
        }
        }
    }
    
}
```

# 2. Add .alert next to the button

```swift
Button(){...}
	.alert(Text("There's an error"), isPresented: $showAlert){
		Text("Ok, fine")
}
```

1. `Text(”There’s an error”)` is the title of alert
2. Bind the boolean variable to alert `isPresented: $showAlert`
3. Write a button text in braces `{Text(”Ok, fine”)}`

# 3. Add two buttons in alert

```swift
Button(){...}
	.alert(isPresent: $showAlert){
		Alert(
			title: Text("Hello"),
			primaryButton: .destructive(Text("Delete")),
			secondaryButton: .cancel()
		)
}
```

1. We bind boolean to alert, and add content `Alert()`
2. title: is title of the Alert
3. primaryButton has `.destructive()` and we add text inside
4. secondaryButton will perform `.cancel()`

# 4. Add function inside the primary button

```swift
primaryButton: .destructive(Text("Delete"), action:{...})
```

- We can add an action inside the .destructive braces

1. Create a color variable and add that into a rounded rectangle

```swift
@State var backgroundColor: Color = Color.yellow

RoundedRectangle(...).frame(...).foregroundStyle(background)
```

1. We add a function inside the `action:{…}`

```swift
primaryButton: .destructive(Text(...), action:{
	backgroundColor = .red
}
```

# 5. Extract the whole Alert

- We will extract the function, and add the function inside to the content

```swift
func getAlert() -> Alert {
	return Alert(
		title: Text("this is the title"),
		message: Text("Here we will describe the error."),
		primaryButton: .destructive(Text("DELETE"), action: {
			backgroundColor = .red
		}),
		secondaryButton:. cancel())

}
```

- Add getAlert into the .alert()

```swift
.alert(isPresented: $showAlert){
	getAlert()
}
```

# 6. Customize the alert

- We can use the alert function we just created and customize each button to have their own strings

1. We create empty string varibles

```swift
@State var alertTitle: String = ""
    @State var alertMessage: String = ""
```

2. Add a string value into the getAlert() function

```swift
func getAlert() -> Alert {
        return Alert(
            title: Text(alertTitle),
            message: Text(alertMessage),
            primaryButton: .destructive(Text("DELETE"), action: {
                backgroundColor = .red
            }),
            secondaryButton:. cancel())

    }
```

3. We specify the string value inside the buttons

```swift
HStack{
Button("Click here"){
            alertTitle = "TITLE 1"
            alertMessage = "MESSAGE 1"
            showAlert.toggle()
        }
Button("Click here"){
            alertTitle = "TITLE 1"
            alertMessage = "MESSAGE 1"
            showAlert.toggle()
        }

}
.alert(isPresented: $showAlert){
	getAlert()
}
```