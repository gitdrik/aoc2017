l = []
with open('05.txt') as f:
    for line in f:
        l.append(int(line))
i = 0
steps = 0
while i in range(len(l)):
    steps += 1
    l[i], i = l[i]+1, i+l[i]
print(steps)
