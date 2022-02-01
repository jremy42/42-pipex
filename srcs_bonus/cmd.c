/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cmd.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 15:59:31 by jremy             #+#    #+#             */
/*   Updated: 2022/01/31 15:59:34 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

t_cmd	*__cmd_new(char *content, int index)
{
	t_cmd	*newlst;

	newlst = malloc(sizeof(t_cmd));
	if (!newlst)
		return (NULL);
	newlst->cmd = __strdup(content);
	if (!newlst->cmd)
		return (NULL);
	newlst->index = index;
	newlst->next = NULL;
	return (newlst);
}

void	__cmd_add_back(t_cmd **alst, t_cmd *new)
{
	t_cmd	*nextlst;

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

int	__create_cmd(t_pipex *pipex, char **cmd, int ac)
{
	int		i;
	t_cmd	*tmp;
	char	*tmp_cmd;
	int		index;

	i = 2 + pipex->here_doc;
	index = 0;
	while (i < ac - 1 && cmd[i])
	{
		tmp_cmd = __strtrim(cmd[i], " \t\n");
		tmp = __cmd_new(tmp_cmd, index);
		free(tmp_cmd);
		if (!tmp)
			__exit("Malloc Error create cmd\n", pipex, 1, 0);
		__cmd_add_back(&pipex->cmd, tmp);
		i++;
		pipex->max_cmd = index;
		index++;
	}
	return (0);
}
