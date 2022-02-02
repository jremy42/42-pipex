/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   here_doc.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 15:59:47 by jremy             #+#    #+#             */
/*   Updated: 2022/02/02 18:57:47 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex_bonus.h"

char	*__get_stdin(t_pipex *pipex, char *stdin)
{
	char	*line;

	line = NULL;
	while (1)
	{
		__putstr_fd("heredoc> ", 1);
		line = get_next_line(0);
		if (__strncmp(line, pipex->eof, __strlen(pipex->eof)) == 0
			&& __strlen(line) == __strlen(pipex->eof) + 1)
		{
			get_next_line(-1);
			free(line);
			break ;
		}
		stdin = __strjoin(stdin, line);
		free (line);
		if (!stdin)
			return (NULL);
	}
	return (stdin);
}

int	__here_doc_pipe(t_pipex *pipex)
{
	char	*stdin;
	int		file;

	stdin = __strdup("");
	if (!stdin)
		return (-1);
	file = open(".hd.tmp", O_CREAT | O_WRONLY | O_TRUNC, 00644);
	if (file < 0)
		return (-1);
	stdin = __get_stdin(pipex, stdin);
	if (!stdin)
		return (-1);
	__putstr_fd(stdin, file);
	free(stdin);
	__close(file, pipex);
	file = open(".hd.tmp", O_RDONLY, 00644);
	return (file);
}

void	__open_doc(t_pipex *pipex, char **av, int ac)
{	
	if (pipex->here_doc == 1)
	{
		pipex->eof = av[2];
		pipex->file_out = open(av[ac -1], O_CREAT | O_WRONLY | O_APPEND, 00644);
		if (pipex->file_out < 0)
			__exit("Open error\n", pipex, 1, 0);
	}
	else
	{
		pipex->file_out = open(av[ac -1], O_CREAT | O_WRONLY | O_TRUNC, 00644);
		if (pipex->file_out < 0)
			__exit("Open error\n", pipex, 1, 0);
	}
}
