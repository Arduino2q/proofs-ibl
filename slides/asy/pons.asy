// pons.asy
// Jim Hefferon 2014-May-09 PD
import "../../ibl.asy" as ibl;
settings.outformat = "pdf";

texpreamble("\usepackage{conc}");
size(0,0);
defaultpen(0.4+miterjoin);
pen p=0.4+miterjoin+red;

real hgt=40pt;
real wdt=15pt;
pair P0=(0,hgt);   // top vertex
pair P1=(-1*wdt,0);  // left base vertex
pair P2=(1*wdt,0);  //  right base vertes
path b=P1--P0;  // left
path a=P2--P0;  // right
path c=P1--P2;  // base
path triangle = reverse(b)--c--a--cycle;
draw(triangle,p,marker=marker(scale(0.6pt)*unitcircle,red,FillDraw(white),above=true));

label("\scriptsize $A$",P1,align=W);
label("\scriptsize $B$",P2,align=E);
// label("$C$",P0,align=NE);
label("\scriptsize $a$",midpoint(a),align=E);
label("\scriptsize $b$",midpoint(b),align=W);
// draw(b,Label("b",position=MidPoint));
// draw(c,Label("c",position=MidPoint));
// shipout(bbox(0.25cm),xmargin=0.0pt);
