ls = open("13.txt") do f
    ls = []
    for line in eachline(f)
        l, d = (x->parse(Int, x)).(split(line, ": "))
        push!(ls, (l,d))
    end
    ls
end

function severity(delay, ls)
    sev = 0
    for (l, d) in ls
        if mod(l+delay, (d*2-2)) == 0
            sev += (l+delay) * d
        end
    end
    sev
end

function catched(delay, ls)
    for (l, d) in ls
        if mod(l+delay, (d*2-2)) == 0
            return true
        end
    end
    return false
end

function p2(ls)
    delay = 0
    while catched(delay, ls)
        delay +=1
    end
    delay
end

println("Part 1: ", severity(0, ls))
println("Part 2: ", p2(ls))
