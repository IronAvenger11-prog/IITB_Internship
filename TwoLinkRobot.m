body1 = rigidBody('body1');
body2 = rigidBody('body2');
body3 = rigidBody('body3');


jnt1 = rigidBodyJoint('jnt1','revolute');
jnt1.HomePosition = pi/6;
tform = trvec2tform([1, 1, 0]);
setFixedTransform(jnt1,tform);
body1.Joint = jnt1;

robot = rigidBodyTree;
addBody(robot,body1,'base')
addBody(robot,body2,'body1')
addBody(robot,body3,'body2')

bodyEndEffector = rigidBody('endeffector');
tform5 = trvec2tform([0.5, 0, 0]);

setFixedTransform(bodyEndEffector.Joint,tform5);
addBody(robot,bodyEndEffector,'body2');
config = randomConfiguration(robot);
tform = getTransform(robot,config,'endeffector','base');

showdetails(robot)



figure(Name="Interactive GUI")
gui = interactiveRigidBodyTree(robot,MarkerScaleFactor=0.5);