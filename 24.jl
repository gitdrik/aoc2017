open("24.txt") do f
    cs = Set([parse.(Int, split(s,'/')) for s in readlines(f)])
    function strongest(cs, bridge, pins)
        ncs = filter(a -> pins ∈ a, cs)
        isempty(ncs) && return sum(sum.(bridge))
        return maximum([strongest(setdiff(cs,[c]),[bridge;[c]], c[1]==pins ? c[2] : c[1]) for c in ncs])
    end
    println("Part 1: ", strongest(cs, [], 0))

    function longest(cs, bridge, pins)
        ncs = filter(a -> pins ∈ a, cs)
        isempty(ncs) && return bridge
        longestbridge = []
        longestlength = 0
        for c in ncs
            b = longest(setdiff(cs,[c]),[bridge;[c]], c[1]==pins ? c[2] : c[1])
            blength = length(b)
            if blength > longestlength
                longestlength = blength
                longestbridge = b
            elseif blength==longestlength && sum(sum.(b)) > sum(sum.(longestbridge))
                longestlength = blength
                longestbridge = b
            end
        end
        return longestbridge
    end
    println("Part 2: ", sum(sum.(longest(cs, [], 0))))
end
