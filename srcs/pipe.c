/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipe.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 16:00:06 by jremy             #+#    #+#             */
/*   Updated: 2022/02/01 17:11:52 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

t_pipe	*__pipe_new(int index)
{
	t_pipe	*newlst;

	newlst = malloc(sizeof(t_pipe));
	if (!newlst)
		return (NULL);
	newlst->stdin_cpy = 0;
	newlst->stdout_cpy = 0;
	if (pipe(newlst->pipe_fds) < 0)
	{
		free(newlst);
		return (NULL);
	}	
	newlst->index = index;
	newlst->next = NULL;
	return (newlst);
}

void	__pipe_add_back(t_pipe **alst, t_pipe *new)
{
	t_pipe	*nextlst;

	if (!(*alst))
		*alst = new;
	else
	{
		nextlst = (*alst);
		while (nextlst->next)
			nextlst = nextlst->next;
		nextlst->next = new;
	}
}

int	__create_pipe(t_pipex *pipex)
{
	int		i;
	t_pipe	*tmp;
	int		index;

	i = 0;
	index = 0;
	while (i <= pipex->max_cmd)
	{
		tmp = __pipe_new(index);
		if (!tmp)
			__exit("Pipe Error\n", pipex, 1, 0);
		__pipe_add_back(&pipex->pipe, tmp);
		i++;
		index++;
	}
	return (0);
}

int	__pipex_end(t_pipex *pipex, char **envp)
{
	t_cmd	*tmp;

	__last_pipe(pipex);
	tmp = pipex->cmd;
	while (tmp->index != pipex->index)
		tmp = tmp->next;
	__child(pipex, tmp, envp);
	return (0);
}
