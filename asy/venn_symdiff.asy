size(3cm,0);
// Colors from "Still not getting any" by sp613g, https://kuler.adobe.com/#themeID/181115 
pen color_light1=rgb(219,213,242);
pen color_dark1=rgb(22,64,89);
pen color_base=rgb(201,235,242);
pen color_dark2=rgb(69,115,110);
pen color_light2=rgb(242,226,196);

pair z0=(0,0);
pair z1=(-1,0);  // center of circle1
pair z2=(1,0);  //  center of circle2
real r=1.5;     // radius
path c1=circle(z1,r);
path c2=circle(z2,r);
fill(c1,color_light1);
fill(c2,color_light1);

picture intersection=new picture;
fill(intersection,c1,color_base);
clip(intersection,c2);

add(intersection);

draw(c1);
draw(c2);

//draw("$\A$",box,z1);              // Requires [inline] package option.
//draw(Label("$\B$","$B$"),box,z2); // Requires [inline] package option.
real label_offset_x=0.4*r, label_offset_y=0.5*r;
label("{\scriptsize $A$}",z1+(-1*label_offset_x,label_offset_y));            
label("{\scriptsize $B$}",z2+(label_offset_x,label_offset_y));

// pair z=(0,-2);
// real m=3;
// margin BigMargin=Margin(0,m*dot(unit(z1-z),unit(z0-z)));

// draw(Label("$A\cap B$",0),conj(z)--z0,Arrow,BigMargin);
// draw(Label("$A\cup B$",0),z--z0,Arrow,BigMargin);
// draw(z--z1,Arrow,Margin(0,m));
// draw(z--z2,Arrow,Margin(0,m));

shipout(bbox(0.25cm, filltype=FillDraw(fillpen=color_base)));
