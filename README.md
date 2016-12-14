## Functions and attributes involved:

### Connect()
Establishes connection (reserves COM).
Also invokes **GetDeviceMetrics()** and **GetECRStatus()**

### ResetECR()
- ECRMode == 1 *Выдача данных*:
    **InterruptDataStream()**
- ECRMode == 6 *Ожидание подтверждения вводе даты*:
    **ConfirmDate()**
- ECRMode == 8 *Открытый документ*:
    **CancelCheck()**
- ECRMode == 10 *Тестовый прогон*:
    **InterruptTest()**

### ECRMode
Attribute filled by **GetECRStatus()**
```
0  - Принтер в рабочем режиме
1  - Выдача данных
2  - Открытая смена, 24 часа не кончились
3  - Открытая смена, 24 часа кончились
4  - Закрытая смена
5  - Блокировка по неправильному паролю налогового инспектора
6  - Ожидание подтверждения ввода даты
7  - Разрешение изменения положения десятичной точки
8  - Открытый документ
     ECRMode8Status
      0 - Открыт чек продажи
      1 - Открыт чек покупки
      2 - Открыт чек возврата продажи
      3 - Открыт чек возврата покупки
9  - Режим разрешения технологического обнуления
10 - Тестовый прогон
11 - Печать полного фискального отчета
12 - Печать длинного отчета ЭКЛЗ
13 - Работа с фискальным подкладным документом
14 - Печать подкладного документа
15 - Фискальный подкладной документ сформирован
```

Now the code [IronPython](http://ironpython.net) should look like:
``` python
from sys import stdin
from System import Type, Activator

oo = Type.GetTypeFromProgID('Addin.DrvFR')
v = Activator.CreateInstance(oo)
v.Password = 30000

v.Connect()
if v.ECRMode == 8:
	print "v.ECRMode8Status " + str(v.ECRMode8Status)

v.ResetECR()
if v.ECRMode not in [2,3,4]:
	print "Can't go on with ECRMode: " + str(v.ECRMode)
	exit(1)

...
```


