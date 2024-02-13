branches = `git branch -r | grep 'origin/r/' | sed 's/origin\///'`
puts branches
