/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   child_utils.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 15:59:16 by jremy             #+#    #+#             */
/*   Updated: 2022/02/02 19:28:39 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

char	**__free_split(char**tab)
{
	int	i;

	i = 0;
	if (tab)
	{
		while (tab[i] != NULL)
		{
			free(tab[i]);
			tab[i] = NULL;
			i++;
		}
	}
	free(tab);
	return (NULL);
}

char	*__free_the_end(char **all_path)
{
	free(all_path);
	all_path = NULL;
	return (NULL);
}

char	*__create_tmp(char **all_path, int i, char *cmd)
{
	char	*tmp;
	char	*tmp2;

	tmp = NULL;
	tmp = __strjoin(all_path[i], "/");
	if (!tmp)
		return (NULL);
	tmp2 = __strjoin(tmp, cmd);
	if (!tmp2)
		return (NULL);
	return (tmp2);
}

char	*__get_path2(char *cmd, char *path)
{
	char	**all_path;
	char	*tmp2;
	int		i;

	i = 0;
	all_path = __split(path, ':');
	if (!all_path)
		return (NULL);
	while (all_path[i])
	{
		tmp2 = __create_tmp(all_path, i, cmd);
		if (!tmp2)
			return (__free_the_end(all_path));
		if (access(tmp2, F_OK) == 0)
		{
			while (all_path[i++])
				free(all_path[i]);
			free(all_path);
			return (tmp2);
		}
		i++;
		free(tmp2);
	}
	return (__free_the_end(all_path));
}
