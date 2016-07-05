import numpy as np 


def readData(filename):

	matrix = np.empty((0,195), int)

	with open("Learning_sample.txt") as infile:
		i = 0
		for line in infile:
			i += 1

			row = line.split()
			row = map(int, row)
			print row
			matrix = np.append(matrix, np.array([row]), axis=0)
	return matrix



#matrix = readData("Learning_sample.txt")

#print matrix


			



