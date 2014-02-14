class List {
  toString {
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
  
  isCircular {
    for (element in this) {
      if (element is List && element.isCircularHelper([this])) return true
    }
    return false
  }
  
  isCircularHelper(alreadyVisited) {
    // Was this node already visited?
    if (alreadyVisited.contains(this)) {
      return true
    } else {
      // Check if any of the previous nodes (or this one) are in the children:
      var newAlreadyVisited = alreadyVisited + [this]
      for (element in this) {
        if (element is List && element.isCircularHelper(newAlreadyVisited)) return true
      }
    }
    return false
  }
  
  contains(that) {
    for (element in this) {
      if (element == that) return true
    }
    return false
  }
}
