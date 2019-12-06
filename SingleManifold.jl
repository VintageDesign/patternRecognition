#=
     Author: Timothy Ford
Description: File that holds a function to generate a single manifold
=#

module SingleManifold

using Images, ImageInTerminal, LinearAlgebra, ProgressMeter, Load

#=
     Author: Timothy Ford
Description: Function that generates reduces the dimensionality of a training object
            and returns the necessary values from and SVD.
=#
    function generateSingleManifold(itemName)
        image_mean, imageVectors = loadSingleImage()
        # Image matrix (2D array instead of array of arrays)
        imageMatrix = permutedims(reshape(hcat(imageVectors...), (length(imageVectors[1]), length(imageVectors))))

        for x = 1:128
           imageVectors[x] -= image_mean
        end
        println("Image mean applied...\n")

        # Image matrix mean centered
        println("Calculating SVD")
        imageMatrixMC = permutedims(reshape(hcat(imageVectors...), (length(imageVectors[1]), length(imageVectors))))
        U, S, V = svd(imageMatrixMC')
        println("SVD Calculated...\n")

        return U, S, imageMatrix, image_mean, imageMatrixMC
    end

    export generateSingleManifold

end
