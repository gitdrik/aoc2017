function turingchecksum()
    states = Dict(
        'A' => Dict(false => (true, 1, 'B'), true => (false,-1, 'C')),
        'B' => Dict(false => (true,-1, 'A'), true => (true,  1, 'D')),
        'C' => Dict(false => (true, 1, 'A'), true => (false,-1, 'E')),
        'D' => Dict(false => (true, 1, 'A'), true => (false, 1, 'B')),
        'E' => Dict(false => (true,-1, 'F'), true => (true, -1, 'C')),
        'F' => Dict(false => (true, 1, 'D'), true => (true,  1, 'A'))
    )
    state, pos = 'A', 0
    mem = Set{Int}()
    for t ∈ 1:12919244
        (bit, move, state) = states[state][pos ∈ mem]
        bit ? push!(mem, pos) : delete!(mem, pos)
        pos += move
    end
    return length(mem)
end
println("Day 25: ", turingchecksum())
