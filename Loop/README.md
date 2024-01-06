# Loop, While & Skip

# Loop

We can repeat and fix in array, dictionary, or set

Heres an array of string, and print each string like following code

```swift
**let** platforms = ["iOS", "macOS", "tvOS", "watchOS"]
```

We call the value of os from platforms.

```swift
**for** os **in** platforms { print("Swift works great on \\(os).") }
```

it will print 4 lines of text

- code inside the braces is "loop body"
- one cycle through the loop body is "loop iteration" -> this one has 4 loop iteractions
- os is "loop variable", it only exists inside the loop body and change to a new value

we can loop over the fixed amount of number

```swift
**for** i **in** 1...12 {print("5 x \\(i) is \\(5 * i)")}
```

1...12 is "range"

we can put loops inside the loops, "nested loops"

```swift
**for** i **in** 1...12 {
	print ("The \\(i) times table")
	
	f**or** j **in** 1...12{
		print(" \\(j) x \\(i) is \\(j * i)")
	}

	print()

}
```

print() will just print a new line, it just looks nicer

We can also exclude the last number

**for** i **in** 1...5 {

print("Counting from 1 through 5 : \(i)")

}

**for** i **in** 1..<5 {

print("Counting from 1 to 5 : \(i)")

}

Tip: ..< is really helpful for working with arrays, where we count from 0 and often want to count up to but excluding the number of items in the array.

instead of looping, we can run a code a certain number of times.

by replacing i with an underscore.

**var** lyric = "Haters gonna"

**for** **_** **in** 1...5 {

lyric += " hate"

}

print(lyric)

# While

Swift has a second kind of loop called `while`

- provide it with a condition, and it will execute until the condition is false
    
- initial integer is 10
    
- while countdown is bigger than 0, it will execute the following function
    
    ```swift
    whilte countdown > 0 {
    	print("\\countdown)...")
    	countdown -= 1
    }
    ```
    
- When countdown is not bigger than 0, it executes the next function “Blast off”
    

```swift
var countdown = 10

while countdown > 0 {
	print("\\(countdown)...")
	countdown -= 1
}

print("Blast off")
```

<aside> ❓ It’s useful when we don’t know how many times the loop will go

</aside>

**`Int`** and **`Double`** both have: **`random(in:)`**

- We can give the range of numbers to work with.

```swift
let id = Int.random(in: 1...1000)
```

```swift
let amount = Double.random(in: 0...1)
```

- We can create 20 sided-dice to execute the code when it hits 20

1. create an integer to store the value

```swift
var roll = 0
```

1. loop until dice hits 20
    1. when roll is not equal to 20, we roll the dice, and shout out the number

```swift
while roll != 20 {...}
```

```swift
roll = Int.random(in: 1...20)
print("I rolled \\(roll)")
```

1. Say “Critical hit” when it hits 20

```swift
print("Critical Hit!")
```

# Skip

**`continue`** skips the current loop iteration, and **`break`** skips all remaining iterations

1. Create an array of strings with different file types

```swift
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]
```

1. Create a loop

```swift
for filename in filenames {...}
```

1. when filename doesn’t end with jpg, skip

```swift
if filename.hasSuffix(".jpg") == false { continue}
```

1. and print the founded pictures

```swift
print("Found picture: \\(filename)")
```

As for **`break`**, that exits a loop immediately and skips all remaining iterations.

- 이거 해석해보자

```swift
let number1 = 4
let number2 = 11
var multiple = [Int]()

for i in 1...100_000{
    
    if i.isMultiple(of: number1) && i.isMultiple(of: number2){
        
        multiple.append(i)
        
        if multiple.count == 10 {
            break
        }
    }
}

print(multiple)
```

That does quite a lot:

1. Create two constants to hold two numbers.
2. Create an integer array variable that will store common multiples of our two numbers.
3. Count from 1 through 100,000, assigning each loop variable to **`i`**.
4. If **`i`** is a multiple of both the first and second numbers, append it to the integer array.
5. Once we hit 10 multiples, call **`break`** to exit the loop.
6. Print out the resulting array.