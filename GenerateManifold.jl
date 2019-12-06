#=
     Author: Timothy Ford
Description: File that generates a manifold for all 20 datasets combined
=#

module GenerateManifold

using Images, LinearAlgebra, Load

    function generateManifold()

        image_mean, imageVectors = Load.loadAllImages()

        imageMatrix = permutedims(reshape(hcat(imageVectors...), (length(imageVectors[1]), length(imageVectors))))
        for x = 1:128*20
           imageVectors[x] -= image_mean
        end

        # Image matrix mean centered
        imageMatrixMC = permutedims(reshape(hcat(imageVectors...), (length(imageVectors[1]), length(imageVectors))))
        U, S, V = svd(imageMatrixMC')

        return U, S, imageMatrix, image_mean, imageMatrixMC, names
    end

    export generateManifold

end
