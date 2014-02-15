class List {
  toString {
    // Setup Helper functions:
    var isCircularHelper = fn (node, alreadyVisited) {
      // Was this node already visited?
      if (alreadyVisited.contains(node)) {
        return true
      } else {
        // Check if any of the previous nodes (or this one) are in the children:
        var newAlreadyVisited = alreadyVisited + [node]
        for (element in node) {
          if (element is List && isCircularHelper(element, newAlreadyVisited)) return true
        }
      }
      return false
    }
    
    var isCircular = fn {
      for (element in this) {
        if (element is List && isCircularHelper(element, [this])) return true
      }
      return false
    }
  
    // Handle circular lists:
    if (isCircular) {
      return "[...]"
    }
    
    // Handle non-circular lists:
    var result = "["
    for (i in 0...count) {
      if (i > 0) result = result + ", "
      result = result + this[i].toString
    }
    result = result + "]"
    return result
  }

  + that {
    var result = this[0..-1]
    for (element in that) {
      result.add(element)
    }
    return result
  }

  map (f) {
    var result = []
    for (element in this) {
      result.add(f.call(element))
    }
    return result
  }

  where (f) {
    var result = []
    for (element in this) {
      if (f.call(element)) result.add(element)
    }
    return result
  }
  
  contains(that) {
    for (element in this) {
      if (element == that) return true
    }
    return false
  }
}
