/// 
Class BP.CreationVoiture Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.commandeVoitureDmde' response='msg.commandeVoitureRpse' height='2000' width='2000' >
<context>
<property name='nbPlaces' type='%Integer' instantiate='0' />
<property name='Plaque' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='Catégorie' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='wsCatalogue' type='webObjet.wsCatalogue' instantiate='0' />
<property name='wsVoiture' type='webObjet.wsVoiture' instantiate='0' />
</context>
<sequence xend='200' yend='1000' >
<call name='CallCatalogue' target='Catalogue' async='0' xpos='200' ypos='250' >
<request type='msg.consulterVoitureCatalogueDmde' >
<assign property="callrequest.marque" value="request.marque" action="set" />
<assign property="callrequest.modele" value="request.modele" action="set" />
</request>
<response type='msg.consulterVoitureCatalogueRpse' >
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="context.wsCatalogue" value="callresponse.voiture" action="set" />
</response>
</call>
<if condition='response.codeRetour="OK"' xpos='200' ypos='350' xend='200' yend='900' >
<true>
<call name='GenererPlaque' target='BOPlaque' async='0' xpos='335' ypos='500' >
<request type='msg.generationPlaqueDmde' />
<response type='msg.generationPlaqueRpse' >
<assign property="context.Plaque" value="callresponse.plaque" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
</response>
</call>
<transform name='CatalogueToVoiture' class='Transform.CatalogueToVoiture' source='context.wsCatalogue' target='context.wsVoiture' xpos='335' ypos='600' />
<call name='Voiture' target='Voiture' async='0' xpos='335' ypos='700' >
<request type='msg.creerVoitureDmde' >
<assign property="callrequest.voiture" value="context.wsVoiture" action="set" />
<assign property="callrequest.voiture.plaque" value="context.Plaque" action="set" />
<assign property="callrequest.voiture.couleur" value="request.couleur" action="set" />
</request>
<response type='msg.creerVoitureRpse' />
</call>
<call name='File' target='BOFile' async='1' xpos='335' ypos='800' >
<request type='msg.pushVoitureFileDmde' >
<assign property="callrequest.voiture" value="context.wsVoiture" action="set" />
<assign property="callrequest.voiture.plaque" value="context.Plaque" action="set" />
<assign property="callrequest.voiture.couleur" value="request.couleur" action="set" />
</request>
<response type='msg.pushVoitureFileRpse' />
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
