/*
 *  Discord Server Status Updates
 *
 *  Notifies a discord channel of player and DM logs in and out
 */
#include "nwnx_webhook"

//
// Header
//

// Call this to announce anyone joining in OnClientEnter
void QueueJoinNotification(object oPC);

// Call this to announce anyone leaving in OnClientLeave
void QueueLeaveNotification(object oPC);

//
// Config Constants
//

const string DISCORD_WEBHOOK_ID = "";
const string DISCORD_WEBHOOK_TOKEN = "";
const int ANNOUNCE_DMS = FALSE;

//
// Private Methods
//

int _GetPlayerCount() {
  int nPlayerCount = 0;
  object oPC = GetFirstPC();

  while (GetIsObjectValid(oPC)) {
    if (!GetIsDM(oPC)) {
      nPlayerCount = nPlayerCount + 1;
    }
    
    oPC = GetNextPC();
  }
  
  return nPlayerCount;
}

string _GetPlayerCountSentence(int nPlayerCount) {
  if (nPlayerCount == 0) {
    return "There are no players online.";
  } else if (nPlayerCount == 1) {
    return "There is now 1 player online.";
  } else {
    string sPlayerCount = IntToString(nPlayerCount);
    return "There are now " + sPlayerCount + " players online.";
  }
}

void _NotifyDiscordOfChanges(string sMessage) {
  string path = "/api/webhooks/" + DISCORD_WEBHOOK_ID + "/" + DISCORD_WEBHOOK_TOKEN + "/slack";
    
  NWNX_WebHook_SendWebHookHTTPS(
    "discordapp.com",
    path,
    sMessage
  );
}

//
// Public Methods
//

void QueueJoinNotification(object oPC) {
  string sPlayerName = GetPCPlayerName(oPC);
  string sPlayerCharacterName = GetName(oPC);
  
  if (ANNOUNCE_DMS && GetIsDM(oPC)) {
    _NotifyDiscordOfChanges("A DM has joined! " + sPlayerCharacterName + " (" + sPlayerName + ") has logged in.");
  } else if (!GetIsDM(oPC) && GetIsPC(oPC)) {
    int nPlayerCount = _GetPlayerCount();
    string sPlayerCountSentence = _GetPlayerCountSentence(nPlayerCount);
    _NotifyDiscordOfChanges(sPlayerCharacterName + " (" + sPlayerName + ") has joined. " + sPlayerCountSentence);
  }
}

void QueueLeaveNotification(object oPC) {
  string sPlayerName = GetPCPlayerName(oPC);
  string sPlayerCharacterName = GetName(oPC);
  
  if (ANNOUNCE_DMS && GetIsDM(oPC)) {
    _NotifyDiscordOfChanges("A DM has left! " + sPlayerCharacterName + " (" + sPlayerName + ") has logged out.");
  } else if (!GetIsDM(oPC) && GetIsPC(oPC)) {
    int nPlayerCount = _GetPlayerCount() - 1; // Subtract the person actively logging out
    string sPlayerCountSentence = _GetPlayerCountSentence(nPlayerCount);
    _NotifyDiscordOfChanges(sPlayerCharacterName + " (" + sPlayerName + ") has left. " + sPlayerCountSentence);
  }
}