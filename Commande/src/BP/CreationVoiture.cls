/// 
Class BP.CreationVoiture Extends Ens.BusinessProcessBPL
{

/// This BPLError block indicates that a BPL Diagram 
/// containing errors was saved.
/// To correct this class:
/// * Open it using the Studio BPL Editor,
/// * Correct the errors, and,
/// * Save the diagram.
/// Do not edit the contents of the BPLError block
/// or you may lose your diagram.
XData BPLError
{
<diagram Name="BP.CreationVoiture" Width="2000" Height="2000" Layout="automatic" Language="objectscript" Request="msg.commandeVoitureDmde" Response="msg.commandeVoitureRpse" LastModified="" Version="" Includes="" ShowAnnotation="0">
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
</context>
<shape _index="0" _Type="start" Name="" xPos="200" yPos="150" />
<shape _index="1" _Type="end" Name="" xPos="495" yPos="175" />
<shape _index="2" _Type="call" Name="CallCatalogue" xPos="200" yPos="250" Async="0" Target="Catalogue" Timeout="" >
<request type='msg.consulterVoitureCatalogueDmde' >
<assign property="callrequest.marque" value="request.marque" action="set" />
<assign property="callrequest.modele" value="request.modele" action="set" />
</request>
<response type='msg.consulterVoitureCatalogueRpse' >
<assign property="request.marque" value="callresponse.voiture.marque" action="set" />
<assign property="request.modele" value="callresponse.voiture.modele" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.nbPlaces" value="callresponse.voiture.nbPlaces" action="set" />
<assign property="context.Catégorie" value="callresponse.voiture.type" action="set" />
</response>
</shape>
<shape _index="3" _Type="if" Name="NbPlaces == 2" xPos="636" yPos="756" Condition="context.nbPlaces = 2" />
<shape _index="4" _Type="join" Name="" xPos="636" yPos="926" />
<shape _index="5" _Type="call" Name="GenererPlaque" xPos="635" yPos="617" Async="0" Target="BOPlaque" Timeout="" >
<request type='msg.generationPlaqueDmde' />
<response type='msg.generationPlaqueRpse' >
<assign property="context.Plaque" value="callresponse.plaque" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
</response>
</shape>
<shape _index="6" _Type="if" Name="" xPos="200" yPos="350" Condition="response.codeRetour=&quot;OK&quot;" />
<shape _index="7" _Type="join" Name="" xPos="430" yPos="495" />
<shape _index="8" _Type="assign" Name="" xPos="637" yPos="1161" Action="set" Key="" Property="context.Catégorie" Value="&quot;2 places&quot;" />
<shape _index="9" _Type="if" Name="nbPlaces == 7" xPos="970" yPos="926" Condition="context.nbPlaces=7" />
<shape _index="10" _Type="join" Name="" xPos="969" yPos="1066" />
<shape _index="11" _Type="assign" Name="" xPos="970" yPos="1157" Action="set" Key="" Property="context.Catégorie" Value="&quot;7 places&quot;" />
<shape _index="12" _Type="assign" Name="" xPos="1315" yPos="1157" Action="set" Key="" Property="context.Catégorie" Value="&quot;Type&quot;" />
<connection _Type="connector" Name="" from="0" to="2"/>
<connection _Type="connector" Name="" from="2" to="6"/>
<connection _Type="connector" Name="true" from="3" to="4" ConnectType="branch"/>
<connection _Type="connector" Name="false" from="3" to="9" ConnectType="branch"/>
<connection _Type="connector" Name="" from="4" to="8"/>
<connection _Type="connector" Name="" from="5" to="3"/>
<connection _Type="connector" Name="true" from="6" to="7" ConnectType="branch"/>
<connection _Type="connector" Name="" from="7" to="5"/>
<connection _Type="connector" Name="true" from="9" to="10" ConnectType="branch"/>
<connection _Type="connector" Name="false" from="9" to="12" ConnectType="branch"/>
<connection _Type="connector" Name="" from="10" to="11"/>
</diagram>
}

}
