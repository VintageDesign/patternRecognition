module PlotER

using Plots, LinearAlgebra, ComputeER

    function plotER(X, sigma)
    #=
    @author: Riley Campbell
    =#
        actual_energy_level = Float64[]
        k = 0
        while k < 128
          k += 1

          println(k)
          push!(actual_energy_level, ComputeER.compute(X, sigma, k))
        end

        actual_energy_level = actual_energy_level ./ maximum(actual_energy_level)
        plot( 1:k, actual_energy_level[:])
    end

end


