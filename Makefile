SRC = srcs/pipex.c \
	srcs/exit.c\
	srcs/cmd.c\
	srcs/child.c\
	srcs/pipe.c\
	srcs/child_utils.c\
	srcs/pipe_connexion.c\
	srcs/here_doc.c


SRC_BONUS = srcs_bonus/pipex.c \
	srcs_bonus/exit.c\
	srcs_bonus/cmd.c\
	srcs_bonus/child.c\
	srcs_bonus/pipe.c\
	srcs_bonus/child_utils.c\
	srcs_bonus/pipe_connexion.c\
	srcs_bonus/here_doc.c

IFLAGS =  -I includes/ -I libft/includes
CFLAGS = -Wall -Wextra -Werror
CC = gcc
OBJ = $(addprefix $(OBJS_PATH), $(SRC:.c=.o))
OBJ_BONUS = $(addprefix $(OBJS_PATH), $(SRC_BONUS:.c=.o))
HEADER = includes/pipex.h
HEADER_BONUS = includes/pipex_bonus.h
LIBFT = ./libft
OBJS_PATH = ./objs/
NAME = pipex
NAME_BONUS = pipex_bonus

$(OBJS_PATH)%.o: %.c $(HEADER) $(HEADER_BONUS)
		mkdir -p $(dir $@)
		$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

all: $(NAME)

bonus: $(NAME_BONUS)

$(NAME_BONUS): ${OBJ_BONUS} ${HEADER_BONUS} ${LIBFT}
		@make -C ${LIBFT}
		#@cp libft/libft.a  ./libft.a
		$(CC) $(CFLAGS) ${OBJ_BONUS} -Llibft -lft -o $(NAME_BONUS)

$(NAME): $(OBJ) ${HEADER} ${LIBFT}
		@make -C ${LIBFT}
		#@cp libft/libft.a  ./libft.a
		$(CC) $(CFLAGS) ${OBJ} -Llibft -lft -o $(NAME)

clean:
	rm -rf ${OBJS_PATH}
	@make clean -C $(LIBFT)

fclean: clean
	rm -f $(NAME)
	rm -f $(NAME_BONUS)
	rm -f libft.a
	@make fclean -C $(LIBFT)

re: fclean all

.PHONY: all clean fclean
