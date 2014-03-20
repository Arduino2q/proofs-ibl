// venn_three.asy
// Jim Hefferon 2014-Mar-18 pd
import ibl;
size(3cm,0);

real centers_rad=2;
pair z0=(0,0);
pair z1=(Cos(30),Sin(30));  // center of circle1
pair z2=(Cos(150),Sin(150));  //  center of circle2
pair z3=(Cos(270),Sin(270));  //  center of circle3
real venn_circle_rad=1.5;     
path c1=circle(z1,venn_circle_rad);
path c2=circle(z2,venn_circle_rad);
path c3=circle(z3,venn_circle_rad);
fill(c1,color_light1);
fill(c2,color_light1);
fill(c3,color_light1);
draw(c1);
draw(c2);
draw(c3);

picture a_box=new picture;
picture b_box=new picture;
picture c_box=new picture;
real label_rad=centers_rad;
//real label_offset_x=0.4*r, label_offset_y=0.5*r;
label(a_box,"{\scriptsize $B$}",label_rad*(Cos(30),Sin(30)));
label(b_box,"{\scriptsize $A$}",label_rad*(Cos(150),Sin(150)));
label(c_box,"{\scriptsize $C$}",label_rad*(Cos(270),Sin(270)));
add(a_box,filltype=Fill(white));
add(b_box,filltype=Fill(white));
add(c_box,filltype=Fill(white));

real pts_rad=0.8venn_circle_rad;
path pts=circle(z0,pts_rad);
path int_pts=circle(z0,0.8*pts_rad);
//draw(pts,red);
label("{\tiny $0$}",1.25*label_rad*(Cos(210),Sin(210)));
label("{\tiny $4$}",point(pts,1+(2/3))+jiggle(0.05*venn_circle_rad));
label("{\tiny $2$}",point(pts,1/3)+jiggle(0.05*venn_circle_rad));
label("{\tiny $1$}",point(pts,3)+jiggle(0.05*venn_circle_rad));
label("{\tiny $6$}",point(int_pts,1)+jiggle(0.05*venn_circle_rad));
label("{\tiny $5$}",point(int_pts,2+(1/3))+jiggle(0.05*venn_circle_rad));
label("{\tiny $3$}",point(int_pts,3+(2/3))+jiggle(0.05*venn_circle_rad));
label("{\tiny $7$}",z0+jiggle(0.05*venn_circle_rad));

shipout(bbox(0.25cm, filltype=FillDraw(fillpen=color_base)));
