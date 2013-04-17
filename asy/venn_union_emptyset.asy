usepackage("../jh");
size(3cm,2cm);
// Colors from "Still not getting any" by sp613g, https://kuler.adobe.com/#themeID/181115 
pen color_light1=rgb(219,213,242);
pen color_dark1=rgb(22,64,89);
pen color_base=rgb(201,235,242);
pen color_dark2=rgb(69,115,110);
pen color_light2=rgb(242,226,196);

pair z0=(0,0);
pair z1=(0,0);  // center of circle1
real r=1.5;     // radius
path c1=circle(z1,r);
fill(c1,color_light1);

draw(c1);

real label_offset_x=0.4*r, label_offset_y=0.5*r;
label("{\scriptsize $A$}",z1+(-1*label_offset_x,label_offset_y));            

pair dot_loc=z1+(1.2*r,label_offset_y);
dot(dot_loc,linewidth(0.7pt)); // emptyset; has nothing in it?
label("{\scriptsize $\emptyset$}",dot_loc,E);            

draw((-1-r,0)--(1+r,0),nullpen); // empty line to make universal box same size as other two   

shipout(bbox(0.25cm, filltype=FillDraw(fillpen=color_base)));
