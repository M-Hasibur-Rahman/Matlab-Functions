function plane()
% plane data
S = [0 1 0 3 3  3 3 0  1 0 -2 0; ...
     0 3 0 0 1 -1 0 0 -3 0  0 0]; % x,y relative coordinates of consecutive points
thickness = 10; % thickness

% window
scr = get(0,'ScreenSize');

fpos = [0.5*scr(3)-0.4*scr(4) 0.1*scr(4) 0.8*scr(4) 0.8*scr(4)];

fh = figure('position',fpos); % creates figure windows, returns handle

set(fh,'menubar','none'); % no menu bar

h = plot(S(1,:),S(2,:),'linewidth',thickness); % plot the plane

axis([-20 20 -20 20])

axis off

% countdown
N = 5;
th = title(num2str(N),'fontsize',20); % creates title, returns handle to the title
for N = N-1:-1:0
    pause(1)
    set(th,'String',num2str(N));
end

% start

a = 0; % angle

p = 0; % shift

speed = 0.2; % speed

a_delta = pi/250; % angular speed

for i = 1:125 % total rotation of pi/2

    a = a + a_delta; % update the angle

    p = p - speed*[cos(a); sin(a)]; % adjust the position, note the -

    G = [cos(a) -sin(a); sin(a)  cos(a)]; % rotation matrix (counterclockwise)

    SP = G*S + p; % rotate and shift S

    set(h,'XData',SP(1,:),'YData',SP(2,:)); % new data for handle h
     
    drawnow;

    F(i) = getframe; % captures animation
    
    pause(0.04);

end



set(th,'String','Bye, bye!'); % animation without movie ends here

pause(1.5);

set(th,'String','Movie:'); % animation with movie starts here

movie(F,1,60); % plays movie at 60 fps 

pause(1.5);

close(fh);
