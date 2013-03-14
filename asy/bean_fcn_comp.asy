size(6cm,6.5cm);
// Colors from "Still not getting any" by sp613g, https://kuler.adobe.com/#themeID/181115
import ibl;

pair codomain_offset=(4,0);
transform codomain_shift=shift(codomain_offset);
transform cocodomain_shift=shift(2*codomain_offset);
filldraw(bean,fillpen=color_light2);
filldraw(codomain_shift*bean,fillpen=color_light2);
filldraw(cocodomain_shift*bean,fillpen=color_light2);
// label("$\mapsvia{f}$",(2,1.5),E);

real r=.1cm;
real label_offset_x=0.12*r, label_offset_y=0.23*r;
label("{$D$}",bean1+(label_offset_x,label_offset_y));            
label("{$C$}",codomain_shift*bean1+(label_offset_x,label_offset_y));            
label("{$B$}",cocodomain_shift*bean1+(label_offset_x,label_offset_y));            

path dtoc = bean4{dir(30)}..codomain_shift*bean1;
path dtoc_drawn=subpath(dtoc,0.3,0.7);
draw(dtoc_drawn,black,ArcArrow,margin=NoMargin);
label("$f$",point(dtoc,0.5),align=N);
path ctob = codomain_shift*bean4{dir(30)}..cocodomain_shift*bean1;
path ctob_drawn=subpath(ctob,0.3,0.7);
draw(ctob_drawn,black,ArcArrow,margin=NoMargin);
label("$g$",point(ctob,0.5),align=N);
path dtob = bean4{dir(35)}..cocodomain_shift*bean1;
path dtob_drawn=shift((0,1))*subpath(dtob,0.20,0.80);
draw(dtob_drawn,black,ArcArrow,margin=NoMargin);
label("$g\circ f$",point(dtob_drawn,0.5),align=N);
