#define SLRE_IMPLEMENTATION
#include <slre.h>
#include <stdio.h>
#include <string.h>


int main() {
  const char *pattern = "(https?://\\S+)";
  const char *text = "Visit https://example.com for more info.";
  struct slre_cap caps[10];

  if (slre_match(pattern, text, strlen(text), caps, 10, 0) > 0) {
    printf("URL found: %.*s\n", caps[0].len, caps[0].ptr);
  } else {
    printf("No URL found.\n");
  }

  return 0;
}
