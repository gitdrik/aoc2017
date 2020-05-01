with open('01.txt') as f:
    l = f.read().strip()
n = 0
for i in range(-1,len(l)-1,1):
    if l[i] == l[i+1]:
        n += int(l[i])
print('Part1: ', n)
n = 0
nl = len(l)
for i in range(len(l)):
    if l[i] == l[(i+nl//2) % nl]:
        n += int(l[i])
print('Part 2:', n)
