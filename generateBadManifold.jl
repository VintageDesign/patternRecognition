#=
     Author: Timothy Ford
Description: File that generates a bad manifold using generateSingleManifold
=#

module SingleManifold

using Images, LinearAlgebra

    function generateBadManifold()

        names = ["Boat", "Cabinet", "Car", "Chair", "Cup", "Flashlight", "Handle", "HoseReel", 
                "ibook01", "imac04", "imac98", "Keyboard", "LED", "Light1", "Light2", "Mug", 
                "Scooter", "SprayBottle", "Stapler", "Trash"]

        eigen_cat = zeros(Int8, 16384)


        for k = 1:20
            U , sigma, image_vector, mean_A, X = generateSingleManifold(names[k])
            w = ComputeER(image_vector, sigma, .95)

            s = length(eigen_cat)+1

            # HALP
            eigen_cat = [ eigen_cat(:,:) , U(:, 1:k)]
        end

        # MORE HALP
        eigen_cat(:, 1) = [];
        
        U, S, V = svd(eigen_cat)

        # ALSO HALP
        return U, S, image_vector, mean_A, X
    end

    export generateBadManifold

end