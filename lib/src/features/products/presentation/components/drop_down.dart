part of '../../products.dart';

class DropDownWidget extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final void Function(dynamic) onChange;
  final String? value;
  final String hint;
  const DropDownWidget(
      {super.key,
      required this.items,
      required this.onChange,
      this.value,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButton(
              isExpanded: true,
              value: value,
              padding: EdgeInsets.zero,
              underline: const Center(),
              hint: const Text(
                'Category',
              ),
              items: items,
              onChanged: onChange),
        ),
      ),
    );
  }
}
