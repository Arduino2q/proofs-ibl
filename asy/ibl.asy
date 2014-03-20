// ibl.asy
// Some cross-file definitions for the ibl book.
// Jim Hefferon jhefferon at smcvt.edu

// Colors from "Still not getting any" by sp613g, https://kuler.adobe.com/#themeID/181115 
pen color_light1=rgb(219,213,242);
pen color_dark1=rgb(22,64,89);
pen color_base=rgb(201,235,242);
pen color_dark2=rgb(69,115,110);
pen color_light2=rgb(242,226,196);

// Make a bean picture of a set
pair bean0=(0,0);
pair bean1=(0,1);  
pair bean2=(0,2);  
pair bean3=(1,0);  
pair bean4=(1,1);  
pair bean5=(1,2);  
path bean=bean4..bean3..bean0..bean2..bean5..cycle;

// Font size is LaTeX's \small
import fontsize;
defaultpen(fontsize(8pt));

// Read in the assorted style stuff, including default font
texpreamble("\usepackage{ibl_asy}");

// Pick a point at random inside a circle
pair jiggle(real radius) {
  real r=radius*unitrand();
  real theta=360*unitrand();
  return r*(Cos(theta),Sin(theta));
}
