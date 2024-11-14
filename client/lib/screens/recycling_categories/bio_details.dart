import 'package:client/screens/recycling_categories/recycling_category.dart';
import 'package:flutter/material.dart';

class BioDetails extends StatelessWidget {
  const BioDetails({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "Jak prawidłowo segregować bioodpady?";

    const description =
        "Bioodpady to naturalny sposób na wzbogacenie gleby. Dzięki kompostowaniu możemy zamienić resztki jedzenia i roślinne odpady w wartościowy nawóz.";

    List<String> allowedItems = [
      "Resztki jedzenia: obierki z warzyw i owoców, fusy kawy i herbaty (bez torebek), skorupki jajek, resztki pieczywa",
      "Odpady roślinne: trawa, liście, kwiaty, gałęzie drzew i krzewów, trociny, kora drzew",
      "Inne: niezaimpregnowane drewno"
    ];

    List<String> disallowedItems = [
      "Mięso, kości, tłuszcz: przyciągają szkodniki i wydzielają nieprzyjemny zapach",
      "Zanieczyszczone pieluchy, chusteczki higieniczne",
      "Ziemia z doniczek (jeśli była nawożona)",
      "Olej spożywczy"
    ];

    List<String> additionalInfo = [
      "Bioodpady należy wyrzucać luzem lub w papierowych torebkach. Nie używaj plastikowych worków, ponieważ nie ulegają one biodegradacji.",
      "Regularnie opróżniaj pojemnik na bioodpady: Unikniesz nieprzyjemnych zapachów i rozwoju szkodników.",
      "Zmniejsz ilość wytwarzanych bioodpadów: Planuj zakupy, gotuj tyle, ile potrzebujesz i wykorzystuj resztki jedzenia."
    ];

    return RecyclingCategory(
        title: title,
        description: description,
        allowedItems: allowedItems,
        disallowedItems: disallowedItems,
        additionalInfo: additionalInfo);
  }
}
