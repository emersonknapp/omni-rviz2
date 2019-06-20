#include <stdio.h>
#include <rcutils/find.h>

int main(int, char **) {
  printf("Hello javascript\n");
  // rcutils_allocator_t allocator;
  // const char * p0 = "foop";
  // const char * p1 = "barp";
  // const char * joined = rcutils_join_path(p0, p1, allocator);
  // printf("%s ++ %s === %s\n", p0, p1, joined);
  const char * str = "porzop";
  size_t idx = rcutils_find(str, 'z');
  printf("What go on %zu\n", idx);

  return 0;
}
