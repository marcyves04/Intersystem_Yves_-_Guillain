Class msg.creerVoitureReservationDmde Extends (Ens.Request, %JSON.Adaptor)
{

/// Description
Property categorie As %String;

Property plaque As %String(MAXLEN = 9, MINLEN = 9);

Property dateDebut As %TimeStamp;

Property dateFin As %TimeStamp;

Storage Default
{
<Data name="creerVoitureReservationDmdeDefaultData">
<Subscript>"creerVoitureReservationDmde"</Subscript>
<Value name="1">
<Value>categorie</Value>
</Value>
<Value name="2">
<Value>plaque</Value>
</Value>
<Value name="3">
<Value>dateDebut</Value>
</Value>
<Value name="4">
<Value>dateFin</Value>
</Value>
</Data>
<DefaultData>creerVoitureReservationDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
