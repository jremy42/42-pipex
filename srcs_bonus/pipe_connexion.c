/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipe_connexion.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 15:59:55 by jremy             #+#    #+#             */
/*   Updated: 2022/02/04 11:16:14 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex_bonus.h"

int	__kill_pipe(t_pipex *pipex, int index)
{
	t_pipe	*tmp;

	tmp = pipex->pipe;
	while (tmp->index != index)
	{
		close(tmp->pipe_fds[0]);
		tmp = tmp->next;
	}
	while (tmp != NULL)
	{
		close(tmp->pipe_fds[0]);
		close(tmp->pipe_fds[1]);
		tmp = tmp->next;
	}
	return (0);
}

int	__first_pipe(t_pipex *pipex)
{
	pipex->file_in = open(pipex->file, O_RDONLY);
	if (pipex->file_in < 0)
		__exit("Open error\n", pipex, 1, 0);
	if (dup2(pipex->pipe->pipe_fds[1], STDOUT_FILENO) < 0)
		__exit("", pipex, 1, 0);
	if (dup2(pipex->file_in, STDIN_FILENO) < 0)
		__exit("", pipex, 1, 0);
	__close(pipex->pipe->pipe_fds[0], pipex);
	__kill_pipe(pipex, pipex->index);
	return (0);
}

int	__last_pipe(t_pipex *pipex)
{
	t_pipe	*tmp;

	tmp = pipex->pipe;
	while (tmp->index != pipex->max_cmd - 1)
		tmp = tmp->next;
	if (dup2(pipex->file_out, STDOUT_FILENO) < 0)
		__exit("", pipex, 1, 0);
	if (dup2(tmp->pipe_fds[0], STDIN_FILENO) < 0)
		__exit("", pipex, 1, 0);
	__kill_pipe(pipex, pipex->index);
	return (0);
}

int	__middle_pipe(t_pipex *pipex)
{
	t_pipe	*tmp;

	tmp = pipex->pipe;
	while (tmp->index != pipex->index - 1)
		tmp = tmp->next;
	if (dup2(tmp->next->pipe_fds[1], STDOUT_FILENO) < 0)
		__exit("", pipex, 1, 0);
	if (dup2(tmp->pipe_fds[0], STDIN_FILENO) < 0)
		__exit("", pipex, 1, 0);
	__kill_pipe(pipex, pipex->index);
	return (0);
}
