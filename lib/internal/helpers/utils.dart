import 'package:flutter/material.dart';

import '../../features/characters/data/models/characters_model.dart';

String getStatus(status) {
  switch (status) {
    case '0':
    case 'Alive':
    case Status.ALIVE:
      return 'живой';
    case '1':
    case 'Dead':
    case Status.DEAD:
      return 'мертвый';
    case '2':
    case 'unknown':
    case Status.UNKNOWN:
      return 'неизвестно';

    default:
      return 'Неизвестно';
  }
}

String getSpecies(species) {
  switch (species) {
    case Species.ALIEN:
      return 'Пришелец';
    case Species.HUMAN:
      return 'Человек';
    case Species.ROBOT:
      return 'Робот';
    case Species.CRONENBERG:
      return 'Кроненберг';
    case 'Animal':
      return 'Животное';
    case Species.MYTHOLOGICAL_CREATURE:
      return 'Мифическое существо';
    default:
      return 'Неизвестно';
  }
}

String getGender(gender) {
  switch (gender) {
    case 'Male':
    case Gender.MALE:
      return 'Мужской';
    case '1':
    case 'Female':
    case Gender.FEMALE:
      return 'Женский';
    case '2':
    case 'unknown':
    case Gender.UNKNOWN:
      return 'Неизвестно';
    case Gender.GENDERLESS:
      return 'Без гендера';
    default:
      return 'Неизвестно';
  }
}

Color colorStatus(status) {
  if (status == Status.ALIVE) {
    return Colors.green;
  } else if (status == Status.DEAD) {
    return Colors.red;
  } else if (status == Status.UNKNOWN) {
    return Colors.grey;
  } else
    return Colors.black;
}
