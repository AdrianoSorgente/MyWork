<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="tiles"  uri="http://struts.apache.org/tags-tiles" %>


<%@page import="utility.UserUtils"%>
<%@page import="srg.model.UtenteBean"%>
<%@page import="utility.Constants"%><script language="Javascript" src="js/dom-drag.js"></script>

	<%
	UserUtils us=null;
	UtenteBean user=null;
	try {
		us =new UserUtils();
		user=us.getLoggedUser(request,response);
		request.setAttribute("user",user);
	} catch (Exception e) {
		e.printStackTrace();
	}
		try {
	%>

<script type="text/javascript" src="js/ajax/prototype.js"></script>
<script type="text/javascript" src="js/ajax/scriptaculous.js"></script>
<script language="Javascript" src="js/dom-drag.js"></script>



<form:form name="index"  method="post" commandName="command" action="/customWorklist/statoICT.htm">
	<form:hidden path="method"/>
	<form:hidden path="selezioneCorrente" />
	<form:hidden path="paginazioneDa" />
	<form:hidden path="paginazioneA" />
	<form:hidden path="paginazioneCorrente" />
	<form:hidden path="paginazioneUltima" />

		<ol id="toc">
		    <li <c:if test='${command.selezioneCorrente=="1"}'>class="current"</c:if> >
				<a href="javascript:mieRichieste()"><span>Mie richieste</span></a></li>
		<c:if test='${stato.attoreRichiestePresenti != "N"}'>
		    <li <c:if test='${command.selezioneCorrente=="2"}'>class="current"</c:if> >
				<a href="javascript:attoreRichieste();"><span>Richieste elaborate</span></a></li>
		</c:if>
		    <li <c:if test='${command.selezioneCorrente=="3"}'>class="current"</c:if> >
				<a href="javascript:archivio();"><span>Archivio</span></a></li>
		<c:if test='${user.admin=="true"}'>
		    <li <c:if test='${command.selezioneCorrente=="4"}'>class="current"</c:if> >
				<a href="javascript:amministrazione();"><span>Amministrazione</span></a></li>
		</c:if> 
		<%if (UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_INFTEC) || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_TLC) || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_EDS)|| UserUtils.isInGroup(user, Constants.GRUPPO_ORG)) {%>
			<li <c:if test='${command.selezioneCorrente=="5"}'>class="current"</c:if> >
				<a href="javascript:tabOrg();"><span>Richieste attive</span></a></li>
		<%} %>
		<%if (user.getAdmin().booleanValue()==true || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_INFTEC) || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_TLC)||UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_EDS)|| UserUtils.isInGroup(user, Constants.GRUPPO_ORG)) {%>
			<li <c:if test='${command.selezioneCorrente=="6"}'>class="current"</c:if> >
				<a href="javascript:storico();"><span>Storico</span></a></li>
		<%} %>
                <%if (UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_INFTEC) || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_ORG) || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_EDS)) {%>
                        <li  >
                                <a href="javascript:showWorklistICT();"><span>Elabora richieste ICT</span></a>
                        </li>
                <%} %>
                <%if ( UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_TLC) || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_ORG) ) {%>
                        <li  >
                                <a href="javascript:showWorklistTLC();"><span>Elabora richieste TLC</span></a>
                        </li>
                <%} %>
	


		</ol>
	
	<c:if test='${command.selezioneCorrente=="3" || command.selezioneCorrente=="4" || command.selezioneCorrente=="5" || command.selezioneCorrente=="6"}'>
		<table width="100%" cellspacing="0" cellpadding="0" class="table_worklist" BORDER="0">
			<thead class="header_worklist">
				<tr>
					<th width="100">Richiesta</th>
					<th width="50"> ID:</th>
					<th colspan="3" align="left"><form:input path="filtroRichiestaID"/></th>
					<!-- <th colspan="1" align="left"><form:radiobutton path="filtroStandard" value="1"/>Standard</th> -->
					<c:choose>
						<c:when test='${command.selezioneCorrente=="4" || command.selezioneCorrente=="5"}'>
							<th colspan="2" align="left"><form:radiobutton path="filtroEvase" value="1"/>Da evadere</th>
						</c:when>
						<c:otherwise>
							<th colspan="2" align="left">&nbsp;</th>
						</c:otherwise>	
					</c:choose>						
				</tr>
				<tr>
					<th width="100">Richiedente</th>
					<th width="50">Nome:</th>
					<th align="left"><form:input path="filtroRichiedenteNome"/></th>
					<th width="100">Cognome:</th>
					<th align="left"><form:input path="filtroRichiedenteCognome"/></th>
					<!-- <th width="300"><form:radiobutton path="filtroStandard" value="0"/>Non Standard</th> -->
					<c:choose>
						<c:when test='${command.selezioneCorrente=="4" || command.selezioneCorrente=="5"}'>
							<th align="left"><form:radiobutton path="filtroEvase" value="0"/>Evase</th>
						</c:when>
						<c:otherwise>
							<th align="left">&nbsp;</th>
						</c:otherwise>	
					</c:choose>
					<TH width="30%" align="center"><a class="button" href="javascript:blurra();filtra();" name="button" id="buttonImport"><span class="icon">Filtra</span></TH>
				</tr>
				<tr>
					<th width="100">Destinatario</th>
					<th width="50">Nome:</th>
					<th align="left"><form:input path="filtroDestinatarioNome"/></th>
					<th width="100">Cognome:</th>
					<th align="left"><form:input path="filtroDestinatarioCognome"/></th>
					<!-- <th width="300"><form:radiobutton path="filtroStandard" value="%"/>Entrambi</th>-->
					<c:choose>
						<c:when test='${command.selezioneCorrente=="4" || command.selezioneCorrente=="5"}'>
							<th ><form:radiobutton path="filtroEvase" value="%"/>Entrambe</th>
						</c:when>
						<c:otherwise>
							<th align="left">&nbsp;</th>
						</c:otherwise>	
					</c:choose>
										
					<TH width="30%">&nbsp;</TH>
				</tr>
				<tr>
					<th colspan="8">&nbsp;</th>
				</tr>
			</thead>
		</table>
	</c:if>

		
	<table width="100%" cellspacing="0" cellpadding="0" class="table_worklist" BORDER="1">
			
		<thead class="header_worklist">
			<tr>
				<th width="100">Richiesta</th>
				<c:if test='${(command.selezioneCorrente != null && command.selezioneCorrente == "4")  }'>
					<th width="30">&nbsp;</th>
				</c:if>
				<th>Richiedente</th>
				<th>Destinatario</th>
				<th>Servizio</th>
				<th>&nbsp;</th>
				<th align='center' width="100">Responsabile</th>
				<c:if test='${command.selezioneCorrente=="1"}'>
					<th align='center' width="100" colspan=4>Stato</th>
	 			</c:if>
	 			<c:if test='${command.selezioneCorrente=="3"}'>
	 				<th align='center' width="100" colspan=4>Asset Tag</th>
	 			</c:if>
	 			<c:if test='${command.selezioneCorrente!="1" && command.selezioneCorrente!="3"}'>

					<th align='center' width="100">INFTEC/TLC</th>
					<th align='center' width="100">AM</th>
					<th align='center' width="100">Evasione</th>
	 				<th align='center' width="100">Ticket</th>
	 			</c:if>	 
			</tr>
		</thead>
		<tbody>
			<c:set var="count" value="-1" scope="page"/>
			<c:set var="lastPk" value="-1" scope="page"/>
			<c:set var="lastID" value="-1" scope="page"/>
			<c:set var="changedID" value="0" scope="page"/>
			<c:set var="rowCurrentPk" value="-1" scope="page"/>
			<c:forEach items="${lista}" var="pacchetto" varStatus="loopProcessi">
				<c:if test='${lastID eq -1 }'>
					<c:set var="lastID" value="${pacchetto.richiesta}" scope="page"/>
				</c:if>
				<c:choose>
					<c:when test='${lastID != pacchetto.richiesta}'>
						<c:set var="changedID" value="1" scope="page"/>
					</c:when>				
					<c:otherwise>
						<c:set var="changedID" value="0" scope="page"/>
					</c:otherwise>
				</c:choose>
				<!-- set colore riga -->
				<c:choose>
					<c:when test='${lastPk != pacchetto.invokerId}'>				
						<c:set var="count" value="${count+1}" scope="page"/>
						
						<c:choose>				
						<c:when test='${(count)%2 eq 0}'>
						      <c:set var="rowColor" value="odd" scope="page"/>
						</c:when>
						<c:otherwise>
							<c:set var="rowColor" value="" scope="page"/>
						</c:otherwise>
						</c:choose>
						<script>
						if ('<c:out value="${lastPk}"/>'!='-1' && '<c:out value="${command.selezioneCorrente}"/>' == '4') {
							document.getElementsByName('TD<c:out value="${lastPk}"/>')[0].rowSpan=<c:out value="${rowCurrentPk+1}"/>
						}
						</script>
						<c:set var="lastPk" value="${pacchetto.invokerId}" scope="page"/>
						<c:set var="rowCurrentPk" value="0" scope="page"/>
					</c:when>
					<c:otherwise>
						<c:set var="rowCurrentPk" value="${rowCurrentPk+1}" scope="page"/>
						<!-- INC CURRENT PK -->
					</c:otherwise>
				</c:choose>
				<!-- /set colore riga -->
				
				<tr class="worklist_tr <c:out value="${rowColor}"/>">
			    <c:choose>
				  <c:when test='${(command.selezioneCorrente != null && command.selezioneCorrente == "4") && rowCurrentPk eq 0 }'>
					<td align='center' id="TD<c:out value="${pacchetto.invokerId}"/>" >
						<c:out value="${pacchetto.invokerId}"/> \ <c:out value="${pacchetto.indice_richiesta}"/>
						<c:if test='${user.admin=="true" && pacchetto.statoAm=="N"  }'>
							<c:choose>
						    	<c:when test='${pacchetto.tipoDotazione == 1 }'>
									<a class="button" href="javascript:blurra();avanza('<c:out value="${pacchetto.richiesta}"/>')" id="buttonImport" name="button"><span class="icon">Avanza</span>
								</c:when>
								<c:when test='${pacchetto.tipoDotazione != null && pacchetto.tipoDotazione == 2 }'>
									<a class="button" href="javascript:blurra();avanzaTLC('<c:out value="${pacchetto.richiesta}"/>')" id="buttonImport" name="button"><span class="icon">Avanza</span>
								</c:when>
						    	<c:when test='${pacchetto.tipoPacchetto == "15" }'>
									<a class="button" href="javascript:blurra();avanzaTLC('<c:out value="${pacchetto.richiesta}"/>')" id="buttonImport" name="button"><span class="icon">Avanza</span>
								</c:when>
								<c:otherwise>
									<a class="button" href="javascript:blurra();avanza('<c:out value="${pacchetto.richiesta}"/>')" id="buttonImport" name="button"><span class="icon">Avanza</span>
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
				 </c:when>
				 <c:otherwise>
					<c:if test='${command.selezioneCorrente != null && command.selezioneCorrente != "4"}'>
						<td align='center'  >
							<c:choose>
						    <c:when test='${(pacchetto.tipoPacchetto == "15") or (pacchetto.tipoPacchetto == "14")}'>
								<span style="color: <%=Constants.COLORE_TLC%>">
							</c:when>
							<c:otherwise>
								<span style="color: <%=Constants.COLORE_INFTEC%>">
							</c:otherwise>
							</c:choose>
									<c:out value="${pacchetto.invokerId}"/> \ <c:out value="${pacchetto.indice_richiesta}"/>
								</span>
						</td>
					</c:if>
				 </c:otherwise>
				</c:choose>
				<c:if test='${(command.selezioneCorrente != null && command.selezioneCorrente == "4")  }'>
					<td> 
							<c:out value="${pacchetto.indice_richiesta}"/>
					</td>	
				</c:if>
							<td><a onclick="ajaxDettagliUtente('<c:out value="${pacchetto.richiedenteID}"/>');">
									<c:choose>
									<c:when test='${(pacchetto.tipoPacchetto == "15") or (pacchetto.tipoPacchetto == "14")}'>
										<span style="color: <%=Constants.COLORE_TLC%>">
									</c:when>
									<c:otherwise>
										<span style="color: <%=Constants.COLORE_INFTEC%>">
									</c:otherwise>
									</c:choose>
											<c:out value="${pacchetto.richiedenteNome}"/> (<c:out value="${pacchetto.richiedenteID}"/>)
										</span>
								</a>
							</td>
						    <td ><a onclick="ajaxDettagliUtente('<c:out value="${pacchetto.destinatarioID}"/>');">
						    		<c:choose>
						    		<c:when test='${(pacchetto.tipoPacchetto == "15") or (pacchetto.tipoPacchetto == "14")}'>
										<span style="color: <%=Constants.COLORE_TLC%>">
									</c:when>
									<c:otherwise>
										<span style="color: <%=Constants.COLORE_INFTEC%>">
									</c:otherwise>
									</c:choose>
						    				<c:out value="${pacchetto.destinatarioNome}"/> (<c:out value="${pacchetto.destinatarioID}"/>)
						    			</span>
						    	</a></td>
							<td >
									<c:choose>
						    		<c:when test='${(pacchetto.tipoPacchetto == "15") or (pacchetto.tipoPacchetto == "14")}'>
										<span style="color: <%=Constants.COLORE_TLC%>">
									</c:when>
									<c:otherwise>
										<span style="color: <%=Constants.COLORE_INFTEC%>">
									</c:otherwise>
									</c:choose>
											<c:out value="${pacchetto.nome_servizio}"/>
										</span>
							</td>
							<td >
								<!--<c:out value="${pacchetto.profilo}"/>-->
		<%if (UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_INFTEC) || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_ORG) || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_EDS)) {%>
								
								<!-- Risoluzione incident INC000000126687 13/02/2012 START:
								 Visualizzazione errata elenchi dei parametri richiesta troppo lunghi -->
								 <div id="dettaglioRichiesta<c:out value="${loopProcessi.index}"/><c:out value="${loopRichieste.index}"/>" style="display: none;">
								 	<c:if test="${not(empty pacchetto.note_evas)}">
										<b>Note INFTEC:</b> <c:out value='${pacchetto.note_evasPerVis}' escapeXml="false" /><br>
									</c:if>
									
									<c:if test="${not(empty pacchetto.ticket)}">
										<b>Ticket EDS:</b> <c:out value='${pacchetto.ticketPerVis}' escapeXml="false" /><br>
									</c:if>
									
									<c:if test="${not(empty pacchetto.noteProfilo)}">
										Eventuali note utente: <c:out value='${pacchetto.noteProfilo}' escapeXml="false" /><br>
									</c:if>
									
									<c:if test="${not(empty pacchetto.parametriRichiesta)}">
										Parametri richiesta: <br/>
										<c:forEach items="${pacchetto.parametriRichiesta}" var="parametriRichiesta" varStatus="loopParametri">
											<c:out value='${parametriRichiesta.nome_campo}' escapeXml="false" />: <c:out value='${parametriRichiesta.nome_value}' escapeXml="false" /><br>
										</c:forEach>
									</c:if>
									<c:if test="${(not(empty pacchetto.multirichiedente)) and pacchetto.multirichiedente=='S'}">
										<b>Assegnato a:</b><br/> 
										<c:out value='${pacchetto.cognome_assegn}' escapeXml="false" /> 
										<c:out value='${pacchetto.nome_assegn}' escapeXml="false" />
										(<c:out value='${pacchetto.id_assegn}' escapeXml="false" />)<br/>
									</c:if>
								 </div>
								
								
								<a href="javascript:mostraDettaglioRichiesta('<c:out value="${loopProcessi.index}"/>','<c:out value="${loopRichieste.index}"/>');blurra();" style="border:0" id="buttonImport" name="button" class="button"><span class="icon">Vis.Richiesta</span></a>
								
								<!-- Risoluzione incident INC000000126687 13/02/2012 END -->
		<%} else { %>
								<!-- Risoluzione incident INC000000126687 13/02/2012 START:
								 Visualizzazione errata elenchi dei parametri richiesta troppo lunghi -->
								 <div id="dettaglioRichiesta<c:out value="${loopProcessi.index}"/><c:out value="${loopRichieste.index}"/>" style="display: none;">
								 	<c:if test="${not(empty pacchetto.noteProfilo)}">
										Eventuali note utente: <c:out value='${pacchetto.noteProfilo}' escapeXml="false" /><br>
									</c:if>
									<c:if test="${not(empty pacchetto.parametriRichiesta)}">
										Parametri richiesta: <br/>
										<c:forEach items="${pacchetto.parametriRichiesta}" var="parametriRichiesta" varStatus="loopParametri">
											<c:out value='${parametriRichiesta.nome_campo}' escapeXml="false" />: <c:out value='${parametriRichiesta.nome_value}' escapeXml="false" /><br>
										</c:forEach>
									</c:if>
										<c:if test="${(not(empty pacchetto.multirichiedente)) and pacchetto.multirichiedente=='S'}">
											<b>Assegnato a:</b><br/> 
											<c:out value='${pacchetto.cognome_assegn}' escapeXml="false" /> 
											<c:out value='${pacchetto.nome_assegn}' escapeXml="false" />
											(<c:out value='${pacchetto.id_assegn}' escapeXml="false" />)<br/>
										</c:if>
								 </div>
								 
								 <a href="javascript:mostraDettaglioRichiesta('<c:out value="${loopProcessi.index}"/>','<c:out value="${loopRichieste.index}"/>');blurra();" style="border:0" id="buttonImport" name="button" class="button"><span class="icon">Vis.Richiesta</span></a>
								
								 <!-- Risoluzione incident INC000000126687 13/02/2012 END -->
		<%} %>
		
		<!--	Evolutiva pulsante STAMPA Napoli 23 novembre 2011	-->
		<c:if test='${command.selezioneCorrente=="2" || command.selezioneCorrente=="3" || command.selezioneCorrente=="5" || command.selezioneCorrente=="6"}'>
			<div>
				<a class="button" href="javascript:blurra();stampaDettagliRichiesta('<c:out value="${pacchetto.invokerId}"/>');" name="button" id="buttonImport">
					<span class="icon">Stampa</span>
				</a>
			</div>
		</c:if>
							</td>
							
							<td align='center' WIDTH="100"><c:out value="${pacchetto.odsNome}"/><br><c:out value="${pacchetto.odsDataDisplay}"/></td>
							
							<c:if test='${command.selezioneCorrente=="1"}'>
								<td align='center' colspan="4">
									<c:choose>
										<c:when test='${pacchetto.rifiutatoStepID != null &&  pacchetto.rifiutatoStepID != ""}'>
											
												<span style="color: red; font-weight: bold">RICHIESTA RIFIUTATA </span>
												<c:if test='${pacchetto.motivoRifiuto != null && pacchetto.motivoRifiuto != ""}'>
													<a href="javascript:mostraNote('<c:out value='${pacchetto.motivoRifiuto}'/>');" style="border:0"><img width="20" style="border:0; vertical-align: top" src="images/note.gif"/></a>
												</c:if>
											
										</c:when>
										<c:otherwise>
											<c:if test="${(pacchetto.stepID=='7')}">
													
												<span class="Stato-<c:out value="${pacchetto.invokerId}"/>">
													<c:out value="${pacchetto.statoCorrente}"/>
												</span>
													<c:if test='${(empty pacchetto.anomalia_id) and (pacchetto.tipoPacchetto != "15") and (pacchetto.tipoPacchetto != "14")}'>
														<br/>
														<span class="R<c:out value="${pacchetto.invokerId}"/>">
														<a  href="javascript:mostraRiapertura('<%=user.getId()%>', '<c:out value="${pacchetto.invokerId}"/>');blurra();" style="border:0" id="buttonImport" name="button" class="button"><span class="icon">Riaper. rich.</span></a>
														</span>
													</c:if>
											</c:if>
											<c:if test="${(pacchetto.stepID!='7')}">
												<c:out value="${pacchetto.statoCorrente}"/>
											</c:if>
										</c:otherwise>
									</c:choose>
								</td>
							</c:if>
							<c:if test='${command.selezioneCorrente=="3"}'>
								<td align='center' colspan="4">
									<c:choose>
										<c:when test='${pacchetto.rifiutatoStepID != null &&  pacchetto.rifiutatoStepID != ""}'>
												<span style="color: red; font-weight: bold">RICHIESTA RIFIUTATA </span>
												<c:if test='${pacchetto.motivoRifiuto != null && pacchetto.motivoRifiuto != ""}'>
													<a href="javascript:mostraNote('<c:out value='${pacchetto.motivoRifiuto}'/>');" style="border:0"><img width="20" style="border:0; vertical-align: top" src="images/note.gif"/></a>
												</c:if>
										</c:when>
										<c:otherwise>
											<c:out value="${pacchetto.assetTag}"/>
										</c:otherwise>
									</c:choose>
								</td>
							</c:if>
							<c:if test='${command.selezioneCorrente!="1" && command.selezioneCorrente!="3"}'>
								<td align='center' WIDTH="100"><c:out value="${pacchetto.inftecNome}"/></td>
								<td align='center' WIDTH="100"><c:out value="${pacchetto.amNome}"/></td>
								<td align='center' WIDTH="100">
									<c:choose>
									<c:when test='${pacchetto.rifiutatoStepID != null &&  pacchetto.rifiutatoStepID != ""}'>
										
											<span style="color: red; font-weight: bold">RICHIESTA RIFIUTATA </span>
											<c:if test='${pacchetto.motivoRifiuto != null && pacchetto.motivoRifiuto != ""}'>
												<a href="javascript:mostraNote('<c:out value='${pacchetto.motivoRifiuto}'/>');" style="border:0"><img width="20" style="border:0; vertical-align: top" src="images/note.gif"/></a>
											</c:if>
										
									</c:when>
									<c:otherwise>
										<c:out value="${pacchetto.evasioneNome}"/>
									</c:otherwise>
									</c:choose>
								</td>
								<td align='center' WIDTH="100"><c:out value="${pacchetto.ticket}"/></td>
							</c:if>
				</tr>
					
			</c:forEach>
		
			<script>
				if ('<c:out value="${lastPk}"/>'!='-1' && '<c:out value="${command.selezioneCorrente}"/>' =='4' ) {
					document.getElementsByName('TD<c:out value="${lastPk}"/>')[0].rowSpan=<c:out value="${rowCurrentPk+1}"/>
				}
			</script>

		
		<c:if test='${count <0}'>
			<tr class='worklist_tr odd' height='25' valign="middle"><td colspan='10' align='center'> Non ci sono richieste</td></tr>
		</c:if>

		<tr class='worklist_tr odd' height='25' valign="middle">
			<td 	<c:choose>
						<c:when test='${(command.selezioneCorrente != null && command.selezioneCorrente == "4")  }'>
							colspan='11'
						</c:when>
						<c:otherwise>
							colspan='10'
						</c:otherwise>
					</c:choose>  
				align='center'>
				<c:if test='${command.paginazioneCorrente != "1" }'> 
					<a href="javascript:pageDown();" style="text-decoration: none">&lt;&lt;</a>
				</c:if> 
				Pagina <c:out value="${command.paginazioneCorrente}"/> di <c:out value="${command.paginazioneUltima}" />
				<c:if test='${command.paginazioneCorrente != command.paginazioneUltima }'> 
					<a href="javascript:pageUp();" style="text-decoration: none">&gt;&gt;</a>
				</c:if> 
			</td>
		</tr>


		</tbody>
		<tfoot>
			<tr>
			<c:if test='${command.selezioneCorrente=="1"}'>
				<td colspan='1' class="header_worklist" align='right' style="border-right: 0px">
					<a class="button" href="javascript:mieRichieste();blurra();" id="buttonImport" name="button"><span class="icon">Aggiorna</span></a>
				</td>
			</c:if>
			<c:if test='${command.selezioneCorrente=="2"}'>
				<td colspan='1' class="header_worklist" align='right' style="border-right: 0px">
					<a class="button" href="javascript:attoreRichieste();blurra();" id="buttonImport" name="button"><span class="icon">Aggiorna</span></a>
				</td>
			</c:if>
		    <c:if test='${command.selezioneCorrente=="3"}'>
		    	<td colspan='1' class="header_worklist" align='right' style="border-right: 0px">
					<a class="button" href="javascript:archivio();blurra();" id="buttonImport" name="button"><span class="icon">Aggiorna</span></a>
				</td>
			</c:if>
			<c:if test='${command.selezioneCorrente=="4"}'>
				<td colspan='1' class="header_worklist" align='right' style="border-right: 0px">
					<a class="button" href="javascript:amministrazione();blurra();" id="buttonImport" name="button"><span class="icon">Aggiorna</span></a>
				</td>
			</c:if> 
			<%if (UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_INFTEC) || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_TLC) || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_EDS)|| UserUtils.isInGroup(user, Constants.GRUPPO_ORG)) {%>
			<c:if test='${command.selezioneCorrente=="5"}'>
				<td colspan='1' class="header_worklist" align='right' style="border-right: 0px">
					<a class="button" href="javascript:tabOrg();blurra();" id="buttonImport" name="button"><span class="icon">Aggiorna</span></a>
				</td>
			</c:if>
			<%} %>
			<%if (user.getAdmin().booleanValue()==true || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_INFTEC) || UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_TLC)||UserUtils.isCurrUserInGroup(user, Constants.GRUPPO_EDS)|| UserUtils.isInGroup(user, Constants.GRUPPO_ORG)) {%>
			<c:if test='${command.selezioneCorrente=="6"}'>
				<td colspan='1' class="header_worklist" align='right' style="border-right: 0px">
					<a class="button" href="javascript:storico();blurra();" id="buttonImport" name="button"><span class="icon">Aggiorna</span></a>
				</td>
			</c:if>
			<%} %>
			<td 
					<c:choose>
						<c:when test='${(command.selezioneCorrente != null && command.selezioneCorrente == "4")  }'>
							colspan='10'
						</c:when>
						<c:otherwise>
							colspan='9'
						</c:otherwise>
					</c:choose> 
					class="header_worklist" align='right'>
				&nbsp;
			</tr>
		</tfoot>
	</table>
	<jsp:include page="popupRiapertura.jsp"></jsp:include>


