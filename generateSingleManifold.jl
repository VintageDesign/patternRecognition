function generateSingleManifold()
    image_mean = zeros(Float64, 128, 128)
    k = 1
    # assume images are grayscale and in /images directory
    # filenames are img_#.png
    imageVectors = Array{Gray{Float64}, 1}[]
    imgFileNames = String[]
    #generate image file names
    for x = 0:127
        fName = "TrainingImages/Boat64/UnProcessed/img_$x.png"
        push!(imgFileNames, fName)
    end
    # load images
    for img = imgFileNames
        println("Open image: $img")
        img = load(img) # load image
        img = float64.(img) # convert to float
        image_mean = image_mean .+ img
        vecImg = vec(img)
        push!(imageVectors, vecImg)
    end

    image_mean = vec(image_mean ./ 64)

    println(summary(imageVectors[1]))
    for x = 1:128
       imageVectors[x] -= image_mean
    end


    F = svd(imageVectors)








end

using Images, ImageInTerminal, LinearAlgebra
generateSingleManifold()
