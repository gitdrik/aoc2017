G = {}
with open('07.txt') as f:
    for line in f:
        l = line.translate({ord(x):None for x in '()->,'}).split()
        G[l[0]] = (int(l[1]), {x:0 for x in l[2:]})

childs = set()
for n in G:
    childs.update(G[n][1].keys())
base = (set(G.keys())-childs).pop()
print('Part 1:', base)

def weight(n, G):
    w = G[n][0]
    for m in G[n][1]:
        sw = weight(m, G)
        G[n][1][m] = sw
        w += sw
    return w

totw = weight(base,G)
bads = []
def findbad(G, n):
    if len(G[n][1]):
        median = sorted(G[n][1].values())[len(G[n][1])//2]
        for m in G[n][1]:
            mw = G[n][1][m]
            if mw != median:
                diff = mw-median
                bads.append((m, G[m][0]-diff))
                findbad(G,m)

findbad(G,base)
print('Part 2:', bads[-1][1])
