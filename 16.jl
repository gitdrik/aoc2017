function dance(chrs)
    chars = copy(chrs)
    open("16.txt") do f
        cmds = split(readline(f),',')
        for cmd in cmds
            if cmd[1] == 'x'
                a, b = parse.(Int, split(cmd[2:end],'/')).+1
                chars[a], chars[b] = chars[b], chars[a]
            elseif cmd[1] == 'p'
                a, b = findfirst(chars.==cmd[2]), findfirst(chars.==cmd[4])
                chars[a], chars[b] = chars[b], chars[a]
            elseif cmd[1] == 's'
                a = parse(Int,cmd[2:end])
                chars = [chars[end-a+1:end]; chars[1:end-a]]
            end
        end
    end
    return chars
end

function cyclodance(chars, times)
    newchars = copy(chars)
    i = 0
    while true
        newchars = dance(newchars)
        i += 1
        if newchars == chars
            break
        end
    end
    iters = times % i
    for i in 1:iters
        newchars = dance(newchars)
    end
    return newchars
end

chars = collect("abcdefghijklmnop")
println("Part 1: ", String(dance(chars)))
println("Part 2: ", String(cyclodance(chars, 1000000000)))
