typedef struct record0 {
  char name[16]; /* 名前 */
  char mail[]16; /* メールアドレス */
  struct record0 *next;
} RECORD0;
RECORD0 *header;
