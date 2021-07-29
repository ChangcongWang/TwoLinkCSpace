%
% TwoLinkRobotCSpace
%

%% Draw Robot and obstacles
figure(1);

subplot(1,2,1);

% This function sets up the two link robot based on the coordinates
% in configuration space [theta1, theta2]. You can change the configuration
% of the robot by changing the two numbers in the input array.
fv = TwoLinkRobot ([260 120]);

sz = 12;

p = patch (fv);

p.FaceColor = 'red';
p.EdgeColor = 'none';

hold on;

% These arrays define the vertices and faces of the obstacle as a patch
%obstacle.vertices = [4 4; 3 4; 4 3; -5 6; -5 8; -4 6;-4 8; 8 -5; -8 -9; 8 -9];
obstacle.vertices = [5 4; 4 4; 5 3; -5 7; -5 9; -4 7;-4 9; 8 -4; -8 -8; 8 -8];
obstacle.faces = [1 2 3; 4 5 6; 5 6 7; 8 9 10];

obs = patch(obstacle);

hold off;

axis equal;
axis (sz*[-1 1 -1 1]);

%% Compute Configuration Space

theta1_range = 0:2:360;
theta2_range = 0:2:360;

nrows = length(theta2_range);
ncols = length(theta1_range);

cspace = true(nrows, ncols);

for i = 1:nrows
    for j = 1:ncols
        
        fv = TwoLinkRobot ([theta1_range(j) theta2_range(i)]);
        
        cspace (i,j) = CollisionCheck (fv, obstacle);
        
    end
    
    fprintf ('%d of %d\n', i, nrows);
end

%% Plot configuration space
subplot (1,2,2);

axis equal;
axis ([0 360 0 360]);

cmap = [1 1 1; 0 0 0];
colormap(cmap);
% Here we may flip the cspace image to match the axes
imagesc([0 360], [0 360], cspace);
hold on;
scatter(260,120, 'ro');
axis xy;

xlabel ('theta1 in degrees');
ylabel ('theta2 in degrees');

title ('Configuration Space');
