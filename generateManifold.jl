#=
     Author: Timothy Ford
Description: File that generates a manifold using generateSingleManifold
=#

module generateManifold

using Images, LinearAlgebra

    function generateManifold()

        names = ["Boat", "Cabinet", "Car", "Chair", "Cup", "Flashlight", "Handle", "HoseReel", 
                "ibook01", "imac04", "imac98", "Keyboard", "LED", "Light1", "Light2", "Mug", 
                "Scooter", "SprayBottle", "Stapler", "Trash"]



        image_mean = zeros(Int8, 128,128)

        imageVectors = Array{Gray{Float64}, 1}[]
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

        A = vec(image_mean ./ 128 * 20)

        # show image?

        mean_A = A
        X = vecImg - conj(mean_A)

        U, S, V = svd(X)
    end

    export generateManifold

end
