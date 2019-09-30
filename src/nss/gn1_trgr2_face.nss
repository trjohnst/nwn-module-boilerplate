void main()
{
   object GN1 = GetExitingObject();

   if (GetTag(GN1) == "Gangster_No1")
   {
      SetLocalInt(GN1, "InTrigger", 0);
   }
}
