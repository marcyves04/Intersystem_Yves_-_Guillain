Class BO.Voiture Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoiture(pRequest As msg.creerVoitureDmde, Output pResponse As msg.creerVoitureRpse) As %Status
{
    
    set pResponse = ##class(msg.creerVoitureRpse).%New()
    set voiture = ##class(data.Voiture).%New()
    set voiture.nom = pRequest.nom
    set voiture.categorie = pRequest.categorie
    set voiture.plaque = pRequest.plaque
    set tsc = voiture.%Save()

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method reservationVoiture(pRequest As msg.creerVoitureReservationDmde, Output pResponse As msg.creerVoitureRpse) As %Status
{
    Set pRequest = ##class(msg.creerVoitureRpse).%New()
    set voiture = ##class(data.Voiture).%New()
    set voiture.categorie = pRequest.categorie
    set tsc = voiture.%Save()

    set pResponse.codeRetour = "OK"

    QUIT $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.creerVoitureDmde">
        <Method>creerVoiture</Method>
    </MapItem>
    <MapItem MessageType="msg.creerVoitureReservationDmde">
        <Method>reservationVoiture</Method>
    </MapItem>
</MapItems>
}

}
