l = []
with open('05.txt') as f:
    for line in f:
        l.append(int(line))
i = 0
steps = 0
while i in range(len(l)):
    steps += 1
    if l[i] >= 3:
        inc = -1
    else:
        inc = 1
    l[i], i = l[i]+inc, i+l[i]
print(steps)
