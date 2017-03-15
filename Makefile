CFLAGS = -msse2 --std gnu99 -O0 -Wall -Wextra

SSE = -DSSE=1

SSE_PREFETCH = -DSSE_PREFETCH=1

NATIVE = -DNATIVE=1

GIT_HOOKS := .git/hooks/applied

all: $(GIT_HOOKS) main.c
	$(CC) $(CFLAGS) $(SSE) $(SSE_PREFETCH) $(NATIVE) -o main main.c
	$(CC) $(CFLAGS) $(SSE) -o main_sse main.c
	$(CC) $(CFLAGS) $(SSE_PREFETCH) -o main_sse_prefetch main.c
	$(CC) $(CFLAGS) $(NATIVE) -o main_native main.c

$(GIT_HOOKS):
	@scripts/install-git-hooks
	@echo

astyle:
	astyle --style=kr --indent=spaces=4 --indent-switches --suffix=none *.[ch]

clean:
	$(RM) main
