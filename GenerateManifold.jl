#=
     Author: Timothy Ford
Description: File that generates a manifold using generateSingleManifold
=#

module GenerateManifold

using Images, LinearAlgebra

    function generateManifold()

        names = ["Boat", "Cabinet", "Car", "Chair", "Cup", "Flashlight", "Handle", "HoseReel",
                "ibook01", "imac04", "imac98", "Keyboard", "LED", "Light1", "Light2", "Mug",
                "Scooter", "SprayBottle", "Stapler", "Trash"]



        image_mean = zeros(Int8, 128,128)

        imageVectors = Array{Gray{Float16}, 1}[]
        imgFileNames = String[]

        for k = 1:20
            cell = names[k]

            for i = 1:128
                x = i - 1
                fName = "TrainingImages/" * cell * "64/UnProcessed/img_$x.png"
                push!(imgFileNames, fName)
            end

            for img = imgFileNames
                img = load(img) # load image
                img = float64.(img) # convert to float
                image_mean = image_mean .+ img
                vecImg = vec(img)
                push!(imageVectors, vecImg)
            end
        end
        image_mean = vec(image_mean ./ 128*20)

        # Image matrix (2D array instead of array of arrays)
        imageMatrix = permutedims(reshape(hcat(imageVectors...), (length(imageVectors[1]), length(imageVectors))))

        for x = 1:128*20
           imageVectors[x] -= image_mean
        end
        println("Image mean applied...\n")

        # Image matrix mean centered
        println("Calculating SVD")
        imageMatrixMC = permutedims(reshape(hcat(imageVectors...), (length(imageVectors[1]), length(imageVectors))))
        U, S, V = svd(imageMatrixMC')
        println("SVD Calculated...\n")

        return U, S, imageMatrix, image_mean, imageMatrixMC, names
    end

    export generateManifold

end
