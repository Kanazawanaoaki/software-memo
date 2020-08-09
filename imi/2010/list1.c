int getRLE(unsigned char *img, int x, int mx, int lim, int *run, unsigned char *code)
{
  int px;

  px = x; *run = 1; *code = img[px];
  px++;
  while(px<mx && *code==img[px] && *run<lim) {
    px++; (*run)++;
  }
  return px;
}

int encode(FILE *fp, unsigned char *img, int mx)
{
  int run;
  unsigned char code;
  int x;
  x = 0;
  while (x <mx) {
    x = getRLE(img,x,mx,0x7f,&run,&code);
    if (run < 2) {
      if (code < 0x80) {
	fputc((int)code,fp);
      } else {
	fputc(0x81,fp);
	fputc((int)code,fp);
      }
    } else {
      fputc(run|0x80,fp);
      fputc((int)code,fp);
    }
  }
  return 0;
}
    
