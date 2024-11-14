import 'package:client/screens/recycling_categories/recycling_category.dart';
import 'package:flutter/material.dart';

class GlassDetails extends StatelessWidget {
  const GlassDetails({super.key});

  @override
  Widget build(BuildContext context) {
    const description =
        "Materiał, który może służyć nam wielokrotnie. Dzięki recyklingowi, butelki i słoiki mogą zyskać drugie życie. Aby proces ten był efektywny, należy przestrzegać kilku prostych zasad.";

    List<String> allowedItems = [
      "Butelki szklane po napojach: zarówno bezbarwne, jak i kolorowe",
      "Słoiki szklane: po dżemach, przetworach, oliwie itp.",
      "Opakowania szklane po kosmetykach"
    ];

    List<String> disallowedItems = [
      "Szkło żaroodporne: np. naczynia do zapiekania",
      "Ceramika, porcelana: talerze, filiżanki, doniczki",
      "Znicze"
          "Szkło hartowane: np. szyby samochodowe"
    ];

    List<String> additionalInfo = [
      "Nie myj szkła przed wyrzuceniem: Wystarczy, że opróżnisz opakowania.",
      "Usuń nakrętki i korki: Zwykle są wykonane z innych materiałów i powinny trafić do żółtego pojemnika na plastik.",
      "Nie wrzucaj do pojemnika potłuczonego szkła w workach: Może to utrudnić pracę w sortowni."
    ];

    return RecyclingCategory(
      title: "Jak prawidłowo segregować szkło?",
      description: description,
      allowedItems: allowedItems,
      disallowedItems: disallowedItems,
      additionalInfo: additionalInfo,
    );
  }
}
