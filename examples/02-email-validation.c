#define SLRE_IMPLEMENTATION
#include <slre.h>
#include <stdio.h>


int main() {
  const char *pattern = "^[\\w.%+-]+@[\\w.-]+\\.[a-zA-Z]{2,}$";
  const char *email = "test@example.com";
  struct slre_cap caps[10];

  if (slre_match(pattern, email, strlen(email), caps, 10, 0) > 0) {
    printf("Valid email: %s\n", email);
  } else {
    printf("Invalid email.\n");
  }

  return 0;
}
