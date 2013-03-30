size(3cm,2cm);
// Colors from "Still not getting any" by sp613g, https://kuler.adobe.com/#themeID/181115
import ibl;


filldraw(bean,fillpen=color_light2);
path p1 = (-1,1.7){dir(-10)}..(2,1.75);
draw(p1,dotted);
path p2 = (-1,0.2){dir(20)}..(2,0.25);
draw(p2,dotted);
path p3 = point(p1,0.458){dir(-110)}..point(p2,0.472);
draw(p3,dotted);
clip(bean);

label("{\tiny $P_0$}",0.5*(bean2+bean5)-(0.03,0.10));            
label("{\tiny $P_1$}",bean1+(-0.07,0.09));            
label("{\tiny $P_2$}",0.5*(bean1+bean4)+(0.16,0.01));            
label("{\tiny $P_3$}",0.5*(bean0+bean3)+(0.01,0.13));            

// dot(bean0,red);
// dot(bean1,red);
// dot(bean2,red);
// dot(bean3,red);
// dot(bean4,red);
// dot(bean5,red);
