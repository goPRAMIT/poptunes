import 'package:poptunes/Models/Category.dart';

class CategoryOperations {
  CategoryOperations._() {}
  static List<Category> getCategories() {
    return <Category>[
      Category('Trending',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNVyvDLPlSH3ojUMDUh8XGmUE0N5muJJCwPNbdlpMmYPUfP2I8X2V8g-SEddSvlhP4hUQ&usqp=CAU'),
      Category('Metallica',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhdfMafOUx-ErYkinIoSEZaIWi-Z7dnMzi99UGgAjkl1kChwkv-N2Dc1H_9wcJ5iFrvsw&usqp=CAU'),
      Category('Indie India',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUWVPDWrMPEjvsZhW4GyhwvEiaNotPuPAsN8xKo8wEro_55IT24rLzWS2scC6W3BKntpk&usqp=CAU'),
      Category('Lofi',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoS0ELZMlHyecdqWOkCQGDO1x5na0gqWDO0ZbyeN06kvRYMVTMkovb0PkChPA8SKa68Ds&usqp=CAU'),
      Category('Bolly Dose',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQafBnzBTbsnRzPkrnuFD2cbJ_T-BxCBY0Ohm38FKnCtllGUhBmvCs8q9Or88HCj2_SnYA&usqp=CAU'),
      Category('Acoustic',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpeZPxvh1U2OKsPar10ykCNOwgput_vRSp-6j8C4CSqWnMK5xFdqiRDBdQvhdmyuTFNOE&usqp=CAU')
    ];
  }
}
