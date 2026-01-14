# Open the file for reading
#file = open('Results.txt', 'r')
#read = file.readlines()
#print(read)
with open('Results.txt') as f:
    line = f.readline()
    while line:
        if line.startswith('x'):
            next_line = f.readline().strip()
            my_x = next_line
            print(my_x)
        if line.startswith('y'):
            next_line = f.readline().strip()
            my_y = next_line
            #print(my_y)
        line = f.readline()
    #second_values = list(map(lambda x: x[0], my_x))
    #print(second_values[1])

