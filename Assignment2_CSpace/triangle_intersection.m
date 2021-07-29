function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************

poly1 = polyshape(P1(:,1)',P1(:,2)');
poly2 = polyshape(P2(:,1)',P2(:,2)');
polyout = intersect(poly1,poly2);
if polyout.NumRegions
    flag=true;
else
    flag = false;
end
% *******************************************************************
end