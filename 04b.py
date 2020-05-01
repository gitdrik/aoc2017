n = 0
with open('04.txt') as f:
    for line in f:
        ws = line.strip().split()
        if len(ws) == len(set([''.join(sorted(w)) for w in ws])):
            n+= 1
print(n)
