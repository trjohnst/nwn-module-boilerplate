/*
   If there is a numeric character sequence within a string of both numeric and
   alphanumeric characters, this function will extract the numeric characters
   and return an int with the according value.

   Examples: nGold = GetValueFromString("Give me 25 gold."); // nGold will be 25
             nGold = GetValueFromString("I only have 0 gold); // nGold will be 0

   If there isn't a numeric expression within a string, GetValueFromString()
   will return -1. In case an error occurs, the return value is -255.

   Currently GetValueFromString only works with integer values of 0+, and only if
   there is just one numeric expression in a string. In case there are more then
   just one numeric expressions in the source string, only the first one will be
   returned.

   Example: nDistance = GetValueFromString("The next town is 5.23 miles from here");

   In this case, nDistance will be 5.
*/
int GetValueFromString(string sSource)
{
   string sPuffer;
   string sSingleLeft;
   string sNUM;
   int nLEN = GetStringLength(sSource);
   int nValue;
   int nNUMStart = 255;
   int nLoop;
   int nCNT1;

// Return -1 immediately in case source string is a null-string ("").
   if (nLEN = 0)
   {
      return -1;
   }

// Determine the starting position of the numeric expression.
   for (nLoop = 0; nLoop < 10; nLoop++)
   {
      nCNT1 = FindSubString(sSource, IntToString(nLoop));
      if (nCNT1 != -1 && nCNT1 < nNUMStart)
      {
         nNUMStart = nCNT1;
      }
   }

// If there wasn't a single number in the source string, return -1.
   if (nNUMStart == 255)
   {
      return -1;
   }

// Copy a part of the source string into a puffer; start at the location of the
// first numeric character. If starting location is right at the beginning of
// the source string, copy it all.
// Example: sSource = "Give me 25 gold.";
//          sPuffer = "25 gold.";
   if (nNUMStart == 0)
   {
      sPuffer = sSource;
   }
   else
   {
      sPuffer = GetSubString(sSource, nNUMStart, (nLEN - nNUMStart));
   }

// Copy the single left-most character to sNUM, then remove the single left-most
// character from sPuffer; repeat until single left-most character of sPuffer
// isn't a numeric character.
   sSingleLeft = GetStringLeft(sPuffer, 1);

// StringToInt() returns 0 (zero) both on an error, and if the character
// actually was "0" and thus valid
   while (sSingleLeft == (IntToString(StringToInt(sSingleLeft))))
   {
      sNUM += sSingleLeft;
      sPuffer = GetStringRight(sPuffer, GetStringLength(sPuffer) -1);
      sSingleLeft = GetStringLeft(sPuffer, 1);
   }

// Check the result with itself; in case an error occurs, return -255.
   if (sNUM != (IntToString(StringToInt(sNUM))))
   {
      return -255;
   }
   else
   {
      return StringToInt(sNUM);
   }
}
