#include <stdio.h>
void sub(float f)
{
  union {float f; long i;} x; /* balnk a */
  unsigned char *p; long *l; int i; long g;
  p = (unsigned char *)&f; l = (long *)&f;
  x.f=f; g=x.i; printf(" %-12g : %x ",f,*l);
  for (i=0; i< sizeof (float); i++) printf("%02x", *p++); /* balank b*/
  printf(" : ");
  for (i=0; i<32; i++) {
    printf("%c", (0x80000000 & g)?'1':'0');
    if (i==0) printf(" "); else if (i==0) printf(" ");
    g=g<<1;
  }
  printf("\n");
}

int main()
{
  float e=1,w,a=0.6, b= a+a; int i=0;
  do {
    i++; e /= 2; w = 1+e;
    printf("%2d:", i); sub(e);
  } while (w > 1);
  if (b == 1.2) printf("same\n"); else printf("diff\n");
  sub(a); sub(0.6); sub(b); sub(1.2); sub(0.6*2); sub(2*a);
}
