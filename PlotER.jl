module PlotER

#=
author: Riley Campbell
Description plots the energy recovery of the first 128 dimensions
=#
using Plots, ComputeER, ProgressMeter

    function plotER(X, sigma)
        actual_energy_level = Float64[]
        k = 0
        p = Progress(128, 1)
        while k < 128
          k += 1

          temp = ComputeER.compute(X, sigma, k)
          next!(p)
          push!(actual_energy_level, temp)
        end

        actual_energy_level = actual_energy_level ./ maximum(actual_energy_level)
        display(plot( 1:k, actual_energy_level[:]))
    end

end


