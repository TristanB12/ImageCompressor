##
## EPITECH PROJECT, 2021
## FUNPool pushswapchecker
## File description:
## Makefile
##

SRC_UT		=	$(addprefix $(SRC_UT_D), $(SRC_UT_F))
SRC_UT_D	=	test/
SRC_UT_F	=	UnitTests.hs \
				testGetOpts.hs

NAME_UT		=	unit_tests

all:
	stack build
	stack install
	mv imageCompressor-exe imageCompressor

$(NAME): $(SRC)
	$(CC) -o $(NAME) $(MAIN) $(SRC)

tests_run: clean $(SRC) $(SRC_UT)
	$(CC) -o $(NAME_UT) $(SRC) $(SRC_UT) $(FLAGS_UT)
	./$(NAME_UT)

coverage:
	hpc report --exclude=Main --decl-list $(NAME_UT)

clean:
	stack clean

re: clean all