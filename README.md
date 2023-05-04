# README

_Може відрізнятися від остаточної версії програми_

# Sudoku App

Цей додаток дозволяє грати в судоку на вашому комп'ютері. Судоку - це логічна гра, в якій потрібно заповнити 9x9 сітку цифрами від 1 до 9 так, щоб кожна цифра з'являлася один раз у кожному рядку, стовпці та 3x3 підсітці.

## Встановлення

Для запуску цього додатку вам потрібно мати Ruby on Rails на вашому комп'ютері. Якщо ви не маєте Ruby on Rails, ви можете встановити його за допомогою [цього посилання](https://guides.rubyonrails.org/getting_started.html).

Після того, як ви встановили Ruby on Rails, вам потрібно склонувати цей репозиторій на ваш комп'ютер за допомогою команди:

```
git clone https://github.com/ArthurChemov/sudoku.git
```

Потім перейдіть до теки проекту і запустіть сервер за допомогою команди:

```
rails server
```

## Гра

Для початку гри перейдіть за посиланням [http://127.0.0.1:3000](http://127.0.0.1:3000) у вашому браузері. Ви побачите кнопку "Start", яка згенерує нову судоку головоломку і покаже частину судоку. Ваше завдання - заповнити інші клітинки цифрами від 1 до 9, дотримуючись правил судоку.

Коли ви заповнили всю сітку, натисніть кнопку "Submit" для перевірки вашого розв'язку. Якщо ваш розв'язок правильний, ви побачите повідомлення "You win!". Якщо ваш розв'язок неправильний, ви побачите повідомлення "You lose!" і помилкові клітинки будуть виділені червоним кольором.

Ви можете почати нову гру будь-коли, натиснувши кнопку "Start" знову.


### Розробники
* [Доценко Дмитро](https://github.com/DDS-KRZN) (КС34)
* [Чемов Артур](https://github.com/ArthurChemov) (КС34)