#define SLRE_IMPLEMENTATION
#include <slre.h>
#include <stdio.h>


int main() {
  const char *pattern = "([a-z]+)";
  const char *text = "hello123";
  struct slre_cap caps[10];

  if (slre_match(pattern, text, strlen(text), caps, 10, 0) > 0) {
    printf("Match found: %.*s\n", caps[0].len, caps[0].ptr);
  } else {
    printf("No match found.\n");
  }

  return 0;
}
