accessing
setConvertableCurrencyNames
|x y |

x:= Currency currencies .

y:=Currency convertableCurrencies keys.


Currency convertableCurrencyNames: ((Currency currencies select: [:each | y includes: each currency ]) collect: [:each | each currencyName]) asSet asSortedCollection.