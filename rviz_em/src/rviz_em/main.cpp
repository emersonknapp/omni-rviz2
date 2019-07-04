#include <stdio.h>
#include <rcutils/find.h>

int main(int, char **) {
  printf("Hello javascript\n");
  const char * str = "porzop";
  size_t idx = rcutils_find(str, 'z');
  printf("What go on %zu\n", idx);
  return 0;
}
