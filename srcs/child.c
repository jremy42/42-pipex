/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   child.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 15:59:23 by jremy             #+#    #+#             */
/*   Updated: 2022/02/02 13:04:10 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

void	__child(t_pipex *pipex, t_cmd *cmd, char **envp)
{
	char	*path;
	char	**newargv;

	newargv = __split(cmd->cmd, ' ');
	if (!newargv)
		__exit("Malloc error in fork\n", pipex, 1, 0);
	path = __get_path(newargv[0], pipex->path);
	if (path == NULL)
	{
		__free_split(newargv);
		__exit(cmd->cmd, pipex, 127, 0);
	}
	if (access(path, X_OK) == -1)
	{
		__free_split(newargv);
		free(path);
		__exit(cmd->cmd, pipex, 126, 0);
	}
	if (execve(path, newargv, envp) == -1)
	{
		__free_split(newargv);
		free(path);
		__exit("", pipex, 2, 0);
	}
	free(path);
}
