as yet unclassified
amount: aNumber currencyCode: aString
  ^ self basicNew
    setAmount: aNumber
    currency: (Currency getFromCurrencyCode: aString asUppercase)