module PlotManifold

    #=
    @author: Riley Campbell
    Description: Displays the first 3 dimensions of the manifold
    =#
using Plots

    function plot(X, Y, Z)
        display(plot3d(X, Y, Z))
    end

end
