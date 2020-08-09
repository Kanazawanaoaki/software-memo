#define TABLE_SIZE 1000 /* ハッシュ表の大きさ */
typedef struct record1 {
  char name[16]; /* 名前 */
  char mail[16]; /* メールアドレス */
} RECORD1;
RECORD1 table[TABLE_SIZE]; /* ハッシュ表 */
