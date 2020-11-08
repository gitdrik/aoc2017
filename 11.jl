f = open("11.txt")
ss = split(readline(f),',')
close(f)

function pos(ss)
    pos = (0,0)
    maxd = 0
    for s in ss
        if s == "n"
            pos = pos[1], pos[2]-2
        elseif s == "ne"
            pos = pos[1]+1, pos[2]-1
        elseif s == "se"
            pos = pos[1]+1, pos[2]+1
        elseif s == "s"
            pos = pos[1], pos[2]+2
        elseif s == "sw"
            pos = pos[1]-1, pos[2]+1
        elseif s == "nw"
            pos = pos[1]-1, pos[2]-1
        end
        maxd = max(maxd, sum(abs.(pos))÷2)
    end
    return sum(abs.(pos))÷2, maxd
end

p1, p2 = pos(ss)
println("Part 1: ", p1)
println("Part 2: ", p2)
