import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:flutter/material.dart';

class ActorsHorizontalListView extends StatefulWidget {
  final List<Actor> actors;
  final String? title;

  const ActorsHorizontalListView({
    super.key,
    required this.actors,
    this.title,
  });

  @override
  State<ActorsHorizontalListView> createState() => _ActorsHorizontalListviewState();
}

class _ActorsHorizontalListviewState extends State<ActorsHorizontalListView> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null )
            _Title(title: widget.title),

          Expanded(
            child: ListView.builder(
              itemCount: widget.actors.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FadeInRight(child: _Slide(actor: widget.actors[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Actor actor;

  const _Slide({required this.actor});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                actor.profilePath,
                width: 150,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }
                  return child;
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
          //* Nombre
          SizedBox(
            width: 150,
            child: Text(
              actor.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textStyles.titleSmall,
            ),
          ),
          const SizedBox(height: 5),
          //* Titulo
          SizedBox(
            width: 150,
            child: Text(
              'Interpretando a: ${actor.character}',
              overflow: TextOverflow.ellipsis,
              style: textStyles.bodySmall?.copyWith(
                fontWeight: FontWeight.w300,)
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  const _Title({required this.title});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
        ],
      ),
    );
  }
}