import 'package:flutter/material.dart';
import 'package:moodiary/core/utils/colors.dart';
import 'package:moodiary/core/utils/shadows.dart';

class Feeling {
  Feeling({
    required this.image,
    required this.name,
    required this.tags,
  });

  final String image;
  final String name;
  final List<String> tags;
}

class FeelingWidget extends StatefulWidget {
  const FeelingWidget({
    super.key,
    required this.feelings,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.updateData,
  });

  final List<Feeling> feelings;
  final double horizontalPadding;
  final double verticalPadding;
  final void Function(List<String> newValue) updateData;

  @override
  State<FeelingWidget> createState() => _FeelingWidgetState();
}

class _FeelingWidgetState extends State<FeelingWidget> {
  Feeling? _choosenFeeling;
  List<int> _choosenTags = [];

  @override
  Widget build(BuildContext context) {
    final feelings = widget.feelings;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.verticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: widget.horizontalPadding,
            ),
            child: const Text(
              'Что чувствуешь?',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 118,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: feelings.length,
              itemBuilder: (context, index) => FeelingCardWidget(
                feelings: feelings,
                index: index,
                width: 83,
                isChoosen: feelings[index] == _choosenFeeling ? true : false,
                onTap: () => onCardTap(feelings, index),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _choosenFeeling != null
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.horizontalPadding,
                  ),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        List.generate(_choosenFeeling!.tags.length, (index) {
                      return FeelingTagWidget(
                        title: _choosenFeeling!.tags[index],
                        isChoosen: _choosenTags.contains(index) ? true : false,
                        onTap: () => onTagTap(index),
                      );
                    }),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  void onCardTap(List<Feeling> feelings, int index) {
    if (_choosenFeeling != feelings[index]) {
      setState(() {
        _choosenFeeling = feelings[index];
        _choosenTags = [];
      });

      widget.updateData([]);
    }
  }

  void onTagTap(int index) {
    setState(() {
      if (_choosenTags.contains(index)) {
        _choosenTags.remove(index);
      } else {
        _choosenTags.add(index);
      }
    });

    final feelingTags = List.generate(_choosenTags.length, (index) {
      final currentIndex = _choosenTags[index];
      return _choosenFeeling!.tags[currentIndex];
    });

    widget.updateData(feelingTags);
  }
}

class FeelingCardWidget extends StatelessWidget {
  const FeelingCardWidget({
    super.key,
    required this.feelings,
    required this.index,
    required this.width,
    required this.isChoosen,
    required this.onTap,
  });

  final List<Feeling> feelings;
  final int index;
  final double width;
  final bool isChoosen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: index == 0 ? 20 : 6,
        right: index == feelings.length - 1 ? 20 : 6,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(76),
            ),
            border: isChoosen
                ? Border.all(
                    color: AppColors.tangerine,
                    width: 2,
                  )
                : null,
            boxShadow: AppShadows.mainShadow,
          ),
          child: SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  feelings[index].image,
                  height: 53,
                ),
                Text(
                  feelings[index].name,
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeelingTagWidget extends StatelessWidget {
  const FeelingTagWidget({
    super.key,
    required this.title,
    required this.isChoosen,
    required this.onTap,
  });

  final String title;
  final bool isChoosen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isChoosen ? AppColors.tangerine : AppColors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(3),
          ),
          boxShadow: AppShadows.mainShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 3,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 11,
              color: isChoosen ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
