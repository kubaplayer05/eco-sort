import 'package:client/screens/recycling_categories/recycling_category.dart';
import 'package:flutter/material.dart';

class PaperDetails extends StatelessWidget {
  const PaperDetails({super.key});

  @override
  Widget build(BuildContext context) {
    const description =
        "Papier to jeden z najpowszechniejszych materiałów, które trafiają do naszych koszy. Na szczęście, papier można łatwo poddać recyklingowi i stworzyć z niego nowe produkty.";

    List<String> allowedItems = [
      "Gazety i czasopisma",
      "Kartony (np. po mleku, płatkach śniadaniowych)",
      "Książki, zeszyty, notatki",
      "Torebki papierowe",
      "Papier pakowy",
    ];

    List<String> disallowedItems = [
      "Papier powlekany folią (np. tetrapaki)"
          "Zabrudzony papier (np. tłusty, pomazany)",
      "Papier higieniczny, chusteczki",
      "Pieluchy",
    ];

    List<String> additionalInfo = [
      "Spłaszczaj kartony: Dzięki temu zajmą mniej miejsca w pojemniku."
          "Usuń elementy metalowe: Spinacze, zszywki mogą uszkodzić maszyny w recyklingu.",
      "Nie wrzucaj do pojemnika mokrego papieru: Może to spowodować rozwój pleśni i utrudnić recykling."
    ];

    return RecyclingCategory(
      title: "Jak segregować papier?",
      description: description,
      allowedItems: allowedItems,
      disallowedItems: disallowedItems,
      additionalInfo: additionalInfo,
    );
  }
}
