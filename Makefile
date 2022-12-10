# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: therodri <therodri@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/08 20:56:08 by therodri          #+#    #+#              #
#    Updated: 2022/12/10 05:28:11 by therodri         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
MAIN = main.c
BONUS = norelink_bonus

CC = cc
CFLAGS = -Wall -Wextra -Werror
AR = ar rcs

FILES = ft_atoi ft_bzero ft_calloc ft_isalnum ft_isascii ft_isdigit ft_isprint\
	ft_itoa ft_memchr ft_memcpy ft_memmove ft_memset ft_putchar_fd ft_putendl_fd\
	ft_putnbr_fd ft_split ft_strchr ft_strdup ft_striteri ft_strjoin ft_strlcat\
	ft_strlen ft_strmapi ft_strncmp ft_strnstr ft_strrchr ft_strtrim ft_substr\
	ft_tolower ft_toupper ft_putstr_fd ft_strlcpy ft_memcmp ft_isalpha
BONUS_FILES = ft_lstlast_bonus ft_lstdelone_bonus ft_lstadd_back_bonus ft_lstsize_bonus ft_lstnew_bonus ft_lstadd_front_bonus\
	ft_lstclear_bonus ft_lstiter_bonus ft_lstmap_bonus
	
OBJS_DIR = ./	
SRCS_DIR = ./src/
BONUS_DIR = ./_bonus/
HEADER_DIR = ./header/
NORELINK_DIR = ./norelink/

SRCS = $(addprefix $(SRCS_DIR), $(addsuffix .c, $(FILES)))
BONUS_SRC = $(addprefix $(BONUS_DIR), $(addsuffix .c, $(BONUS_FILES)))

OBJS = $(addprefix $(SRCS_DIR), $(addsuffix .o, $(FILES)))
OBJS_BONUS = $(addprefix $(BONUS_DIR), $(addsuffix .o, $(BONUS_FILES)))

all:$(NAME)

$(NAME): $(OBJS)
	@${AR} $@ $^
	@echo "\033[1;32m\nLibft Done!\033[0m"
%.o: %.c
	@printf "\033[1;32mGenerating libftobject..." 
	@printf "\033[1;36m%-38.38s \r" $@
	@$(CC) $(CFLAGS) -c $< -o $@
	
clean: 
	@rm -f $(OBJS) $(OBJS_BONUS)
fclean: clean
	@rm -f $(NAME) $(NORELINK_DIR)$(BONUS)
	
re: clean all
bonus: all $(NORELINK_DIR)$(BONUS)

$(NORELINK_DIR)$(BONUS) : $(OBJS_BONUS)
	@touch $(NORELINK_DIR)$(BONUS)
	@${AR} $(NAME) $(OBJS) $^
	@echo "\033[1;32m\nLibft_Bonus Done!\033[0m"
	
%_bonus.o: %_bonus.c
	@printf "\033[1;32mGenerating Bonus..."
	@printf "\033[1;36m%-38.38s \r" $@
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY: all bonus
