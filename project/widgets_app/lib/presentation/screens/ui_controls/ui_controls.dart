import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});
  static const String name = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTrasportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Controles Adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),

        ExpansionTile(
          title: Text('Vehículo de transporte'),
          subtitle: Text('$selectedTrasportation'),
          children: [
            RadioListTile(
              title: Text('By Car'),
              subtitle: Text('Travel by car'),
              value: Transportation.car,
              groupValue: selectedTrasportation,
              onChanged: (value) {
                setState(() {
                  selectedTrasportation = value ?? Transportation.car;
                });
              },
            ),
            RadioListTile(
              title: Text('By Plane'),
              subtitle: Text('Travel by plane'),
              value: Transportation.plane,
              groupValue: selectedTrasportation,
              onChanged: (value) {
                setState(() {
                  selectedTrasportation = value ?? Transportation.plane;
                });
              },
            ),
            RadioListTile(
              title: Text('By Boat'),
              subtitle: Text('Travel by boat'),
              value: Transportation.boat,
              groupValue: selectedTrasportation,
              onChanged: (value) {
                setState(() {
                  selectedTrasportation = value ?? Transportation.boat;
                });
              },
            ),
            RadioListTile(
              title: Text('By Submarine'),
              subtitle: Text('Travel by submarine'),
              value: Transportation.submarine,
              groupValue: selectedTrasportation,
              onChanged: (value) {
                setState(() {
                  selectedTrasportation = value ?? Transportation.submarine;
                });
              },
            ),
          ],
        ),
      

        CheckboxListTile(
          title: Text('Desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Comida?'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Cena?'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}
