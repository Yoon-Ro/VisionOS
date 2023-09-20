We will learn how to properly use the @State property wrapper.
- Adding @State to a variable, we can let the View know to watch the value of that variable.
- if the value changes, the View knows to update accordingly.
- @State is used all the time to create dynamic views that can change and animate.


```Swift
NavigationStack{
	ZStack{
		Color.green
			.ignoreSafeArea(.all).opacity(0.4)
		VStack(spacing: 20){
			Text("My Title").font(.title)
			Text("Count: 0").underline()
			}
		}
}
```
- This is the example code that we will use the @State to change the value.

```Swift
@State var backgroundColor: Color = Color.green
@State var myTitle: String = "My Title"
@State var count: Int = 0
```
- We can give the values to the variable that made up the View.

```Swift
ZStack{
	   backgroundColor
		   .ignoreSafeArea(.all).opacity(0.4)
		VStack(spacing: 20){
			Text("\(myTitle)").font(.title)
			Text("Count: \(count)").underline()
			}
}
```


![Exmaple1Image](https://github.com/Yoon-Ro/VisionOS/blob/main/State/Attached%20Files/Pasted%20image%2020230915171335.png?raw=true)


- We will add two buttons inside the HStack inside the VStack
```Swift
HStack(spacing: 20){
	Button("Button 1"){
		print("This is a button 1")
	}
	Button("Button 2"){
		print("This is a button 2")
	}
}
```
![Exmaple2Image](https://github.com/Yoon-Ro/VisionOS/blob/main/State/Attached%20Files/Pasted%20image%2020230915171513.png?raw=true)


- Now we will give a button a function to change the value of the variables which @State will notice and update it in View.
```Swift
HStack(spacing: 20){
	Button("Button 1"){
		backgroundColor = .red
		myTitle = "Now it's red"
		count += 1
	}
	Button("Button 2"){
		backgroundColor = .blue
		myTitle = "Now it's blue"
		count -= 1
	}
}
```
![Exmaple3Image](https://github.com/Yoon-Ro/VisionOS/blob/main/State/Attached%20Files/Pasted%20image%2020230915171826.png?raw=true)


![[@State]]




### Videos to watch
https://www.youtube.com/watch?v=q8nBhtmuKXs&ab_channel=KarinPrater
https://www.youtube.com/watch?v=QHhot1qhOZ8&ab_channel=KrassIankov




First written in 2023-09-15
