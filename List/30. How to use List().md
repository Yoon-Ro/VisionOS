
- List makes modifying and editing super easy.

# 1. Create a list with list of text

- Simply use List() and Text() to create a base code

```swift
List {
            Text("Hello, World")
            Text("Hello, World")
            Text("Hello, World")

        }
```

# 2. Use array and ForEach()

- First, we create array of string named `fruits` including list of fruits.

```swift
@State var fruits: [String] = [
        "apple", "orange", "banana", "kiwi"
    ]
```

- Import `fruits` into ForEach.
    - Declare the id with `\\.self`
        - `fruit in` will write each array of string value

```swift
List{
	ForEach(fruits, id: \\.self) { fruit in
			Text(fruit)
	}
}
```

- `.capitalized` after the text will make it capitaliezd

```swift
Text(fruit.capitalized)
```

# 3. Add a Section of the list

- `Section()` will create `header:` and `content:`
    - We write a header text on the header
        - `header: {Text("Fruits)`}
    - and we add a content in the curly brackets

```swift
Section {ForEach(fruits, id: \\.self) {fruit in
	Text(fruit)
	}
} header: {
	Text("Fruitss")
	}
```

# 4. Delete an Item (Swipe)

- add `.onDelete(perform: delete)` after `Section{content}`

```swift
Section{...}.onDelete(perform: delete)
```

- onDelete will perform delete from function we created.

```swift
struct ContentView: View {
	var body: some View {...}
	func delete(indexSet: IndexSet){
		fruits.remove(atOffsets: indexSet)
	}
}
```

- Now we can swipe to delete

# 5. Delete an Item (Edit)

- By adding `EditButton()` on the toolbar will perform the edit
- by clicking edit, delete button will show on the list

```swift
List{...}
	.toolbar{
		ToolbarItem(placement: .bottomOrnament){
			EditButton()
		}
	}
```

#toolbar

# 6. Move an Item (Edit)

- Add `.onMove` after `Section{}`

```swift
Section{...}
	.onDelete(...)
	.onMove(perform: { indices, newOffset in
		fruits.move(
			fromOffsets: indices,
			toOffset: newOffset
	}
```

- Extract the function to make it simpler

```swift
func move(indices: IndexSet, newOffset: Int){
			fruits.move(
			fromOffsets: indices,
			toOffset: newOffset
	)
}
```

- Rewrite `.onMove`

```swift
.onMove(perform: move)
```

# 7. Add an Item .append()

- Add `.topBarTrailing` as a new toolbar button

```swift
ToolbarItem(placement: .topBarTrailing){...}
```

- Add a button with `.append` string value.
    - Pressing a button will add “peach” in the fruits array

```swift
Button("Button"){
	fruits.append("peach")
}
```

- Extract button function

```swift
func add() {
	fruits.append("peach")
}
```

```swift
Button("Button"){
	add()
}
```

- Extract the button as a separate View

```swift
var addButton: some View {
	Button("Button"){
		add()	
	}
}
```

- We can simplify the toolBarItem

```swift
ToolbarItem(placement: .topBarTrailing){addButton}
```

# 8. Add a list style

- We can change the style of list by adding `.listStyle()`
    - Most of styles aren’t supported in VisionOS

```swift
.listStyle(...)
```

[Apple developer (List of Style)](https://developer.apple.com/documentation/swiftui/liststyle)

# 9. List Style