#swiftfulThinking 

We are going to study grid to make it customizable, adaptable and dynamic.
All grids in SwiftUI are in LazyGrid by default, which is really useful.
LazyGrid means viewable components will only be loaded.
- Grids are mostly used with ScrollView and ForEach statement.
- It's like VStack and HStack, but it goes in row and columns.


# LazyVGrid


### Example 1 (Default)
```swift
        LazyVGrid(columns: [GridItem(.fixed(100))], content: {

            Text("Placeholder")

            Text("Placeholder")

        })
```

- This is the default value of LazyVGrid, but if we press option and click LazyVGrid, we can see more information about how LazyVGrid works.


### Example 2
```Swift
    let columns : [GridItem] = [

        GridItem(.flexible())

    ]

    var body: some View {

        LazyVGrid(columns: columns, content: {

            Text("Placeholder")

            Text("Placeholder")

        })

    }
```
- Now we created LazyVGrid based on the overview information.
- Difference is in Example #1 `[GridItem(.fixed(100))]` has changed to `let columns`.
- Now `columns` has the data set of `[GridItem]` where we can change the data to initialize.

![Exmaple2Image](https://github.com/Yoon-Ro/VisionOS/blob/main/LazyGridItems/Attached%20File/Pasted%20image%2020230907224858.png?raw=true)





### Example 3
```swift
    let columns : [GridItem] = [
        GridItem(.fixed(50), spacing: nil, alignment: nil)
    ]
```
- We changed the value of GridItem, so now it has the fixed width of 50. 
- So all contents will be fitted inside the 50 width grid.


![Exmaple3Image](https://github.com/Yoon-Ro/VisionOS/blob/main/LazyGridItems/Attached%20File/Pasted%20image%2020230907224814.png?raw=true)




# Adding Columns


### Example 4
```swift
    let columns : [GridItem] = [
        GridItem(.fixed(50), spacing: nil, alignment: nil),
        GridItem(.fixed(50), spacing: nil, alignment: nil)
    ]
```
- Now we have two columns of width of 50 each.

![Exmaple4Image](https://github.com/Yoon-Ro/VisionOS/blob/main/LazyGridItems/Attached%20File/Pasted%20image%2020230907224749.png?raw=true)


# Customize Grid Items

### Example 5
```Swift
       LazyVGrid(columns: columns, content: {

            ForEach(0..<50) {index in

                Rectangle().frame(height: 50)

            }

        })
```
- Now we use #forEach Statement to create multiple rectangles with 5 Grid Items.
- We can change the size of middle grid up to 120 by changing the number

### .fixed()

```Swift
    let columns : [GridItem] = [
        GridItem(.fixed(50), spacing: nil, alignment: nil),
        GridItem(.fixed(50), spacing: nil, alignment: nil),
        GridItem(.fixed(120), spacing: nil, alignment: nil),
        GridItem(.fixed(50), spacing: nil, alignment: nil),
        GridItem(.fixed(50), spacing: nil, alignment: nil)
    ]

```

![Exmaple5Image](https://github.com/Yoon-Ro/VisionOS/blob/main/LazyGridItems/Attached%20File/Pasted%20image%2020230907225350.png?raw=true)


### .flexible()
```Swift
    **let** columns : [GridItem] = [

        GridItem(.flexible(), spacing: **nil**, alignment: **nil**),

        GridItem(.flexible(), spacing: **nil**, alignment: **nil**),

        GridItem(.flexible(), spacing: **nil**, alignment: **nil**)

    ]
```
- By using `.flexible()`, the size of three grids will be responsive.

![ExmapleFlexible](https://github.com/Yoon-Ro/VisionOS/blob/main/LazyGridItems/Attached%20File/Pasted%20image%2020230907225758.png?raw=true)


### .adaptive()

We rarely use `.adaptive()`, using flexible will be more useful and common.



# Real Usecase
```Swift


**struct** GridView: View {

    **let** columns : [GridItem] = [

        GridItem(.flexible(), spacing: **nil**, alignment: **nil**),

        GridItem(.flexible(), spacing: **nil**, alignment: **nil**),

        GridItem(.flexible(), spacing: **nil**, alignment: **nil**)

    ]

    **var** body: **some** View {

        ScrollView{

            Rectangle()

                .foregroundStyle(.clear)

                .frame(height: 200)

                .glassBackgroundEffect()

            LazyVGrid(columns: columns, content: {

                ForEach(0..<50) {index **in**

                    Rectangle().frame(height: 150)

                        .foregroundStyle(.white)

                }

            })

        }
        .glassBackgroundEffect()

  
    }


```

- `.Rectangle()` represent the Instagram profile section and ForEach represents the images.

![ExmapleUsecase](https://github.com/Yoon-Ro/VisionOS/blob/main/LazyGridItems/Attached%20File/Pasted%20image%2020230907230423.png?raw=true)


# Another Way of LazyVGrid

```swift
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],

                      alignment: .center,

                      spacing: **nil**,

                      pinnedViews: [],

                      content: {}
                      )
```

- We can store the GridItem data inside the LazyVGrid by following Example.

### Example with Section
```swift
            LazyVGrid(columns: [GridItem(.flexible()),

                                GridItem(.flexible())],

                      alignment: .center,

                      spacing: **nil**,

                      pinnedViews: [],

                      content: {

  

                Section(header: Text("Image Section #1")

                    .font(.extraLargeTitle)

                    .padding(.leading, 30)

                    .frame(maxWidth: .infinity, alignment: .leading)

                    .glassBackgroundEffect()

                    .padding()

                        ,content: {

                    ForEach(0..<4) {index **in**

                        Rectangle().frame(height: 150)

                            .foregroundStyle(.orange)

                    }

                })

  

            })
```
- We can add a #section inside the content with header title and content of ForEach

![ExmapleSection](https://github.com/Yoon-Ro/VisionOS/blob/main/LazyGridItems/Attached%20File/Pasted%20image%2020230907232541.png?raw=true)


### #pinnedViews

```swift
   pinnedViews: [.sectionHeaders],
```

- By writing, pinned views, we can make the declared section to be pinned on the top.

![ExmaplePin](https://github.com/Yoon-Ro/VisionOS/blob/main/LazyGridItems/Attached%20File/Pasted%20image%2020230907232908.png?raw=true)
