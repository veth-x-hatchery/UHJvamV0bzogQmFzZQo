import 'package:flutter/material.dart';
import 'package:hatchery/features/signin/domain/entities/value_objects.dart';
import 'package:hatchery/l10n/l10n.dart';
import 'package:hatchery/ui/widgets/shared/forms/field_styles.dart';

class FieldSecret extends StatefulWidget {
  const FieldSecret({
    Key? key,
    this.focusNode,
    this.controller,
    this.onEditingComplete,
    this.onChanged,
    this.validator,
    this.hint,
  }) : super(key: key);

  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  _FieldSecretState createState() => _FieldSecretState();
}

class _FieldSecretState extends State<FieldSecret> {
  bool _hideSecret = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      autofocus: true,
      keyboardType: TextInputType.text,
      obscureText: _hideSecret,
      decoration: vethxInputDecoration(
        context,
        hintText: context.l10n.signin_input_secretHint,
        suffixIcon: IconButton(
          icon: Icon(
            _hideSecret ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => setState(() => _hideSecret = !_hideSecret),
        ),
      ),
      style: Theme.of(context).textTheme.bodyText1,
      validator: (value) => Secret(value).validation(context.l10n),
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
    );
  }
}
