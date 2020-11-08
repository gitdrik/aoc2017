ls = []
with open("13.txt") as f:
    for line in f:
        l, d = line.strip().split(": ")
        ls.append((int(l), int(d)))

def severity(delay, ls):
    sev = 0
    for l in ls:
        if not (l[0]+delay) % (l[1]*2-2):
            sev += (l[0]+delay) * l[1]
    return sev

def catched(delay, ls):
    for l in ls:
        if not (l[0]+delay) % (l[1]*2-2):
            return True
    return False

print("Part 1:",severity(0,ls))
delay = 0
while catched(delay,ls):
    delay += 1
print("Part 2:", delay)
