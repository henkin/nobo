#include <stdio.h>  
#include <stdlib.h>  
#include <unistd.h>  
#include <signal.h>  
#include <string.h>  
#include <errno.h>  
#include <sys/time.h>  
#include <wiringPi.h>  
#define TRIGGER_PIN 23  
#define ECHO_PIN  24  
#define TIMEOUT 999 /* any value other than LOW or HIGH */  

int waitforpin(int pin, int level, int timeout)
{
	struct timeval now, start;
	int done;
	long micros;
	gettimeofday(&start, NULL);
	micros = 0;
	done = 0;
	while (!done)
	{
		gettimeofday(&now, NULL);
		if (now.tv_sec > start.tv_sec) micros = 1000000L; else micros = 0;
		micros = micros + (now.tv_usec - start.tv_usec);
		if (micros > timeout) done = 1;
		if (digitalRead(pin) == level) done = 1;
	}
	return micros;
}

float getDistance(int triggerPin, int echoPin)
{
	int pulsewidth;

	/* trigger reading */
	digitalWrite(triggerPin, HIGH);
	waitforpin(echoPin, TIMEOUT, 10); /* wait 10 microseconds */
	digitalWrite(triggerPin, LOW);
	/* wait for reading to start */
	waitforpin(echoPin, HIGH, 5000); /* 5 ms timeout */
	if (digitalRead(echoPin) == HIGH)
	{
		pulsewidth = waitforpin(echoPin, LOW, 60000L); /* 60 ms timeout */
		if (digitalRead(echoPin) == LOW)
		{
			/* valid reading code */
			float distance = ((float)pulsewidth / (float)29) / (float)2;
			//printf("echo at %d micros (%f)\n", pulsewidth, distance);
			return distance;
		}
		else
		{
			/* no object detected code */
			//printf("echo timed out\n");
			return -1;
		}
	}
	else
	{
		/* sensor not firing code */
		//printf("sensor didn't fire\n");
		return -1;
	}
	return 0;
}

int main(int argc, char *argv[])
{

	if (wiringPiSetupGpio() == -1)
	{
		fprintf(stderr, "Can't initialise wiringPi: %s\n", strerror(errno));
		return 1;
	}
	pinMode(TRIGGER_PIN, OUTPUT);
	pinMode(ECHO_PIN, INPUT);
	int i;
	for (i = 0; i < 10; i++)
	{
		float distance = getDistance(TRIGGER_PIN, ECHO_PIN);
		printf("d: (%f)\n", distance);
	}
	return 0;
}