</form:form>
<%} catch (Exception e ) {
	 e.printStackTrace();
}

%>
<script type="text/javascript" src="js/funzioniWorklist.js"></script>

<script>
function mieRichieste() {
	document.forms.index.method.value="showMieRichieste";
	document.forms.index.paginazioneCorrente.value='1';
	document.forms.index.paginazioneDa.value='1';
	document.forms.index.paginazioneA.value='10';
	document.forms.index.submit();
}
function attoreRichieste() {
	document.forms.index.method.value="showAttoreRichieste";
	document.forms.index.paginazioneCorrente.value='1';
	document.forms.index.paginazioneDa.value='1';
	document.forms.index.paginazioneA.value='10';
	document.forms.index.submit();
}
function archivio() {
	document.forms.index.method.value="showArchivio";
	document.forms.index.paginazioneCorrente.value='1';
	document.forms.index.paginazioneDa.value='1';
	document.forms.index.paginazioneA.value='10';
	document.forms.index.submit();
}

function storico() {
	document.forms.index.method.value="showStorico";
	document.forms.index.paginazioneCorrente.value='1';
	document.forms.index.paginazioneDa.value='1';
	document.forms.index.paginazioneA.value='10';
	document.forms.index.submit();
}


function amministrazione() {
	document.forms.index.method.value="showAmministrazione";
	document.forms.index.paginazioneCorrente.value='1';
	document.forms.index.paginazioneDa.value='1';
	document.forms.index.paginazioneA.value='10';
	document.forms.index.submit();
}

