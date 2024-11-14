import 'package:client/screens/recycling_categories/recycling_category.dart';
import 'package:flutter/material.dart';

class MixedDetails extends StatelessWidget {
  const MixedDetails({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "Odpady zmieszane – ostateczność, a nie norma";

    const description =
        "Odpady zmieszane to wszystko to, czego nie możemy już poddać recyklingowi. Są to zazwyczaj odpady mocno zabrudzone, zanieczyszczone lub takie, które nie nadają się do segregacji ze względu na swój złożony charakter.";

    List<String> allowedItems = [
      "Gdy nie mamy pewności, jak segregować dany odpad.",
      "Gdy odpad jest mocno zabrudzony i nie nadaje się do recyklingu.",
      "Gdy odpad jest połączony z innymi materiałami w sposób uniemożliwiający segregację.",
      "Gdy nie ma odpowiedniego pojemnika na dany rodzaj odpadu."
    ];

    List<String> disallowedItems = [
      "Odpadów, które można poddać recyklingowi: papier, plastik, szkło, metale, bioodpady",
      "Odpadów niebezpiecznych: baterie, akumulatory, farby, rozpuszczalniki, leki, zużyty sprzęt elektroniczny.",
      "Odpadów wielkogabarytowych: meble, dywany, duże sprzęty AGD."
    ];

    List<String> additionalInfo = [
      "Segreguj odpady: Im dokładniej segregujesz, tym mniej odpadów trafia do pojemnika na odpady zmieszane.",
      "Kupuj produkty z minimalną ilością opakowań: Wybieraj produkty pakowane w opakowania wielokrotnego użytku lub takie, które można łatwo poddać recyklingowi.",
      "Naprawiaj zamiast wyrzucać: Przed wyrzuceniem zużytego sprzętu sprawdź, czy można go naprawić."
    ];

    return RecyclingCategory(
        title: title,
        description: description,
        allowedItems: allowedItems,
        disallowedItems: disallowedItems,
        additionalInfo: additionalInfo);
  }
}
