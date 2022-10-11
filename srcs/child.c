/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   child.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 15:59:23 by jremy             #+#    #+#             */
/*   Updated: 2022/02/04 14:49:06 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

char	*__get_path(char *cmd, char *path, t_pipex *pipex, char **newargv)
{
	if (__strchr(cmd, '/') != NULL)
	{
		if (__strncmp(cmd, "./", 2) == 0)
			if (access(cmd + 2, F_OK) == 0)
				return (__strdup(cmd + 2));
		if (cmd[__strlen(cmd) - 1] == '/')
		{
			__free_split(newargv);
			__exit(pipex->av[pipex->index + 2], pipex, 69, 0);
		}
		if (access(cmd, F_OK) == 0)
			return (__strdup(cmd));
	}
	if (__strlen(cmd) == 0)
	{
		free(cmd);
		__free_split(newargv);
		__exit("", pipex, 127, 0);
	}
	if (path == NULL)
		return (NULL);
	else
		return (__get_path2(cmd, path));
}

int	__check_path(char *cmd, t_pipex *pipex, char **newargv)
{
	if (__strnstr(cmd, "//", __strlen(cmd)) != NULL)
	{	
		__free_split(newargv);
		if (cmd)
			free(cmd);
		__exit(pipex->av[pipex->index + 2], pipex, 69, 0);
	}
	return (0);
}

void	__child(t_pipex *pipex, t_cmd *cmd, char **envp)
{
	char	*path;
	char	**newargv;

	newargv = __split(cmd->cmd, ' ');
	if (!newargv)
		__exit("Malloc error in fork\n", pipex, 1, 0);
	path = __get_path(newargv[0], pipex->path, pipex, newargv);
	if (path == NULL || __check_path(path, pipex, newargv) == -1)
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
		__exit("", pipex, 0, 0);
	}
	free(path);
}
