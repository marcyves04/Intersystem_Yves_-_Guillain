Class msg.creerVoitureReservationDmde Extends (Ens.Request, %JSON.Adaptor)
{

/// Description
Property voiture As webObjet.wsVoitureReservation;

Storage Default
{
<Data name="creerVoitureReservationDmdeDefaultData">
<Subscript>"creerVoitureReservationDmde"</Subscript>
<Value name="1">
<Value>voiture</Value>
</Value>
</Data>
<DefaultData>creerVoitureReservationDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
