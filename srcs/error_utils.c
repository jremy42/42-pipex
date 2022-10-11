/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error_utils.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/03 10:37:08 by jremy             #+#    #+#             */
/*   Updated: 2022/02/04 15:02:00 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

int	__just_one_string(char *str)
{
	char	*error;

	error = NULL;
	error = __strdup("pipex: ");
	error = __strjoin(error, str);
	error = __strjoin(error, " No such file or directory\n");
	__putstr_fd(error, 2);
	if (error)
		free(error);
	return (127);
}

int	__print_error(char *str, int err, int end)
{
	char	*error;

	error = NULL;
	if (err == 69)
		return (__just_one_string(str));
	if ((err == 1 || err == 127 || err == 126 || err == 69) && end == 0)
		error = __strdup("pipex: ");
	if ((err == 127) && end == 0)
	{
		error = __strjoin(error, str);
		error = __strjoin(error, " command not found\n");
	}
	else if (err == 126 && end == 0)
	{
		error = __strjoin(error, str);
		error = __strjoin(error, " permission denied\n");
	}
	else
		error = __strjoin(error, str);
	__putstr_fd(error, 2);
	if (error)
		free(error);
	if (err == 1 && end == 0)
		perror("pipex");
	return (err);
}
