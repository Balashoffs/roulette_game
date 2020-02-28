# roulette_game

A new roulette game

## Getting Started

Создать приложение-рулетку.

Игровой экран: https://prnt.sc/r8ikrf (фон, картинку колеса, кнопку и ссылку на privacy policy предоставим). 
Алгоритм такой: при нажатии Spin колесо крутится 5-15 секунд (рандом), в зависимости от выпавшей секции начисляется Score. Во время движения колеса кнопка Spin меняется на Wait и становится неактивной.
При клике на Privacy Policy открывается Webview со ссылкой (ссылка на наш privacy policy).

Общие требования к приложениям такие:

- Интеграция с Facebook SDK - (https://pub.dev/packages/facebook_deeplinks, https://pub.dev/packages/facebook_sdk)
    
- Интеграция Firebase для отправки пуш уведомлений 
- Интеграция Onesignal для отправки пуш уведомлений (https://pub.dev/packages/onesignal_flutter)
    https://documentation.onesignal.com/docs/flutter-sdk-setup
- Подключение App Metrika (https://pub.dev/packages/appmetrica_sdk#-installing-tab-)
    https://appmetrica.yandex.com/docs/quick-start/concepts/quick-start.html