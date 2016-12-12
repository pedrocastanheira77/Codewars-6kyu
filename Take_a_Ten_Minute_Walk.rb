def isValidWalk(walk)
  s = walk.count("s")
  n = walk.count("n")
  w = walk.count("w")
  e = walk.count("e")
  if walk.count==10 && s==n && w==e
    true
  else
    false
  end
end
