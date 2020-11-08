ps = open("12.txt") do f
        pipes = Dict()
        for l in eachline(f)
            pgm, cons = split(l, " <-> ")
            pipes[parse(Int, pgm)] = parse.(Int, split(cons, ", "))
        end
        pipes
    end

function conections(pipes, known, start)
    cs = union(known, start)
    for n in pipes[start]
        if !(n in cs)
            cs = union(cs, conections(pipes, cs, n))
        end
    end
    cs
end

function groups(pipes)
    pgms = Set(keys(pipes))
    grps = 0;
    while length(pgms) > 0
        grps += 1
        start = pop!(pgms)
        setdiff!(pgms, conections(pipes, Set(), start))
    end
    grps
end

println("Part 1: ", length(conections(ps, Set(), 0)))
println("Part 2: ", groups(ps))
