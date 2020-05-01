import math
m = 361527
layer = math.ceil(math.sqrt(m))
layer = layer + (not layer%2)
pos = layer*layer - m
centerdist = abs(layer//2 - pos%(layer-1))
print('Part 1: ',centerdist+layer//2)

board = [[0 for col in range(100)] for row in range(100)]
dirs = [(0,1),(-1,0),(0,-1),(1,0)]
y, x = 50, 50
board[y][x] = 1
dir, n = 0, 1
while n < m:
    y += dirs[dir][0]
    x += dirs[dir][1]
    n = sum(board[y-1][x-1:x+2]) + sum(board[y][x-1:x+2]) + sum(board[y+1][x-1:x+2])
    board[y][x] = n
    nextdir = (dir+1) % 4
    if board[y+dirs[nextdir][0]][x+dirs[nextdir][1]] == 0:
        dir = nextdir
print('Part 2: ', n)
