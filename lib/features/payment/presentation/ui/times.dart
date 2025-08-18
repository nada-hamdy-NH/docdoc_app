 List<String> generateDynamicSlots({
  required int startHour,
  required int endHour,
  required int slotsCount,
}) {
  List<String> slots = [];

  DateTime start = DateTime(2025, 1, 1, startHour, 0);
  DateTime end = DateTime(2025, 1, 1, endHour, 0);

  int remainingSlots = slotsCount;

  // مثال: لو 6 slots → أول 4 بنص ساعة والباقي ساعة
  int halfHourSlots = slotsCount - 2; 
  int hourSlots = 2;

  // أول نص ساعة
  for (int i = 0; i < halfHourSlots; i++) {
    if (start.isAfter(end)) break;
    slots.add("${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}");
    start = start.add(const Duration(minutes: 30));
  }

  // بعد كده بالساعات
  for (int i = 0; i < hourSlots; i++) {
    if (start.isAfter(end)) break;
    slots.add("${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}");
    start = start.add(const Duration(hours: 1));
  }

  return slots;
}