function tabOrg() {
	document.forms.index.method.value="showORG";
	document.forms.index.paginazioneCorrente.value='1';
	document.forms.index.paginazioneDa.value='1';
	document.forms.index.paginazioneA.value='10';
	document.forms.index.submit();
}


function pageUp() {
	var paginaDa=parseInt(document.forms.index.paginazioneDa.value,10);
	var paginaA=parseInt(document.forms.index.paginazioneA.value,10);
	var paginaCorrente=parseInt(document.forms.index.paginazioneCorrente.value,10);
	document.forms.index.paginazioneDa.value=paginaDa+10;
	document.forms.index.paginazioneA.value=paginaA+10;
	document.forms.index.paginazioneCorrente.value=paginaCorrente+1;
	document.forms.index.submit();
}

function pageDown() {
	var paginaDa=parseInt(document.forms.index.paginazioneDa.value,10);
	var paginaA=parseInt(document.forms.index.paginazioneA.value,10);
	var paginaCorrente=parseInt(document.forms.index.paginazioneCorrente.value,10);
	document.forms.index.paginazioneDa.value=paginaDa-10;
	document.forms.index.paginazioneA.value=paginaA-10;
	document.forms.index.paginazioneCorrente.value=paginaCorrente-1;
	document.forms.index.submit();
}

function filtra() {
	document.forms.index.paginazioneCorrente.value='1';
	document.forms.index.paginazioneDa.value='1';
	document.forms.index.paginazioneA.value='10';
	document.forms.index.submit();
}

function avanza(processId) {
	location.replace('ict.htm?method=viewLista&processID='+processId);
}

function avanzaTLC(processId) {
	location.replace('tlc.htm?method=viewListaTLC&processID='+processId);
}

function elimina(processId) {
	location.replace('ict.htm?method=eliminaTask&processId='+processId);
}

</script>
