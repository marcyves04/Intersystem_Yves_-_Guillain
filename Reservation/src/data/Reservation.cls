Class data.Reservation Extends (%Persistent, %JSON.Adaptor)
{

Property categorie As %String;

Property plaque As %String(MAXLEN = 9, MINLEN = 9);

Property dateDebut As %TimeStamp;

Property dateFin As %TimeStamp;

Storage Default
{
<Data name="ReservationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>categorie</Value>
</Value>
<Value name="3">
<Value>dateDebut</Value>
</Value>
<Value name="4">
<Value>dateFin</Value>
</Value>
<Value name="5">
<Value>plaque</Value>
</Value>
</Data>
<DataLocation>^data.ReservationD</DataLocation>
<DefaultData>ReservationDefaultData</DefaultData>
<IdLocation>^data.ReservationD</IdLocation>
<IndexLocation>^data.ReservationI</IndexLocation>
<StreamLocation>^data.ReservationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
