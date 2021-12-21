Class BO.Voiture Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoiture(pRequest As msg.creerVoitureDmde, Output pResponse As msg.creerVoitureRpse) As %Status
{
    
    set pResponse = ##class(msg.creerVoitureRpse).%New()
    set voiture = ##class(data.Voiture).%New()
    do ##class(Transform.TransformVoitureCommandeToVoiture).Transform(pRequest.voiture,.voiture)
    set tsc = voiture.%Save()

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method reservationVoiture(pRequest As msg.creerVoitureReservationDmde, Output pResponse As msg.creerVoitureRpse) As %Status
{
    //Set pRequest = ##class(msg.creerVoitureRpse).%New()
    //set voiture = ##class(data.Voiture).%New()
    //set voiture.categorie = pRequest.categorie
    //set tsc = voiture.%Save()

    //set pResponse.codeRetour = "OK"

    //QUIT $$$OK
    set pResponse = ##class(msg.creerVoitureReservationRpse).%New()
    set sql = "select plaque from data.Voiture where categorie = '"_pRequest.categorie_"'and plaque not in ("
    set sql = sql_"SELECT plaque FROM data.Reservation where categorie = '"_pRequest.categorie_"'"
    set sql = sql_" and ((dateDebut >= '"_pRequest.dateDebut_"' and dateDebut <= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateFin >= '"_pRequest.dateDebut_"' and dateFin <= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateDebut <= '"_pRequest.dateDebut_"' and dateFin >= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateDebut >= '"_pRequest.dateDebut_"' and dateFin <= '"_pRequest.dateFin_"' ))) "
    set statement = ##class(%SQL.Statement).%New()
    do statement.%Prepare(sql)
    set SQLrequest = statement.%Execute()
    do SQLrequest.%Next()
    set plaque = SQLrequest.%Get("plaque")
    if (plaque){
    set idVoiture = ##class(data.Voiture).consulterParPlaqueExists(plaque)
    set dataVoiture = ##class(data.Voiture).%OpenId(idVoiture)
    set reservation = ##class(data.Reservation).%New()
    set reservation.categorie = dataVoiture.categorie
    set reservation.plaque = dataVoiture.plaque
    set reservation.dateDebut = pRequest.dateDebut
    set reservation.dateFin = pRequest.dateFin
    set tsc = reservation.%Save()
    if (tsc){
        set pResponse.codeRetour = "OK"
    }
    else {
        set pResponse.codeRetour = "KO"
    }
    }
    else {
        set pResponse.codeRetour = "KO"
    }
    
    
    Quit $$$OK
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
