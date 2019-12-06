module Load
    using Images

    function loadAllImages()
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
                imageName = "TrainingImages/" * cell * "64/UnProcessed/img_$x.png"
                img = load(imageName) # load image
                img = float64.(img) # convert to float
                image_mean = image_mean .+ img
                vecImg = vec(img)
                push!(imageVectors, vecImg)
            end
        end
        return vec(image_mean ./ 128*20), imageVectors
    end

function loadSingleImage()

        image_mean = zeros(Float64, 128, 128)
        k = 1
        # assume images are grayscale and in /images directory
        # filenames are img_#.png
        imageVectors = Array{Gray{Float64}, 1}[]
        imgFileNames = String[]
        #generate image file names
        println("Generating File Names")
        for x = 0:127
            fName = "TrainingImages/Boat64/UnProcessed/img_$x.png"

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
        return image_mean, imageVectors
end
   export loadSingleImage, loadAllImages
end
