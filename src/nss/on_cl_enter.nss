#include "discord_status"

void main()
{
    object oPC = GetEnteringObject();
    
    SendMessageToPC(oPC, "Hi");
    QueueJoinNotification(oPC);
}