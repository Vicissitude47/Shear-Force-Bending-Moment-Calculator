
ENCMP 100 COMPETITION

PROJECT : ENGG 130 CALCULATOR

% the dragon, 
% ENGG 130,
% every first year student hates it,
% Now,
% it is time to terminate it,
% once and for all.

—- BY SHAN LU      slu1@ualberta.ca
      YU ZHU       yz6@ualberta.ca           (if anything went wrong with the program, contacting us is more than welcome. )

DESIGNED TO CALCULATE:

1. SUPPORT REACTION FORCE 
2. SHEAR FORCE DIAGRAM
3. BENDING MOMENT DIAGRAM

This project is composed of 1 figure file and 22 m file. 

1.button.m                            % main file
2.button.fig                          % user interface
3.menu_support_reaction_id.m
4.calculation_two_roller.m
5.calculation_one_roller.m
6.calculation_one_pin_support.m
7.calculation_one_pin_one_roller.m
8.calculation_fixed_support_right.m
9.calculation_fixed_support_left.m
10.calculation_distributed_load.m
11.display_unknowns_two_rollers.m
12.display_unknowns_one_roller.m
13.display_unknowns_one_pin.m
14.display_unknowns_one_pin_roller.m
15.display_unknowns_fixed_support.m
16.shear_bending_plot.m
17.shear_bending_data_two_rollers.m
18.shear_bending_data_one_roller.m
19.shear_bending_data_one_pin.m
20.shear_bending_data_one_pin_roller.m
21.shear_bending_data_fixed_support_right.m
22.shear_bending_data_fixed_support_left.m
23.shade_on.m


To run the program:

1. open the file button.m in matlab
2. click run 
3. change directory to the current folder
4. do your calculation in the prompted user interface


Functionality of different parts in the interface 

Part 1: input panel
This is the place where you input.
If all the value have been inputted, just click the solve button. The result will be displayed in ‘beam state & reaction forces/moment display’ and ‘plot of shear force and bending moment’.

Part 2. beam state & reaction forces/moment display
This is the place where unknown forces will be displayed based on different situations.
In reality, not all the beam is in the equilibrium. So, it will not display value anytime. Sometimes, it just displays ‘Your beam is not in a stata of equilibrium’. 

Part 3. plot of shear force and bending moment
This is the place where shear force & bending moment diagram will be displayed.
However, in order to plot the diagram, your beam has to be in equilibrium. If it is not in the state of equilibrium, it will not plot anything.


IMPORTANT!!!

Instruction of inputting values 
—— based on reality, you are not suggested to input random number
—— if you mistyped it, it is fine, error dialogue will be displayed and instruction on how to revise it will be shown
—— but it is still recommended to read the following first

1. Please input ‘beam length’ first which is in the panel of ‘input 1’. If you forgot to do it, never mind, error dialogue will be displayed and you can redo it. Based on the common sense, ‘beam length’ should be no less than 0. If you mistyped it, never mind, error dialogue will be displayed and you can redo it.

2. You can input ‘beam situation (input 2)’,’distributed load (input 3)’,’moment (input 4)’’force (input 5)’ in whatever order that you want.

3. In ‘beam situation (input 2)’, we covered all 5 situations happened in your engg 130 final exam. However, it is your job to make sure which beam situation that we provided best fits your beam situation. The five beam situations are: 1. fixed support (on the right/left) 2. one pin support 3. one pin and one roller support 4. one roller support 5. two rollers support. Based on the common sense, if your beam situation is one pin and one roller support or two rollers support, you are not well suggested to input the location of the pin/roller and the location of the roller at the same place, or anywhere outside the scope of the beam length. If you mistyped it, error dialogue will be displayed and instruction will show you how to revise it. 

4. In distributed load (input 3), you have to choose direction of the loading first and you are not recommended to input the same value to the start location and end location of the distributed load. If you don’t have loading in your beam, please input the start magnitude and end magnitude as 0. These sorts of setting comes from the requirement of our internal algorithm. Hope it will not bring you any inconvenience. Also, some common sense have been set up to check the validity of the input.

5. In moment (input 4), you have to choose direction of the moment first and then you can type in your values. If you don’t have enough point moment in your beam, just leave the magnitude of the moment 0 there, it will not influence the final value that you calculated. Besides that, common sense has been set up to check the validity of the input.

6. In force (input 5), you don’t need to convert degree to radian when it comes to angle. Also, the angle is with respect to the positive x-axis. Please pay attention to it. Beyond that, common sense has been set up to check the validity of the input.

7. Our default unit system is
   force            kN
   moment           kN*m
   location/length  m
   angle            degree
If unfortunately, the unit system of your beam is not the same as the default unit system, you have to convert unit by yourself.

8. Before clicking solve button, make sure you have inputed all the values. Otherwise, error dialogue will be displayed. 


Testing data

beam length: 10 m
beam situation: fixed support on the left
distributed load: 
start location: 1 m ; start magnitude: 1 kN/m ; 
end location: 6 m ; end magnitude: 6 kN/m
moment: 
moment1 counterclockwise; magnitude: 5  kN*m; location: 5  m;  
moment2 clockwise;        magnitude: 10 kN*m; location: 10 m;
moment3 clockwise;        magnitude: 0  kN*m; location: 0  m;
force:
force1  angle from x axis: 270 degree  magnitude: 1 kN  location: 1 m
force2  angle from x axis: 145 degree  magnitude: 2 kN  location: 2 m 
force3  angle from x axis: 0   degree  magnitude: 0 kN  location: 0 m


ATTENTION!

Bugs that may occur

1. Based on the algorithm that we used, if your beam situation is one pin or one roller, it is highly recommended not to input any nonzero value into the distributed load. It may occur certain logical error.

example:

beam length: 10 m
beam situation: one roller / one pin support
distributed load: 
start location: 3 m ; start magnitude: 2 kN/m ; 
end location: 7 m ; end magnitude: 2 kN/m
moment: 
moment1 counterclockwise; magnitude: 0  kN*m; location: 0  m;  
moment2 counterclockwise;        magnitude: 0  kN*m; location: 0  m;
moment3 counterclockwise;        magnitude: 0  kN*m; location: 0  m;
force:
force1  angle from x axis: 0  degree  magnitude: 0 kN  location: 0 m
force2  angle from x axis: 0  degree  magnitude: 0 kN  location: 0 m 
force3  angle from x axis: 0  degree  magnitude: 0 kN  location: 0 m

It is supposed to have a valid value and it is supposed to generate a graph. However, instead, ’The beam is not in a state of equilibrium’ was displayed.

Please attention again! This sort of bug will not influence other situation, namely, the fixed support, one pin and one roller support and two rollers support.

2. If there is any bug associated with this programme, please let us know. Our contact information is yz6@ualberta.ca


Final statement

Hope this programme can help you conquer ENGG 130!
God bless you!