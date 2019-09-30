void main()
{
   object oEnter = GetEnteringObject();
   object oKill = oEnter;

   if (GetTag(oEnter) == "GangsterNo1")
      return;

   while (GetIsObjectValid(GetMaster(oEnter)))
   {
      oEnter = GetMaster(oEnter);
   }
   if (!GetIsPC(oEnter))
   {
      ApplyEffectToObject(DURATION_TYPE_INSTANT,
                          EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE),
                          oKill);
      AssignCommand(oKill, ClearAllActions(TRUE));
      PlayVoiceChat(VOICE_CHAT_DEATH, oKill);
      DestroyObject(oEnter, 0.2);
   }
}
