/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error_utils.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/03 10:37:08 by jremy             #+#    #+#             */
/*   Updated: 2022/02/04 11:02:29 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex_bonus.h"

void	__print_error(char *str, int err, int end)
{
	char	*error;

	error = NULL;
	if ((err == 1 || err == 127 || err == 126) && end == 0)
		error = __strdup("pipex: ");
	if (err == 127 && end == 0)
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
}
