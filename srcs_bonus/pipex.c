/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 16:00:18 by jremy             #+#    #+#             */
/*   Updated: 2022/02/03 14:23:33 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

void	__init_pipex(t_pipex *pipex, char *here_doc)
{
	pipex->pipe = NULL;
	pipex->cmd = NULL;
	pipex->path = NULL;
	pipex->file_in = 0;
	pipex->file_out = 0;
	pipex->index = 0;
	pipex->max_cmd = 0;
	pipex->eof = NULL;
	pipex->file = NULL;
	if (__strncmp(here_doc, "here_doc", 9) == 0)
		pipex->here_doc = 1;
	else
	{
		pipex->here_doc = 0;
		pipex->file = here_doc;
	}
}

char	*__find_path(char **envp)
{
	int	i;

	i = 0;
	while (envp[i] != NULL)
	{
		if (__strncmp(envp[i], "PATH", 4) == 0)
			return (envp[i] + 5);
		i++;
	}
	return (NULL);
}

void	__close_last_pipe(t_pipex *pipex, int pipe)
{
	t_pipe	*tmp;

	tmp = pipex->pipe;
	while (tmp->index != pipex->index)
	{
		if (tmp->index == pipex->index - 1)
			close(tmp->pipe_fds[0]);
		tmp = tmp->next;
	}
	__close(tmp->pipe_fds[pipe], pipex);
}

void	__pipex(t_pipex *pipex, char **envp, pid_t pid)
{
	t_cmd	*tmp;

	while (pipex->index < pipex->max_cmd)
	{	
		pid = fork();
		if (pid < 0)
			__exit("Fork error\n", pipex, 1, 0);
		if (pid == 0)
		{
			if (pipex->index == 0)
				__first_pipe(pipex);
			else
				__middle_pipe(pipex);
			tmp = pipex->cmd;
			while (tmp->index != pipex->index)
				tmp = tmp->next;
			__child(pipex, tmp, envp);
		}
		if (pipex->index == 0)
			__close(pipex->file_in, pipex);
		__close_last_pipe(pipex, 1);
		pipex->index++;
	}	
}

int	main(int ac, char **av, char **envp)
{
	t_pipex	pipex;
	pid_t	pid;
	int		ret;

	pid = 0;
	ret = 0;
	if (ac < 5)
		exit(1);
	if (__strncmp(av[1], "here_doc", 9) == 0 && ac < 6)
		exit(1);
	__init_pipex(&pipex, av[1]);
	__open_doc(&pipex, av, ac);
	pipex.path = __find_path(envp);
	__create_cmd(&pipex, av, ac);
	__create_pipe(&pipex);
	__pipex(&pipex, envp, pid);
	ret = __pipex_end(&pipex, envp);
	__exit("", &pipex, ret, 1);
	return (0);
}
