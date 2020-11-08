maze = open("19.txt") do f
    return [l for l in eachline(f)]
end

function steps(maze, pos, dir)
    c = maze[pos[1]][pos[2]]
    if c == ' '
        println()
        return 0
    elseif c in 'A':'Z'
        print(c)
    elseif c == '+'
        if maze[pos[1]-dir[2]][pos[2]-dir[1]] != ' '
            dir = (-dir[2],-dir[1])
        else
            dir = (dir[2], dir[1])
        end
    end
    return 1+steps(maze, pos.+dir, dir)
end

print("Part 1: ")
println("Part 2: ", steps(maze, (1,192), (1,0)))
