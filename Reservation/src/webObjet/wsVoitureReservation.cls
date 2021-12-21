Class webObjet.wsVoitureReservation Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property categorie As %String;

Property dateDebut As %TimeStamp;

Property dateFin As %TimeStamp;

Storage Default
{
<Data name="wsVoitureReservationState">
<Value name="1">
<Value>categorie</Value>
</Value>
<Value name="2">
<Value>dateDebut</Value>
</Value>
<Value name="3">
<Value>dateFin</Value>
</Value>
</Data>
<State>wsVoitureReservationState</State>
<StreamLocation>^webObjet.wsVoitureReservationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
