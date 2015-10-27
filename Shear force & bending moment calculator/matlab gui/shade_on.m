function shade_on(VB)

hold on
for i = 1:100:length(VB)
plot([VB(1,i),VB(1,i)],[0,VB(2,i)]);
end
hold off

end
