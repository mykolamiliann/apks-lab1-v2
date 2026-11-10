# Використання агента build-engineer

## Запуск у Copilot Chat

1. Відкрийте **Copilot Chat**.
2. Оберіть рушій **Local**.
3. Оберіть агента **build-engineer**.
4. Виконайте `/init` для повного налаштування.
5. Виконайте `/check` для повторної перевірки без ручних змін.

Окремі команди доступні як `/git-init`, `/create-project`, `/create-build`, `/create-actions` і `/check`.

## Локальна перевірка

У Windows PowerShell виконайте:

```powershell
.\ci.bat
```

У Windows у PowerShell для окремих npm-команд використовуйте `npm.cmd` замість `npm`:

```powershell
npm.cmd install
npm.cmd run build
npm.cmd test
```

У Linux або macOS виконайте:

```bash
sh ./ci.sh
```

Скрипти послідовно встановлюють залежності, збирають TypeScript і запускають Vitest. Вони зупиняються на першій помилці. Після успішної перевірки `npm start` запускає зібраний Hello World.

У GitHub Actions для Linux і macOS використовується такий самий виклик `sh ./ci.sh`; це не залежить від executable-біта файла після checkout. Windows запускає `ci.bat` через `shell: cmd`.
