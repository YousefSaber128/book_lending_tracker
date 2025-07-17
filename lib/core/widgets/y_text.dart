import 'package:flutter/widgets.dart'
    show
        InlineSpan,
        StatelessWidget,
        Text,
        TextAlign,
        TextDirection,
        TextOverflow,
        TextStyle,
        immutable;

@immutable
final class YText extends StatelessWidget {
  const YText(
    this.data, {
    this.style,
    this.textAlign,
    this.textDirection,
    this.softWrap = false,
    super.key,
  });
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  @override
  Text build(_) => Text(
    data,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    softWrap: softWrap,
    overflow: TextOverflow.fade,
  );
}

@immutable
final class YRichText extends StatelessWidget {
  const YRichText(
    this.textSpan, {
    this.style,
    this.textAlign,
    this.softWrap = false,
    super.key,
  });
  final InlineSpan textSpan;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool? softWrap;

  @override
  Text build(_) => Text.rich(
    textSpan,
    style: style,
    textAlign: textAlign,
    softWrap: softWrap,
    overflow: TextOverflow.fade,
  );
}
