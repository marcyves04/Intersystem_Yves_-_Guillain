Class webObjet.wsVoitureReservation Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property categorie As %String;

Property intervalDate As %Date;

/// Description
Storage Default
{
<Data name="wsVoitureReservationState">
<Value name="1">
<Value>categorie</Value>
</Value>
<Value name="2">
<Value>date</Value>
</Value>
<Value name="3">
<Value>intervalDate</Value>
</Value>
</Data>
<Description>
<![CDATA[Description]]></Description>
<State>wsVoitureReservationState</State>
<StreamLocation>^webObjet.wsVoitureReservationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
