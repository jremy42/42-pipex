/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   exit.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 15:59:40 by jremy             #+#    #+#             */
/*   Updated: 2022/02/04 13:19:25 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex_bonus.h"

void	__close(int file, t_pipex *pipex)
{
	if (close(file) < 0)
		__exit("Close error\n", pipex, 1, 0);
}

int	__wait_child(pid_t pid)
{
	int	status;
	int	ret;

	status = 0;
	waitpid(pid, &status, 0);
	if (WIFEXITED(status) > 0)
		ret = (WEXITSTATUS(status));
	if (WIFSIGNALED(status) > 0)
		ret = (WTERMSIG(status));
	while (waitpid(-1, NULL, 0) > 0)
		;
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
		free(pipe);
		pipe = tmp;
	}
}

void	__exit(char *str, t_pipex *pipex, int err, int end)
{
	if (pipex->here_doc == 1)
		unlink(".hd.tmp");
	err = __print_error(str, err, end);
	__close_pipe(pipex->pipe);
	close(pipex->file_in);
	close(pipex->file_out);
	__free_cmd(pipex);
	exit(err);
}
