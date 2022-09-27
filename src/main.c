#include <stdio.h>
#include <string.h>

#define ASCII_A 0x41
#define ASCII_Z 0x5A
#define CACHE_DISABLE 0
#define CACHE_ENABLE 1

extern unsigned int readCR0();

void printHelp();
void displayCacheFlags();
int setCacheFlags(int);

int main(int argc, char* argv[])
{
	char cMode = 'r';
	int iResult;

	if(argc > 0)
	{
		if(strlen(argv[1]) > 1)
		{
			printHelp();
			return 1;
		}

		cMode = argv[1][0];
		if(cMode >= ASCII_A && cMode <= ASCII_Z) cMode -= 0x20;	//Lowercase the input char
		switch(cMode)
		{
			case 'r':
				displayCacheFlags();
				break;
			case 'd':
				iResult = setCacheFlags(0);
				break;
			case 'e':
				iResult = setCacheFlags(1);
				break;
			default:
				printHelp();
				return 1;
		}
	}

	return 0;
}

void printHelp()
{
	printf("\nValid arguments:\nr Read current cache flags\nd  Disable cache\ne  Enable cache\n");
	return;
}

void displayCacheFlags()
{
	printf("Current cache flags\n");

	return;
}

int setCacheFlags(int iEnabled)
{
	//int iCD, iNW;
	long iCR;
	printf("Set cache flags WIP");
	iCR = readCR0();
	printf("0b", iCR);

	return 0;
}
