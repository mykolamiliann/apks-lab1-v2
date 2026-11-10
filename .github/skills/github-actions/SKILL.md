---
name: github-actions
description: Створює GitHub Actions CI для перевірки TypeScript-проєкту на Linux, Windows і macOS через платформні ci.sh або ci.bat та завантаження build-артефактів.
---

# Skill github-actions

## Коли застосовувати

Застосовувати, коли TypeScript-проєкт уже має `ci.sh` і `ci.bat` та потрібно автоматично запускати перевірки на push і pull request у GitHub Actions.

## Вхід

- коренева папка репозиторію;
- `ci.sh` для Linux і macOS;
- `ci.bat` для Windows;
- проєкт, який після build створює папку `build`.

## Що створює

- `.github/workflows/ci.yml` з:
  - запуском на `push` і `pull_request`;
  - matrix `os`: `ubuntu-latest`, `windows-latest`, `macos-latest`;
  - `fail-fast: false`;
  - кроками checkout і setup-node;
  - запуском тільки `./ci.sh` на Linux та macOS;
  - запуском `ci.bat` із `shell: cmd` на Windows;
  - кроком `upload-artifact` для папки `build`.

Для Linux і macOS workflow не дублює команди build/test, а викликає лише `ci.sh`. Для Windows викликається лише `ci.bat`.

## Як перевірити

1. Перевірити синтаксис і структуру `.github/workflows/ci.yml`.
2. Переконатися, що три платформи присутні в matrix, а `fail-fast` дорівнює `false`.
3. Переконатися, що `checkout` і `setup-node` виконуються перед платформним скриптом.
4. Переконатися, що Linux/macOS запускають лише `ci.sh`, а Windows — `ci.bat` із `shell: cmd`.
5. Перевірити, що `upload-artifact` завантажує `build` після успішного складання.
6. Перевірити workflow у GitHub Actions на push і pull request.

## Що робити при помилці

Зупинити діагностику на першій помилці конфігурації або workflow, визначити платформу й крок, що завершився невдало, та виправити відповідну умову. Повторно перевірити YAML і запуск на проблемній платформі. Не обходити помилку вимкненням перевірок, не дублювати команди замість платформного CI-скрипта і не використовувати секрети без потреби.

## Приклад

Запит: `Створи GitHub Actions CI для всіх трьох ОС.`

Очікуваний результат: workflow запускається на push і pull request з matrix із Linux, Windows і macOS, використовує `ci.sh` або `ci.bat` відповідно до ОС та завантажує папку `build` як артефакт.
