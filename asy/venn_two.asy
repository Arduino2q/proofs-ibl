// venn_two.asy
// Jim Hefferon 2014-Mar-18 PD
import ibl;
size(3cm,0);

pair z0=(0,0);
pair z1=(-1,0);  // center of circle1
pair z2=(1,0);  //  center of circle2
real r=1.5;     // radius
path c1=circle(z1,r);
path c2=circle(z2,r);
fill(c1,color_light1);
fill(c2,color_light1);
draw(c1);
draw(c2);

picture a_box=new picture;
picture b_box=new picture;
real label_offset_x=0.4*r, label_offset_y=0.5*r;
pair label_offset=(label_offset_x,label_offset_y);
label(a_box,"{\scriptsize $A$}",z1+(-1*label_offset_x,label_offset_y));
label(b_box,"{\scriptsize $B$}",z2+(label_offset_x,label_offset_y));
add(a_box,filltype=Fill(white));
add(b_box,filltype=Fill(white));


label("{\tiny $0$}",(-1-0.9*r,-1*r));
label("{\tiny $1$}",z2+(0.5*label_offset_x,-0.25*label_offset_y)+jiggle(.05*r));
label("{\tiny $2$}",z1+(-0.5*label_offset_x,-0.25*label_offset_y)+jiggle(.05*r));
label("{\tiny $3$}",z0+jiggle(.05*r));


// pair z=(0,-2);
// real m=3;
// margin BigMargin=Margin(0,m*dot(unit(z1-z),unit(z0-z)));

// draw(Label("$A\cap B$",0),conj(z)--z0,Arrow,BigMargin);
// draw(Label("$A\cup B$",0),z--z0,Arrow,BigMargin);
// draw(z--z1,Arrow,Margin(0,m));
// draw(z--z2,Arrow,Margin(0,m));

shipout(bbox(0.25cm, filltype=FillDraw(fillpen=color_base)));
