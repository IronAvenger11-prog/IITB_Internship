dh_params = [0          pi/2    0       0;
             0.4318       0     0       0;
             0.0203     -pi/2   0.15005 0;
             0           pi/2   0.4318  0;
             0          -pi/2     0     0;
             0            0       0     0];

robot = rigidBodyTree;

bodies = cell(6,1);
joints = cell(6,1);

for i = 1:6
    bodies{i} = rigidBody(['body' num2str(i)]);
    joints{i} = rigidBodyJoint(['jnt' num2str(i)],"revolute");
    setFixedTransform(joints{i},dh_params(i,:),"dh");
    bodies{i}.Joint = joints{i};

    if i == 1 
        addBody(robot, bodies{i}, "base")
    else
        addBody(robot,bodies{i},bodies{i-1}.Name)
    end
end

showdetails(robot)

figure(Name="Interactive GUI")
gui = interactiveRigidBodyTree(robot,MarkerScaleFactor=0.5);


