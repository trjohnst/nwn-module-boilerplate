#include "inc_gvfs"
int GetExperienceForLevel(int nLVL)
{
   return (nLVL * (nLVL -1)) * 500;
}
void main()
{
   object oPC = GetLastSpeaker();
   int nCommand = GetListenPatternNumber();
   int nMatches = GetMatchedSubstringsCount();
   string sTTL = "";
   string sWRK;
   int nHD = GetHitDice(oPC);
   int nHD_New;
   int nXP = GetXP(oPC);
   int nCommandValue;
   int nCNT;

// PC started conversation by clicking on NPC
   if (nCommand == -1)
   {
      ClearAllActions(TRUE);
      BeginConversation();
      return;
   }

// check to see if it was the PC, abort otherwise
   if (!GetIsPC(oPC))
      return;

// get the according case/pattern for Alignment Commands
   switch (nCommand)
   {
      case 3001: AdjustAlignment(oPC, ALIGNMENT_LAWFUL, 100);
                 AdjustAlignment(oPC, ALIGNMENT_GOOD, 100); break;
      case 3002: AdjustAlignment(oPC, ALIGNMENT_NEUTRAL, 50);
                 AdjustAlignment(oPC, ALIGNMENT_GOOD, 100); break;
      case 3003: AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 100);
                 AdjustAlignment(oPC, ALIGNMENT_GOOD, 100); break;
      case 3004: AdjustAlignment(oPC, ALIGNMENT_NEUTRAL, 50);
                 AdjustAlignment(oPC, ALIGNMENT_LAWFUL, 100); break;
      case 3005: AdjustAlignment(oPC, ALIGNMENT_NEUTRAL, 100); break;
      case 3006: AdjustAlignment(oPC, ALIGNMENT_NEUTRAL, 50);
                 AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 100); break;
      case 3007: AdjustAlignment(oPC, ALIGNMENT_LAWFUL, 100);
                 AdjustAlignment(oPC, ALIGNMENT_EVIL, 100); break;
      case 3008: AdjustAlignment(oPC, ALIGNMENT_NEUTRAL, 50);
                 AdjustAlignment(oPC, ALIGNMENT_EVIL, 100); break;
      case 3009: AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 100);
                 AdjustAlignment(oPC, ALIGNMENT_EVIL, 100); break;
      case 3010: ClearAllActions(TRUE);
                 ActionStartConversation(oPC, "gn1_stores", TRUE, TRUE);
                 break;
      case 3011: GiveGoldToCreature(oPC, 50000);
                 break;

// not an Alignment or Shop command - see what is what than
      case 3012:
      {
         sTTL = GetStringUpperCase(GetMatchedSubstring(0));
         nCommandValue = GetValueFromString(sTTL);

// add X XP
         if (FindSubString(sTTL, "XP+") == 0)
         {
            if (nCommandValue + nXP <= 780000)
               SetXP(oPC, nCommandValue + nXP);
         }

// subtract X XP
         else if (FindSubString(sTTL, "XP-") == 0)
         {
            if (nXP - nCommandValue >= 0)
               SetXP(oPC, nXP - nCommandValue);
         }

// set XP to value X
         else if (FindSubString(sTTL, "XP") == 0)
         {
            if (nCommandValue >= 0 && nCommandValue <= 780000)
               SetXP(oPC, nCommandValue);
         }

// add X levels
         else if (FindSubString(sTTL, "+") == 0)
         {
            if (nHD < 40)
               SetXP(oPC, GetExperienceForLevel(nHD + 1));
         }

// subtract X levels
         else if (FindSubString(sTTL, "-") == 0)
         {
            if (nHD > 1)
               SetXP(oPC, GetExperienceForLevel(nHD - 1));
         }

// set level to X
         else if (sTTL == IntToString(nCommandValue))
         {
            SetXP(oPC, GetExperienceForLevel(nCommandValue));
         }

// no valid command
         else SpeakString("Invalid command.");
      }
   }
}
