/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   exit.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 15:59:40 by jremy             #+#    #+#             */
/*   Updated: 2022/02/01 15:40:09 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

void	__close(int file, t_pipex *pipex)
{
	if (close(file) < 0)
		__exit("Close error\n", pipex, 1, 0);
}

int	__wait_child(void)
{
	int	status;
	int	ret;

	status = 0;
	wait(&status);
	if (WIFEXITED(status) > 0)
		ret = (WEXITSTATUS(status));
	if (WIFSIGNALED(status) > 0)
		ret = (WTERMSIG(status));
	return (ret);
}

void	__free_cmd(t_pipex *pipex)
{
	t_cmd	*tmp;

	while (pipex->cmd != NULL)
	{
		tmp = pipex->cmd->next;
		free(pipex->cmd->cmd);
		free(pipex->cmd);
		pipex->cmd = tmp;
	}
	return ;
}

void	__close_pipe(t_pipe *pipe)
{
	t_pipe	*tmp;

	while (pipe != NULL)
	{
		tmp = pipe->next;
		close(pipe->pipe_fds[0]);
		close(pipe->pipe_fds[1]);
		free(pipe);
		pipe = tmp;
	}
}

void	__exit(char *str, t_pipex *pipex, int err, int end)
{
	if (pipex->here_doc == 1)
		unlink(".hd.tmp");
	if ((err == 1 || err == 127 || err == 126) && end == 0)
		__putstr_fd("pipex: ", 2);
	if (err == 127 && end == 0)
	{
		__putstr_fd(str, 2);
		__putstr_fd(" command not found\n", 2);
	}
	else if (err == 126 && end == 0)
	{
		__putstr_fd(str, 2);
		__putstr_fd(" permission denied\n", 2);
	}
	else
		__putstr_fd(str, 2);
	if (err == 1)
		perror("pipex");
	__close_pipe(pipex->pipe);
	close(pipex->file_in);
	close(pipex->file_out);
	__free_cmd(pipex);
	exit(err);
}
