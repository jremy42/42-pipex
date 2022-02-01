/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jremy <jremy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 16:00:42 by jremy             #+#    #+#             */
/*   Updated: 2022/02/01 18:56:53 by jremy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PIPEX_H
# define PIPEX_H
# include <stdio.h>
# include <unistd.h>
# include <stdlib.h>
# include "libft.h"
# include <fcntl.h>
# include <sys/wait.h>
# define _HD 1

typedef struct s_pipe
{
	int				stdout_cpy;
	int				stdin_cpy;
	int				pipe_fds[2];
	int				index;
	struct s_pipe	*next;
}	t_pipe;

typedef struct s_cmd
{
	char			*cmd;
	int				index;
	struct s_cmd	*next;
}	t_cmd;

typedef struct s_pipex
{
	t_pipe	*pipe;
	t_cmd	*cmd;
	int		file_in;
	int		file_out;
	int		max_cmd;
	int		index;
	char	*path;
	int		here_doc;
	char	*file;
	char	*eof;
}	t_pipex;

void	__exit(char *str, t_pipex *pipex, int err, int end);
int		__create_cmd(t_pipex *pipex, char **cmd, int ac);
void	__child(t_pipex *pipex, t_cmd *cmd, char **envp);
void	__parent(t_pipex *pipex, t_cmd *cmd, char **envp);
void	__connect_pipe_child(t_pipex *pipex);
char	*__get_path(char *cmd, char *path);
char	**__free_split(char**tab);
void	__connect_pipe_parent(t_pipex *pipex);
int		__create_pipe(t_pipex *pipex);
int		__last_pipe(t_pipex *pipex);
int		__first_pipe(t_pipex *pipex);
int		__middle_pipe(t_pipex *pipex);
void	__whats_in_pipe(t_pipex *pipex);
int		__good_pipe(t_pipex *pipex);
int		__here_doc_pipe(t_pipex *pipex);
void	__open_doc(t_pipex *pipex, char **av, int ac);
int		__wait_child(pid_t pid);
void	__close(int file, t_pipex *pipex);
int		__here_doc_pipe(t_pipex *pipex);
int		__pipex_end(t_pipex *pipex, char **envp);
void	__close_pipe(t_pipe *pipe);
void	__close_last_pipe(t_pipex *pipex, int pipe);

#endif