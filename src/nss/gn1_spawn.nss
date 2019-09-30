void main()
{
   SetListening(OBJECT_SELF, TRUE);
   {
      SetListenPattern(OBJECT_SELF, "LG", 3001);
      SetListenPattern(OBJECT_SELF, "NG", 3002);
      SetListenPattern(OBJECT_SELF, "CG", 3003);
      SetListenPattern(OBJECT_SELF, "LN", 3004);
      SetListenPattern(OBJECT_SELF, "TN", 3005);
      SetListenPattern(OBJECT_SELF, "CN", 3006);
      SetListenPattern(OBJECT_SELF, "LE", 3007);
      SetListenPattern(OBJECT_SELF, "NE", 3008);
      SetListenPattern(OBJECT_SELF, "CE", 3009);
      SetListenPattern(OBJECT_SELF, "STUFF", 3010);
      SetListenPattern(OBJECT_SELF, "CASH", 3011);
      SetListenPattern(OBJECT_SELF, "**", 3012);
   }
}
