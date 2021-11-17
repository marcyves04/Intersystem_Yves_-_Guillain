Import msg

Class BO.File Extends Ens.BusinessOperation
{

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method pushVoitureFile(pRequest As pushVoitureFileDmde, Output pResponse As pushVoitureFileRpse) As %Status
{
   
    set pResponse = ##class(pushVoitureFileRpse).%New()
    set stream = ##class(%Library.FileBinaryStream).%New()
    do stream.Write(pRequest.voiture.marque_";"_pRequest.voiture.modele_";"_pRequest.voiture.categorie_";"_pRequest.voiture.plaque_";"_pRequest.voiture.couleur_";"_pRequest.voiture.nbPlaces)
    set tsc = ..Adapter.PutStream("fichierVoiture"_$TR($TR($ZDT($ZDTH($ZTS,-3),3,9),":/-","")," ","_")_".csv",file)
    if tsc {
        set pResponse.codeRetour = "OK"
    } else {
        set pResponse.codeRetour = "KO"
    }
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.pushVoitureFileDmde">
        <Method>pushVoitureFile</Method>
    </MapItem>
</MapItems>
}

}
