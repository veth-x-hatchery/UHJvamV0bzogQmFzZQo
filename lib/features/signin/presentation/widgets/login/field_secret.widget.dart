import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/field_styles.dart';

class FieldPassword extends StatefulWidget {
  const FieldPassword({
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
  _FieldPasswordState createState() => _FieldPasswordState();
}

class _FieldPasswordState extends State<FieldPassword> {
  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      autofocus: true,
      keyboardType: TextInputType.text,
      obscureText: _hidePassword,
      decoration: vethxInputDecoration(
        context,
        hintText: Texts.passwordHint,
        suffixIcon: IconButton(
          icon: Icon(
            _hidePassword ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => setState(() => _hidePassword = !_hidePassword),
        ),
      ),
      style: Theme.of(context).textTheme.bodyText1,
      validator: (value) => Password(value).validation,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
    );
  }
}
