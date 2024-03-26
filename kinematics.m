
%%
v0 = [0 0 0 0 0 0 0];
lb = [0 0 0 0 0 0 0];
ub = [360 180 180 180 180 180 180];
target = [-500; -350; 1000];
objectiveFunction = @(v)EulDistance(v,target);
options = optimoptions("patternsearch","PlotFcn","psplotbestf",'UseParallel',true,"MaxIterations",80);
[solution,objectiveValue] = patternsearch(objectiveFunction,v0,[],[],[],[],lb,ub,[],...
    options);
disp(solution);
figure();
renderRobot(solution)
hold on;
scatter3(target(1),target(2),target(3),'red','filled');
hold off;
%%
renderRobot([0 56 0 0 2 12 0])
function distance = EulDistance(configs,target)
    Ee_pos = fk(configs);
    %scatter3(target(1),target(2),target(3),'red','filled');
    distance = norm(Ee_pos(1:3)-target);
    disp(distance)

end
function Ee_pos = fk(theta)
    origin = [0;0;0];    
    base_height = 420; L1 = 420; L2 = 420; L3 = 420; L4 = 420; L5 = 420; L6 = 420;
    base = H(0,0,0,0,0,0);
    Hbase_1 = H(0,0,theta(1),0,0,base_height);
    H1_2 = H(0,-theta(2),0,0,0,L1);
    H2_3 = H(0,theta(3),0,L2,0,0);
    H3_4 = H(0,theta(4),0,0,0,L3);
    H4_5 = H(0,-theta(5),0,-L4,0,0);
    H5_6 = H(0,theta(6),0,0,0,L5);
    H6_7 = H(0,-theta(7),0,-L6,0,0);
    H_all = Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6*H6_7;
    Ee_pos = H_all*[origin;1];
    % plotFrame(base, "Base");
    % hold on;
    % plotFrame(base*Hbase_1, "1");
    % plotArm(base,Hbase_1);
    % plotFrame(base*Hbase_1*H1_2, "2");
    % plotArm(base*Hbase_1,base*Hbase_1*H1_2);
    % plotFrame(base*Hbase_1*H1_2*H2_3, "3");
    % plotArm(base*Hbase_1*H1_2,base*Hbase_1*H1_2*H2_3);
    % plotFrame(base*Hbase_1*H1_2*H2_3*H3_4, "4");
    % plotArm(base*Hbase_1*H1_2*H2_3,base*Hbase_1*H1_2*H2_3*H3_4);
    % plotFrame(base*Hbase_1*H1_2*H2_3*H3_4*H4_5, "5");
    % plotArm(base*Hbase_1*H1_2*H2_3*H3_4,base*Hbase_1*H1_2*H2_3*H3_4*H4_5);
    % plotFrame(base*Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6, "6");
    % plotArm(base*Hbase_1*H1_2*H2_3*H3_4*H4_5,base*Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6);
    % plotFrame(base*Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6*H6_7, "End effector");
    % plotArm(base*Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6,base*Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6*H6_7);
    % %xlim([-500 500]); ylim([-500 500]);
    % grid on;
    % axis equal;
    % xlabel("X Axis"); ylabel("Y Axis"); zlabel("Z Axis");
    % 
    % pbaspect([1 1 1]);
    % view(45, 10);
    % hold off;    
end
function renderRobot(theta)
   origin = [0;0;0];    
    base_height = 420; L1 = 420; L2 = 420; L3 = 420; L4 = 420; L5 = 420; L6 = 420;
    base = H(0,0,0,0,0,0);
    Hbase_1 = H(0,0,theta(1),0,0,base_height);
    H1_2 = H(0,-theta(2),0,0,0,L1);
    H2_3 = H(0,theta(3),0,L2,0,0);
    H3_4 = H(0,theta(4),0,0,0,L3);
    H4_5 = H(0,-theta(5),0,-L4,0,0);
    H5_6 = H(0,theta(6),0,0,0,L5);
    H6_7 = H(0,-theta(7),0,-L6,0,0);
    H_all = Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6*H6_7;
    Ee_pos = H_all*[origin;1];
    plotFrame(base, "Base");
    hold on;
    plotFrame(base*Hbase_1, "1");
    plotArm(base,Hbase_1);
    plotFrame(base*Hbase_1*H1_2, "2");
    plotArm(base*Hbase_1,base*Hbase_1*H1_2);
    plotFrame(base*Hbase_1*H1_2*H2_3, "3");
    plotArm(base*Hbase_1*H1_2,base*Hbase_1*H1_2*H2_3);
    plotFrame(base*Hbase_1*H1_2*H2_3*H3_4, "4");
    plotArm(base*Hbase_1*H1_2*H2_3,base*Hbase_1*H1_2*H2_3*H3_4);
    plotFrame(base*Hbase_1*H1_2*H2_3*H3_4*H4_5, "5");
    plotArm(base*Hbase_1*H1_2*H2_3*H3_4,base*Hbase_1*H1_2*H2_3*H3_4*H4_5);
    plotFrame(base*Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6, "6");
    plotArm(base*Hbase_1*H1_2*H2_3*H3_4*H4_5,base*Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6);
    plotFrame(base*Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6*H6_7, "End effector");
    plotArm(base*Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6,base*Hbase_1*H1_2*H2_3*H3_4*H4_5*H5_6*H6_7);
    %xlim([-500 500]); ylim([-500 500]);
    grid on;
    axis equal;
    xlabel("X Axis"); ylabel("Y Axis"); zlabel("Z Axis");

    pbaspect([1 1 1]);
    view(45, 10);
end
function plotArm(h1,h2)
    o1 = h1(1:3,4);
    o2 = h2(1:3,4);
    disp([o1, o2]);
    plot3([o1(1), o2(1)], [o1(2), o2(2)], [o1(3), o2(3)], "LineWidth",2,"Color","#0072BD");
end
function plotFrame(homogenous, name)
    length = 100;
    points = [
        1 0 0;
        0 1 0;
        0 0 1;
    ] * length;
    colors = ["red", "green", "blue"];
    hold on;
    text(homogenous(1,4)+10, homogenous(2,4)+10, homogenous(3,4)+50, name)
    for i = 1:3
        transformed_point = homogenous * [points(i,:), 1].';
        plot3([homogenous(1,4),transformed_point(1)], [homogenous(2,4),transformed_point(2)], [homogenous(3,4),transformed_point(3)], 'Color', colors(i));        
    end
end

function homogenous = H(rx,ry,rz,tx,ty,tz)
    rx = deg2rad(rx); ry = deg2rad(ry); rz = deg2rad(rz);
    Rx = [
        1 0 0;
        0 cos(rx) -sin(rx)
        0 sin(rx) cos(rx)
    ];
    Ry = [
        cos(ry) 0 sin(ry);
        0 1 0;
        -sin(ry) 0 cos(ry);
    ];
    Rz = [
        cos(rz) -sin(rz) 0;
        sin(rz) cos(rz) 0;
        0 0 1;
    ];
    R = Rx*Ry*Rz;
    T = [tx;ty;tz];
    homogenous = [R, T; [0 0 0], [1]];
end