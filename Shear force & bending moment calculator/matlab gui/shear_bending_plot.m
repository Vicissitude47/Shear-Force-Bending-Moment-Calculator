function shear_bending_plot (V,BM)

% plot the shear force diagram and the bending moment diagram

subplot(1,2,1);
plot (V(1,:),V(2,:));
title('Shear Force Diagram');
xlabel('distance x (m)');
ylabel('Shear force V (kN)') ;
grid on 

% shade_on(V)

subplot(1,2,2);
plot (BM(1,:),BM(2,:));
title('Bending Moment Diagram');
xlabel('distance x (m)');
ylabel('Bending Moment M (kN*m)') ;
grid on 

% shade_on(BM)

end
