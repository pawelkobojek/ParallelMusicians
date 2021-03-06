CC=mpicc
C_FLAGS=-Wall  -g
L_FLAGS=-lm -lrt
TARGET=prlab4
FILES=main.o
SOURCE=main.c
HOSTFILE=hosts
N=6
POS_FILE=./pozycje

.PHONY: compile run clean

compile: ${TARGET}

${TARGET}: ${FILES}
	${CC} -o ${TARGET} ${FILES} ${L_FLAGS}

${FILES}: ${SOURCE}
	${CC} -o ${FILES} -c ${SOURCE} ${C_FLAGS}

run:
	mpirun --hostfile ${HOSTFILE} ./${TARGET} ${N} ${POS_FILE}
	
clean:
	-rm -f ${FILES} ${TARGET}

nompi: main.c
	gcc -Wall -o main main.c -lm
