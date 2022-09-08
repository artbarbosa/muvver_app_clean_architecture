import 'package:flutter/material.dart';
import 'package:muvver_app/app/_design_system/widgets/text_form_field/custom_text_form_field_widget.dart';

class MidPointPage extends StatefulWidget {
  const MidPointPage({super.key});

  @override
  _MidPointPageState createState() => _MidPointPageState();
}

class _MidPointPageState extends State<MidPointPage> {
  final TextEditingController _dataControllerMidPoint =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 96),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text('Ponto intermediário',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'TitilliumWeb',
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.bold)),
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'TitilliumWeb',
                            letterSpacing: 0.75,
                            color: Color(0xff22222252)),
                        children: <TextSpan>[
                          TextSpan(text: 'Insira os pontos intermediários na '),
                          TextSpan(
                              text: 'sequência exata',
                              style: TextStyle(
                                  color: Color(0xff222222),
                                  fontWeight: FontWeight.bold)),
                          TextSpan(text: ' em que você passará por eles'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 15),
                      child: CustomTextFormFieldWidget(
                        labelText: 'Nome da cidade',
                        textEditingController: _dataControllerMidPoint,
                        textInputAction: TextInputAction.next,
                        hintText: 'asda',
                        readOnly: false,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 70, bottom: 16),
                      child: Text(
                          'Usuários que viajam de campo Grande - MS para Dourados - MS também passam por:',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'TitilliumWeb',
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      children: [
                        _listCity('Rio Brilhante - MS'),
                        _listCity('Maracaju - MS'),
                        _listCity('Itaporã - MS'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.only(left: 16, top: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Color(0xff353740), Color(0xff222222)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.close, color: Colors.white)),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                child: Material(
                  color: const Color(0xFF16A45C),
                  elevation: 5,
                  shadowColor: const Color(0xff222222),
                  child: InkWell(
                    onTap: () {
                      if (_dataControllerMidPoint.text == '') {
                        //  streamController.add('Nova Alvorada');
                      } else {
                        //streamController.add(_dataControllerMidPoint.text);
                      }

                      Navigator.of(context).pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        //border: Border.all(color: Colors.white70)
                      ),
                      child: const Text('Confirmar',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'TitilliumWeb',
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  _listCity(city) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset('assets/icon/pointer-spot-tool-for-maps.png', scale: 2),
          const SizedBox(width: 16),
          Text(
            city,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'TitilliumWeb',
              color: Color(0xFF222222),
            ),
          ),
        ],
      ),
    );
  }
}
