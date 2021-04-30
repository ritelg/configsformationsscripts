# Doc Ruby

### Afficher 
* puts affiche et ajoute une ligne
* print affiche sans ajouter de lignr

### Commentaires :
```
=begin
commentaires multi ligne
=end
```

### Afficher Variables :
```
age = 42
puts "He is #{age} years old"
```

### String Interpolation
```
a = 5
b = 2
puts "The sum is #{a+b}"
# outputs "The sum is 7"
```

### Concatenation
```
a = "Hi "
b = 'there'
puts a+b
# outputs "Hi there" 
```

### Input User
```
x = gets // Inclue un saut de ligne a la fin
puts x

puts "Enter your name"
name = gets.chomp // Pas de saut de ligne
puts "Welcome, #{name}"
```

### Conditions
```
num = 16
if num > 7
  puts "Greater than 7"
  if num < 42
    puts "Between 7 and 42"
  end
elseif
    puts ""
end
```

### Case Statements
```
case a
when 1
  puts "One"
when 2
  puts "Two"
when 3
  puts "Three"
else
  puts "Not a baby"
end
```