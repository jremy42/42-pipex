# include <stdio.h>
# include <unistd.h>
# include <stdlib.h>
# include "libft.h"
# include <fcntl.h>
# include <sys/wait.h>

int main()
{
    int pipe[2];

    while (1)
        pipe(&pipe);
}