with open('06.txt') as f:
    banks = [int(x) for x in f.read().split()]
cn = {}
i = 0
while tuple(banks) not in cn:
    cn[tuple(banks)] = i
    blocks = max(banks)
    index = banks.index(blocks)
    banks[index] = 0
    while blocks:
        index = (index+1)%16
        blocks -= 1
        banks[index] += 1
    i += 1
print('Part 1: ',i)
print('Part 2: ',i-cn[tuple(banks)])
