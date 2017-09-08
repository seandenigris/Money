class initialization
initializeCurrencies
	currencies := OrderedCollection new.
	currencies addAll: self widelyUsedCurrencies.
	currencies addAll: self currenciesAtoF.
	currencies addAll: self currenciesGtoM.
	currencies addAll: self currenciesNtoS.
	currencies addAll: self currenciesTtoZ