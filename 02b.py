chksum = 0
with open('02.txt') as f:
    for line in f:
        l = [int(x) for x in line.strip().split()]
        l.sort(reverse=True)
        for n in range(len(l)-1):
            for m in range(n+1,len(l),1):
                if not l[n]%l[m]:
                    chksum += l[n] // l[m]
print(chksum)
