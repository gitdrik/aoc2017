chksum = 0
with open('02.txt') as f:
    for line in f:
        l = [int(x) for x in line.strip().split()]
        chksum += max(l) - min(l)
print(chksum)
