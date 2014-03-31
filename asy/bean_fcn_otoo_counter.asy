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
real bar_length=2.5pt;
// real label_offset_x=0.12*r, label_offset_y=0.23*r;
// label("{$D$}",bean1+(label_offset_x,label_offset_y));            
// label("{$C$}",codomain_shift*bean1+(label_offset_x,label_offset_y));
pair zero=bean1+(0.14*r,0.28*r);
pair one=bean0+(0.18*r,0.30*r);
dot("{$0$}",zero,align=W);
dot("{$1$}",one,align=W);
pair a=codomain_shift*(bean1+(0.14*r,0.26*r));
pair b=codomain_shift*(bean0+(0.18*r,0.35*r));
pair c=codomain_shift*(bean0+(0.12*r,0.10*r));
dot("{$a$}",a,align=N);
dot("{$b$}",b,align=N);
dot("{$c$}",c,align=N);
pair alpha=codomain_shift*codomain_shift*(bean1+(0.16*r,0.20*r));
pair beta=codomain_shift*codomain_shift*(bean0+(0.14*r,0.20*r));
dot("{$\alpha$}",alpha,align=E);
dot("{$\beta$}",beta,align=E);

path zero_to_b = zero{dir(30)}..b;
path one_to_c = one{dir(20)}..c;

path zero_to_b_drawn = subpath(zero_to_b,0.04,0.96);  // I don't think bar takes account of Margin
draw(zero_to_b_drawn,black,BeginBar(bar_length),Arrow(TeXHead),margin=NoMargin);
path one_to_c_drawn = subpath(one_to_c,0.04,0.96);  
draw(one_to_c_drawn,black,BeginBar(bar_length),Arrow(TeXHead),margin=NoMargin);

path a_to_alpha = a{dir(20)}..alpha;
path b_to_alpha = b{dir(20)}..alpha;
path c_to_beta = c{dir(20)}..beta;

path a_to_alpha_drawn = subpath(a_to_alpha,0.04,0.96);  // I don't think bar takes account of Margin
draw(a_to_alpha_drawn,black,BeginBar(bar_length),Arrow(TeXHead),margin=NoMargin);
path b_to_alpha_drawn = subpath(b_to_alpha,0.04,0.96);  
draw(b_to_alpha_drawn,black,BeginBar(bar_length),Arrow(TeXHead),margin=NoMargin);
path c_to_beta_drawn = subpath(c_to_beta,0.04,0.96);  
draw(c_to_beta_drawn,black,BeginBar(bar_length),Arrow(TeXHead),margin=NoMargin);
