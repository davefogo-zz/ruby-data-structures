#Syntax

  #Create STANDARD LITERAL

    #Heterogeneous -> supports various data types in same array
      array = [1, 2, 3, 'a', 'b', 'c']
      #=> [1, 2, 3, 'a', 'b', 'c']

    #Arrays can be represented as objects rather than mere special interpreter rules. Can be constructed like regular objects
      array = Array.new([1, 2, 3, 'a', 'b', 'c'])
      #=> [1, 2, 3, 'a', 'b', 'c']

    #Preallocation not necessary -> Ruby is a dynamic language
     array = Array.new(3)
     #=> [nil, nil, nil]

    #Shoveling
     array << 3
     #=> [nil, nil, nil, 3]

    #Default values (preallocation of spaces, values for the spaces)
      array = Array.new(3, 0)
      #=> [0, 0, 0]

      array = Array.new(3, :DEFAULT)
      #=> [:DEFALUT, :DEFALUT, :DEFAULT]

  #Create %NOTATION

    #%W
    ORD = "ord"
    %W{This is an interpolated array of w#{ORD}s}
    #=> ["This", "is", "an", "interpolated", "array", "of", "words"]
    %w{This is a non-interpolated array of w#{ORD}s}
    #=> ["This", "is", "a", "non-interpolated", "array", "of", "w\#{ORD}s"]
    %w{This is a non\interpolated array of w#{ORD}s mixing two words into one array space}
    #=> ["This", "is", "a", ]

  #Indices

    #Non-existing index
      german_days = []
      german_days[3]
      #=> nil

    #Non-existing index writing
      german_days[3] = "Donnerstag"
      #=> [nil, nil, nil, "Donnerstag"]

    #Negative indices
      german_days[-1] = "Donnerstag"

  #Range Access

    #Ability to access ranges of elements
      array = ['a', 'b', 'c', 'd', 'e']
      #Give me elements from index 0 to index 2
      array[0..2]
      #=> ['a', 'b', 'c']

      #Give me elements from index 0 until index 3 (do not include index 3)
      array[0...3]
      #=> ['a', 'b', 'c']

      #Start at index 0 give me 3 elements to the right of it
      array[0, 3]
      #=> ['a', 'b', 'c']

      #Start at index -5 give me 3 elements to the right of it
      array[-5, 3]
      #=> ['a', 'b', 'c']

      #Give me elements 0 through -3
       #[0, 1, 2, 3, 4, 5]
      #['a','b','c','d','e']
       #[-5, -4, -3, -2, -1]
      array[0..-3]
      #=> ['a', 'b', 'c']

#Ranges and Access under the hood

    #Array calling the #[] method
      array.[](0..2)
      #=> ['a', 'b', 'c']

    #(0..2) is a range object in disguise
      (0..2).class
      #=> Range

    #Range object representing the wanted range is given to the array
      array.[](Range.new(0,2))
      #=> ['a', 'b', 'c']

      #==================
      array[0..2]
      #=> ['a', 'b', 'c']
      array.[](0..2)
      #=> ['a', 'b', 'c']
      array.[](Range.new(0,2))
      #=> ['a', 'b', 'c']
