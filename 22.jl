open("22.txt") do f
    ls = readlines(f)
    grid = Set{Tuple{Int,Int}}()
    for (y, l) in enumerate(ls), (x, c) in enumerate(l)
        if c=='#'
            push!(grid,(x,y))
        end
    end
    pos = (13, 13)
    dirs = [(0,-1),(1,0),(0,1),(-1,0)]
    dir = 1
    p1 = 0
    for t in 1:10000
        if pos ∈ grid
            dir = mod1(dir+1, 4)
            delete!(grid,pos)
        else
            dir = mod1(dir-1, 4)
            push!(grid,pos)
            p1 += 1
        end
        pos = pos .+ dirs[dir]
    end
    println("Part 1: ", p1)

    grid = Dict{Tuple{Int,Int},Int}()
    for (y, l) in enumerate(ls), (x, c) in enumerate(l)
        if c=='#'
            grid[(x,y)] = 2
        end
    end
    pos = (13, 13)
    dir = 1
    p2 = 0
    for t in 1:10000000
        if pos ∉ keys(grid)
            dir = mod1(dir-1, 4)
            grid[pos] = 1
        elseif grid[pos]==1
            grid[pos] = 2
            p2 += 1
        elseif grid[pos]==2
            dir = mod1(dir+1, 4)
            grid[pos] = 3
        elseif grid[pos]==3
            dir = mod1(dir-2, 4)
            delete!(grid, pos)
        end
        pos = pos .+ dirs[dir]
    end
    println("Part 2: ", p2)
end
