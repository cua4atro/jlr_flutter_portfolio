import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';
import 'package:jlr_flutter_portfolio/src/models/experience.dart';
import 'package:jlr_flutter_portfolio/src/theme/text_styles.dart';

class SkillsAndEduView extends StatelessWidget {
  const SkillsAndEduView({super.key});

  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                txt.experience,
                style: TextStyles.subHeading,
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                style: TextStyles.body,
              ),
              const SizedBox(height: 18.0),
              const ExperienceTimeLine(),
            ],
          ),
        ),
        const SizedBox(width: 40.0),
        const Expanded(
          flex: 1,
          child: Skills(),
        ),
      ],
    );
  }
}

class ExperienceTimeLine extends StatelessWidget {
  const ExperienceTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    final experienceList = [
      Experience(
        'Oct 2019',
        'Actualidad',
        'Freelancer',
        'Sr Flutter Developer',
      ),
      Experience(
        'Jan 2022',
        'Mar 2023',
        '42 Awesome Software',
        'Sr Flutter Developer / Co-founder',
      ),
      Experience(
        'Jun 2021',
        'Feb 2022',
        'Landhi S.A.',
        'Sr Flutter Developer',
      ),
    ];
    final List<Widget> widgets = experienceList
        .map((experience) => EducationTile(
              experience: experience,
            ))
        .toList();
    return Column(children: widgets);
  }
}

class EducationTile extends StatelessWidget {
  const EducationTile({super.key, required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            experience.post,
            style: TextStyles.company,
          ),
          Text(
            experience.organization,
            style: TextStyles.body,
          ),
          Text(
            '${experience.from}-${experience.to}',
            style: TextStyles.body,
          ),
        ],
      ),
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context);

    final skills = [
      'Dart',
      'Flutter',
      'Rust',
      'Java',
      'Kotlin',
      'Android',
      'TypeScript',
      'iOS',
      'BLoC',
      'Reactive Programming',
      'Firebase',
      'Scrum',
      'POO',
    ];

    final List<Widget> widgets = skills
        .map(
          (skill) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SkillsChips(label: skill),
          ),
        )
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          txt.skillsIhave,
          style: TextStyles.subHeading,
        ),
        const SizedBox(
          height: 18,
        ),
        Wrap(children: widgets),
      ],
    );
  }
}

class SkillsChips extends StatelessWidget {
  const SkillsChips({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Chip(
        label: Text(
          label,
          style: TextStyles.chip,
        ),
      ),
    );
  }
}
