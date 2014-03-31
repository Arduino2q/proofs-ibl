size(4cm,3cm);
// Colors from "Still not getting any" by sp613g, https://kuler.adobe.com/#themeID/181115
import ibl;

pair codomain_offset=(4,0);
transform codomain_shift=shift(codomain_offset);
filldraw(bean,fillpen=color_light2);
filldraw(codomain_shift*bean,fillpen=color_light2);
filldraw(codomain_shift*codomain_shift*bean,fillpen=color_light2);

real r=.1cm;
real bar_length=2.5pt;
// real label_offset_x=0.12*r, label_offset_y=0.23*r;
// label("{$D$}",bean1+(label_offset_x,label_offset_y));            
// label("{$C$}",codomain_shift*bean1+(label_offset_x,label_offset_y));
pair a=bean1+(0.12*r,0.20*r);
pair fa=codomain_shift*bean1+(0.05*r,0.18*r);
dot("{$a$}",a,align=W);
dot("{$f(a)$}",fa,align=E);
path atofa = a{dir(30)}..fa;
path atofa_drawn = subpath(atofa,0.04,0.96);  // I don't think bar takes account of Margin
draw(atofa_drawn,black,BeginBar(bar_length),Arrow(TeXHead),margin=NoMargin);
pair b=bean0+(0.18*r,0.26*r);
pair fb=codomain_shift*bean0+(0.01*r,0.20*r);
dot("{$b$}",b,align=W);
dot("{$f(b)$}",fb,align=E);
path btofb = b{dir(30)}..fb;
path btofb_drawn = subpath(btofb,0.04,0.96);  // I don't think bar takes account of Margin
draw(btofb_drawn,black,BeginBar(bar_length),Arrow(TeXHead),margin=NoMargin);


