
function plot3(M(1, :), M(2, :), M(3, :), '.')

   figure
   for i = 1:9
      subplot(3,3,i)
      imshow(reshape(U(:,i), [128, 128]), [])
   end

end
