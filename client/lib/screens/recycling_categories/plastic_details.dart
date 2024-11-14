import 'package:client/screens/recycling_categories/recycling_category.dart';
import 'package:flutter/material.dart';

class PlasticDetails extends StatelessWidget {
  const PlasticDetails({super.key});

  @override
  Widget build(BuildContext context) {
    const description =
        "Choć jest bardzo praktyczny, jego nadmierna produkcja i niewłaściwa utylizacja stanowią poważne zagrożenie dla środowiska. Dlatego tak ważne jest, abyśmy wiedzieli, jak prawidłowo segregować plastikowe odpady.";

    List<String> allowedItems = [
      "Butelki plastikowe po napojach: PET, HDPE",
      "Opakowania po jogurtach, śmietanie, maśle",
      "Opakowania po kosmetykach",
      "Puszki aluminiowe",
      "Folie aluminiowe",
      "Torebki foliowe"
    ];
    List<String> disallowedItems = [
      "Styropian",
      "Opakowania po żywności zabrudzone resztkami jedzenia",
      "Odpady budowlane i rozbiórkowe",
      "Zużyty sprzęt elektroniczny"
    ];
    List<String> additionalInfo = [
      "Opakowania nie muszą być czyste: Wystarczy, że opróżnimy je z resztek jedzenia.",
      "Spłaszczaj butelki i opakowania: Dzięki temu zajmą mniej miejsca w pojemniku.",
      "Usuń elementy metalowe: Nakrętki można odkręcić i wrzucić razem z butelką lub oddzielnie do specjalnych pojemników.",
      "Nie wrzucaj do pojemnika zużytych pieluch, pampersów ani innych produktów higienicznych."
    ];

    return RecyclingCategory(
        title: "Jak segregować plastik?",
        description: description,
        allowedItems: allowedItems,
        disallowedItems: disallowedItems,
        additionalInfo: additionalInfo);
  }
}
