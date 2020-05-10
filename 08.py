ls = []
with open('08.txt') as f:
    for line in f:
        ls.append(line.split())

regs = {}
for l in ls:
    regs[l[0]], regs[l[4]] = 0,0

mx = 0
for l in ls:
    if l[1] == 'inc':
        exec('if regs[l[4]] '+l[5]+l[6]+': regs[l[0]] += int(l[2])')
    else:
        exec('if regs[l[4]] '+l[5]+l[6]+': regs[l[0]] -= int(l[2])')
    mx = max([mx]+list(regs.values()))
print('Part 1: ', max(regs.values()))
print('Part 2:', mx)
