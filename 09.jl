open("09.txt") do f
    global l = readline(f)
end

function solver(chars)
    cs = collect(l)
    garbage = false
    score = 0
    level = 0
    gscore = 0
    while length(cs) > 0
        c = popfirst!(cs)
        if length(cs)>0 && c == '!'
            c = popfirst!(cs)
        elseif ! garbage && c == '<'
            garbage = true
        elseif garbage && c == '>'
            garbage = false
        elseif ! garbage && c != ','
            if c == '{'
                level += 1
            else
                score += level
                level -= 1
            end
        elseif garbage
            gscore += 1
        end
    end
    return score, gscore
end

score, gscore = solver(l)
println("Part 1: ", score)
println("Part 2: ", gscore)
