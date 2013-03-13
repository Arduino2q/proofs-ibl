size(4cm,3cm);
// Colors from "Still not getting any" by sp613g, https://kuler.adobe.com/#themeID/181115
import ibl;

pair codomain_offset=(4,0);
transform codomain_shift=shift(codomain_offset);
filldraw(bean,fillpen=color_light2);
filldraw(codomain_shift*bean,fillpen=color_light2);
// label("$\mapsvia{f}$",(2,1.5),E);

real r=.1cm;
real label_offset_x=0.12*r, label_offset_y=0.23*r;
label("{$D$}",bean1+(label_offset_x,label_offset_y));            
label("{$C$}",codomain_shift*bean1+(label_offset_x,label_offset_y));            

path dtoc = bean4{dir(30)}..codomain_shift*bean1;
path dtoc_drawn=subpath(dtoc,0.3,0.7);
draw(dtoc_drawn,black,ArcArrow,margin=NoMargin);
label("$f$",point(dtoc,0.5),align=N);
