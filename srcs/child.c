/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   child.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 15:59:23 by jremy             #+#    #+#             */
/*   Updated: 2022/02/03 13:12:58 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

char	*__get_path(char *cmd, char *path)
{
	if (__strchr(cmd, '/') != NULL)
	{
		if (__strncmp(cmd, "./", 2) == 0)
		{
			if (access(cmd + 2, F_OK) == 0)
				return (__strdup(cmd + 2));
		}
		if (access(cmd, F_OK) == 0)
			return (__strdup(cmd));
	}
	if (path == NULL)
		return (NULL);
	else
		return (__get_path2(cmd, path));
}

int	__check_path(char *cmd)
{
	if (__strnstr(cmd, "//", __strlen(cmd)) != NULL)
	{
		if (cmd)
			free(cmd);
		return (-1);
	}
	if (cmd[__strlen(cmd) - 1] == '/')
	{
		if (cmd)
			free(cmd);
		return (-1);
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
	path = __get_path(newargv[0], pipex->path);
	if (path == NULL || __check_path(path) == -1)
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
