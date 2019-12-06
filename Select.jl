#=
     Author: Caelan Klein
Description: Randomly selects the path to an image in the \TestImages\UnProcessed
             folder. The path to that image is returned.
=#
module Select

    function selectImage()

        # / for Linux \\ for windows files
        testImages = dirname(@__FILE__) * "/TestImages/"
        imageDir = testImages * rand(readdir(testImages)) * "/UnProcessed/"

        return imageDir * rand(readdir(imageDir))
    end
end
