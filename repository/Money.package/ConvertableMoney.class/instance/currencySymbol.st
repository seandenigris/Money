accessing
currencySymbol
  currency isString
    ifTrue: [ currency := Currency getFromCurrencyCode: currency ].
  ^ self currency symbol