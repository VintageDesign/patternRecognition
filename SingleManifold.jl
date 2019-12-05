#=
     Author: Timothy Ford
Description: File that holds a function to generate a single manifold
=#

module SingleManifold

using Images, ImageInTerminal, LinearAlgebra, ProgressMeter

#=
     Author: Timothy Ford
Description: Function that generates reduces the dimensionality of a training object
            and returns the necessary values from and SVD.
=#
    function generateSingleManifold(itemName)
        image_mean = zeros(Float64, 128, 128)
        k = 1
        # assume images are grayscale and in /images directory
        # filenames are img_#.png
        imageVectors = Array{Gray{Float64}, 1}[]
        imgFileNames = String[]
        #generate image file names
        println("Generating File Names")
        for x = 0:127
            fName = "TrainingImages/" * itemName * "64/UnProcessed/img_$x.png"
            push!(imgFileNames, fName)
        end
        println("File Names Generated...\n")

        # load images
        println("Loading images...")
        p = Progress(length(imgFileNames), 1)

        for img = imgFileNames
            # println("Open image: $img")
            img = load(img) # load image
            img = float64.(img) # convert to float
            image_mean = image_mean .+ img
            vecImg = vec(img)
            push!(imageVectors, vecImg)
            next!(p)
        end
        println("Images Loaded...\n")

        println("Getting Image Mean")
        image_mean = vec(image_mean ./ 64)

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
