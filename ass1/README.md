## Depth First Search and Iterative Deepening Depth First Search
This assignment requires developing Depth First Search (DFS) an d Iterative Deepening Depth First Search (IDDFS) for the gridworld problem. Download the Assign1_gridworld.zip file. It has two newly added files: dfs.py and DFSAgen t.py. Your task is complete these two files to implement both DFS and IDDFS players.


To run the gridworld, you need to enter the following command on CSE Linux workstation or server:

> python3 main.py
This requires Python3, matplotlib and tkinter .
It opens the gridworld window. You can choose type of your player from the menu.<o:p></o:p>


### Question1 (5 marks)

The dfs.py file contains a function called find_path . This functions takes six arguments:

    - neighbour_fn is a successor function and returns the set of all the neighbouring nodes.

    - start is the start node

    - goal : is the goal node

    - visited is the list of nodes which are already visited, explored along a path - cycle checking.

    - The reachable function takes a tile as an argument and returns false if there is a wall on top of the tile or if the tile is outside of the grid map.

    - depth is the depth that your function should avoid searching at any deeper depth

Your task is to implement a function which returns a path between two nodes as a list of nodes using depth first search. If no path can be found, an empty list needs to be returned.
Please only modify the marked section of the dfs.py file. The commented section of the file, TODO.

The DFSAgent class within the DFSAgent .py file then utilises your function to create a DFS agent.
Please only modify the commented section of the file, TODO.

### Question2 (5 marks)

Your next task is to complete idDfsAgent class to create an IDDFS agent.

Most of the code is already implemented for you. Your only task is to complete the start_agent method using IDDFS to find the path between the two self.start and self.goa l nodes and assigns the path to the self.path variable. If no path can be found, an empty list needs to be returned.
