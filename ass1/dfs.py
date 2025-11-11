def find_path(neighbour_fn,
			  start,
			  goal,
			  visited,
			  reachable = lambda pos: True,
			  depth = 100000):
	#The reachable function returns true if the given node is not blocked by a wall.


	"""
	#TODO: 
	Returns the path between two nodes as a list of nodes using depth first search.
	If no path can be found, an empty list is returned.
	
	"""
	#if stack is None:
	# stack = []
	# path = []
	# parent = {}

	# stack.append(start)
	# while len(stack) > 0:
	# 	curr = stack[len(stack) - 1]
	# 	stack.remove(stack[len(stack) - 1])
	# 	# if ((curr in visited) or (not reachable(curr))):
    #     #     continue
	# 	if curr in visited:
	# 		continue
	# 	visited.append(curr)
	# 	if curr == goal:
	# 		break
	# 	for n in neighbour_fn(curr):
	# 		if ((n in visited) or (not reachable(n))):
	# 			continue
	# 		parent[n] = curr
	# 		stack.append(n)

	# #path = visited
	# if goal not in visited:
	# 	return []
	# while goal != start:
	# 	path.append(goal)
	# 	goal = parent[goal]
	# path.append(start)
	# path.reverse()
	# return path

	if start == goal:
		return [start] # Special case that do not need to search
	if depth <= 0: # Reach the end but no goal found
		return []
	for element in neighbour_fn(start): # look into each neighbour
		if element in visited or not reachable(element) : # forget the invalid vertex in the path, just go to next loop
			continue
		visited.append(element) # add into visited list
		route = find_path(neighbour_fn, element, goal, visited, reachable, depth-1) # doing recursively 
		visited.remove(element) # only maintain the visited in each path branch
		if route: # if route not find, [] is expected to be returned
			return [start] + route
	return [] # if no route find, return []