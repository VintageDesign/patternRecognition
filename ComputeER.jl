#=
     Author: Caelan Klein
Description:
=#
module ComputeER

using LinearAlgebra

    function compute(X, sigma, target_energy_level)

        actual_energy_level = 0
        k = 0
        norm_x = opnorm(X, 2)^2
        sigmaSum = sum(sigma)

        while target_energy_level >= actual_energy_level
            k = k + 1
            sigma_val = 0
            for i = 1:k
                sigma_val = sigma_val + sigma[i]
            end

            actual_energy_level = sigma_val^2 / norm_x
        end

        return k
    end
end
