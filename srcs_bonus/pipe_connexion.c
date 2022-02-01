/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipe_connexion.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 15:59:55 by jremy             #+#    #+#             */
/*   Updated: 2022/02/01 18:02:50 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex_bonus.h"

int	__first_pipe(t_pipex *pipex)
{
	if (pipex->here_doc == 1)
		pipex->file_in = __here_doc_pipe(pipex);
	else
		pipex->file_in = open(pipex->file, O_RDONLY);
	if (pipex->file_in < 0)
		__exit("Open error\n", pipex, 1, 0);
	if (dup2(pipex->pipe->pipe_fds[1], STDOUT_FILENO) < 0)
		__exit("", pipex, 1, 0);
	if (dup2(pipex->file_in, STDIN_FILENO) < 0)
		__exit("", pipex, 1, 0);
	__close(pipex->pipe->pipe_fds[0], pipex);
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
	return (0);
}
