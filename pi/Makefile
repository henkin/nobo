all:
	gcc -Wall -fpic -c sonar.c -lpthread -lwiringPi
	gcc -shared -o libsonar.so sonar.o
	rm sonar.o

