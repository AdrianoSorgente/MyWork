	function salva_oid(pacchetto,richiesta) {
		mostraDiv('popupSalva');
		hide_buttons();
		document.getElementById('approvazioni['+pacchetto+']['+richiesta+']').value="S";
		document.forms.index.method.value="salvaOid";
		document.forms.index.submit();
	}

	function salva_am() {
		mostraDiv('popupSalva');
		hide_buttons();
		document.forms.index.method.value="salvaAm";
		document.forms.index.submit();
	}

	function salva() {
		mostraDiv('popupSalva');
		hide_buttons();
		document.forms.index.method.value="salva";
		document.forms.index.submit();
	}

	function salva_ticket() {
		mostraDiv('popupSalva');
		hide_buttons();
		document.forms.index.method.value="salvaTicket";
		document.forms.index.submit();
	}

	function salvaTLC() {
		mostraDiv('popupSalva');
		hide_buttons();
		document.forms.index.method.value="salvaTLC";
		document.forms.index.submit();
	}
	
	function refresh() {
		document.forms.index.method.value="viewLista";
		document.forms.index.submit();
	}
	
	function refreshTLC() {
		document.forms.index.method.value="viewListaTLC";
		document.forms.index.submit();
	}

	
	function dettaglioOID(oid,pacchetto,richiesta) {
		document.getElementById('popUpButton1').innerHTML='<a href="javascript:salva_oid(\''+pacchetto+'\',\''+richiesta+'\')">Salva su OID</a>';
		document.getElementById('alertMessage').innerHTML=oid;
		mostraDiv('popUp');
	}		


	function cambiaStep(stepId) {
		document.forms.index.method.value="cambiaStepId";
		document.forms.index.stepId.value=stepId;
		document.forms.index.submit();
	}

	function cambiaAdmin(admin) {
	document.forms.index.method.value="viewLista";
	document.forms.index.admin.value=admin;
	document.forms.index.submit();
	}

	function cambiaTab(stepId) {
	document.forms.index.method.value="cambiaTab";
	document.forms.index.admin.value=false;
	document.forms.index.stepId.value=stepId;
	document.forms.index.submit();
	}

	function cambiaTabICT(admin, stepId) {
		document.forms.index.method.value="cambiaTab";
		document.forms.index.admin.value=admin;
		document.forms.index.stepId.value=stepId;
		document.forms.index.submit();
	}
	
	function cambiaTabTLC(admin, stepId) {
		document.forms.index.method.value="cambiaTabTLC";
		document.forms.index.admin.value=admin;
		document.forms.index.stepId.value=stepId;
		document.forms.index.submit();
	}
	
	function mostraNote(nota) {
		document.getElementById('alertMessage').innerHTML=nota;
		document.getElementById('popUpButton1').innerHTML='&nbsp;';
		mostraDiv('popUp');
	}
	
	function mostraNoteTLC(nota,mail) {
		document.getElementById('alertMessage').innerHTML=nota;
		document.getElementById('popUpButton1').innerHTML='&nbsp;';
		if (mail == null) {
			document.getElementById('mail').innerHTML='&nbsp;';
			document.getElementById('mail').href='#';
		}
		else {
			document.getElementById('mail').href=mail;
			document.getElementById('mail').innerHTML='Mail';
		}
		mostraDiv('popUp');
	}
	
	/*
	 * Risoluzione incident INC000000126687 13/02/2012 START:
	 * Visualizzazione errata elenchi dei parametri richiesta troppo lunghi
	 */
	function mostraDettaglioRichiesta(indiceProcessi,indiceRichieste) {
		document.getElementById('alertMessage').innerHTML=document.getElementById('dettaglioRichiesta' + indiceProcessi + indiceRichieste).innerHTML;;
		document.getElementById('popUpButton1').innerHTML='&nbsp;';
		mostraDiv('popUp');
	}
	
	function mostraDettaglioRichiestaTLC(indiceProcessi,indiceRichieste) {
		
		/*
		 *  PSI.12.0001: START 
		 *  Visualizzazione parametri richiesta in forma tabellare per il servizio 
		 *  "Modifica lista allargata per scheda SIM telefonia mobile"
		 */
		document.getElementById('alertMessage').innerHTML=document.getElementById('dettaglioRichiesta' + indiceProcessi + indiceRichieste).innerHTML;
		document.getElementById('popUpButton1').innerHTML='&nbsp;';
		
		if (document.getElementById('mailto' + indiceProcessi + indiceRichieste) == null) {
			document.getElementById('mail').innerHTML='&nbsp;';
			document.getElementById('mail').href='#';
		}
		else {
			mailTo = document.getElementById('mailtoHeader' + indiceProcessi + indiceRichieste).innerText + 
					 encodeURIComponent(document.getElementById('mailtoBody' + indiceProcessi + indiceRichieste).innerText);
						
			document.getElementById('mail').href = mailTo;
			document.getElementById('mail').innerHTML='Mail';
		}
		
		mostraDiv('popUp');
	}
	
//	function mostraRiapertura(utenteId, invokerId) {
//		alert("prova");
//		//document.getElementById('invokerId').value=invokerId;
//		//document.getElementById('invokerNr').innerHTML=invokerId;
//		//document.getElementById('utenteId').value=utenteId;
//		//mostraDiv('popUpR');
//	}	
	function mostraInfoPacchetto(titolo, dataInizio, dataUpdate, evasoOds, evasoLinea, evasoOrg) {
		document.getElementById('alertMessage').innerHTML='Stato processo:'+titolo+'<br>'+
			'Data creazione richiesta: '+dataInizio+'<br>'+
			'Data ultimo aggiornamento:'+dataUpdate ;
		
		document.getElementById('popUpButton1').innerHTML='&nbsp;';
		mostraDiv('popUp');

	}

	function mostraInfoPacchettoTLC(titolo, dataInizio, dataUpdate, evasoOds, evasoLinea, evasoOrg) {
		document.getElementById('alertMessage').innerHTML='Stato processo:'+titolo+'<br>'+
			'Data creazione richiesta: '+dataInizio+'<br>'+
			'Data ultimo aggiornamento:'+dataUpdate ;
		document.getElementById('mail').innerHTML='&nbsp;';
		document.getElementById('mail').href='#';
		document.getElementById('popUpButton1').innerHTML='&nbsp;';
		mostraDiv('popUp');

	}
	
	function mostraInfoRichiesta(evasoOds, evasoLinea, evasoOrg) {
			document.getElementById('alertMessage').innerHTML='Stato evasioni:';
			
			if (!evasoOds=='') {
				document.getElementById('alertMessage').innerHTML+='<br>'+evasoOds;
			}
			if (!evasoLinea=='') {
				document.getElementById('alertMessage').innerHTML+='<br>'+evasoLinea;
			}
			if (!evasoOrg=='') {
				document.getElementById('alertMessage').innerHTML+='<br>'+evasoOrg;
			}	
			
			
			document.getElementById('popUpButton1').innerHTML='&nbsp;';
			mostraDiv('popUp');

		}

		
	function motivoRifiuto(obj) {
		document.getElementById('alertMessage').innerHTML='Motivo del rifiuto:<br><textarea cols="40" rows="4" id="motivoRifiuto">'+document.getElementById(obj).value+'</textarea>';
		document.getElementById('popUpButton1').innerHTML='<a href="javascript:salvaRifiuto(\''+obj+'\')">Salva</a>';
		mostraDiv('popUp');
	}
	
	function motivoRifiutoTLC(obj) {
		document.getElementById('alertMessage').innerHTML='Motivo del rifiuto:<br><textarea cols="40" rows="4" id="motivoRifiuto">'+document.getElementById(obj).value+'</textarea>';
		document.getElementById('popUpButton1').innerHTML='<a href="javascript:salvaRifiuto(\''+obj+'\')">Salva</a>';
		document.getElementById('mail').innerHTML='&nbsp;';
		document.getElementById('mail').href='#';
		mostraDiv('popUp');
	}
	
	function salvaRifiuto(obj) {
		document.getElementById(obj).value=document.getElementById('motivoRifiuto').value;
		chiudiDiv('popUp');
	}

	function noteApprovazione(obj, processId, requestId) {
		document.getElementById('alertMessage').innerHTML='Nota di Approvazione:<br><textarea cols="40" rows="4" id="notaApp">'+document.getElementById(obj).value+'</textarea>';
		document.getElementById('popUpButton1').innerHTML='<a href="javascript:salvaNotaApp(\''+obj+'\', \''+processId+'\', \''+requestId+'\')">Salva</a>';
		mostraDiv('popUp');
	}
	
	function noteApprovazioneTLC(obj, processId, requestId) {
		document.getElementById('alertMessage').innerHTML='Nota di Approvazione:<br><textarea cols="40" rows="4" id="notaApp">'+document.getElementById(obj).value+'</textarea>';
		document.getElementById('popUpButton1').innerHTML='<a href="javascript:salvaNotaApp(\''+obj+'\', \''+processId+'\', \''+requestId+'\')">Salva</a>';
		document.getElementById('mail').innerHTML='&nbsp;';
		document.getElementById('mail').href='#';
		mostraDiv('popUp');
	}
	
	function salvaNotaApp(obj, processId, requestId) {
		document.getElementById(obj).value=document.getElementById('notaApp').value;
		var action="/customWorklist/ict.htm";
		var parametri="method=salvaNotaApp&processID="+processId+"&requestID="+requestId+"&noteContent="+encodeURIComponent(document.getElementById(obj).value); 
		document.body.style.cursor='wait';
		
		var MyAjax = new Ajax.Request(
				action,
		              {      method: "post",
		                     parameters: parametri, 
							 onFailure: function (response) {
								alert('Attenzione,errore nel salvataggio della nota su database');
								alert('failure:' + response.responseText);
							 	document.body.style.cursor='default';
							 }, 
							 onSuccess: function (response) {
								 if (!('SUCCESS'==response.responseText)) {
									alert('ERRORE: '+response.responseText);
								 }
								document.body.style.cursor='default';
							 }
		              }
			  );
		chiudiDiv('popUp');
	}
	
	function check_salva() {
		if (check_completo()==true) {
			salva();
			return true;
		} else {
			document.getElementById('alertMessage').innerHTML='Attenzione, ci sono pacchetti iniziati ma non completati. <br>Se si continua, questi pacchetti non verranno presi in considerazione.<br>Continuare lo stesso?';
			document.getElementById('popUpButton1').innerHTML='<a href="javascript:salva()">Si</a>';
			mostraDiv('popUp');
			return false;
		}
	}
	
	function check_salvaTLC() {
		if (check_completo()==true) {
			salvaTLC();
			return true;
		} else {
			document.getElementById('alertMessage').innerHTML='Attenzione, ci sono pacchetti iniziati ma non completati. <br>Se si continua, questi pacchetti non verranno presi in considerazione.<br>Continuare lo stesso?';
			document.getElementById('popUpButton1').innerHTML='<a href="javascript:salva()">Si</a>';
			mostraDiv('popUp');
			return false;
		}
	}
	
	function check_mostraRifiuto() {
		
		var j=0;
		while (document.getElementsByName('approvazioni['+j+'][0]').length>0) {
			var i=0;
			while ( document.getElementsByName('approvazioni['+j+']['+i+']').length>0 ) {
				var imgNoteRifiuto = document.getElementById('imgNoteRifiuto['+j+']['+i+']');
				if(imgNoteRifiuto) {
					imgNoteRifiuto.style.visibility='hidden';
				if (getCheckedValue(document.getElementsByName('approvazioni['+j+']['+i+']')) == 'N') {
						imgNoteRifiuto.style.visibility='visible';
				}
				}
				i++;
			}
			j++;
		}
	}
	
	function check_mostraRifiutoAll(index, count, min){
		
			var i=0;
			var offset = parseInt(min);
			while ( document.getElementsByName('approvazioni['+index+']['+i+']').length>0 ) {
				var mostraGif = document.getElementById('imgNoteRifiuto['+count+']['+offset+']');
				mostraGif.style.visibility='hidden';
				if (getCheckedValue(document.getElementsByName('approvazioni['+index+']['+i+']')) == 'N') {
					mostraGif.style.visibility='visible';
				}
				i++;
				offset++;
			}
	}
	function check_mostraRifiuto_Decodificata(i, j, indexProc, indexRich) {
		var controlCheck = getCheckedValue(document.getElementsByName('approvazioni['+indexProc+']['+indexRich+']'));
		var mostraGif = document.getElementById('imgNoteRifiuto['+i+']['+j+']');
		if(controlCheck){
			mostraGif.style.visibility='hidden';
		}
		if(controlCheck=='N') {
			mostraGif.style.visibility='visible';
		}
	}
function check_mostraNotaApprovazione() {
		//alert('ciao');
		var j=0;
		//alert('document.getElementsByName(approvazioni[+j+][0]) ' + document.getElementsByName("approvazioni["+j+"][0]"));
		while (document.getElementsByName('approvazioni['+j+'][0]').length>0) {
			//alert('j ' + j);
			var i=0;
			while ( document.getElementsByName('approvazioni['+j+']['+i+']').length>0 ) {
				//alert('i ' + i);
				//alert('document.getElementsByName(approvazioni[+j+][0]) ' + document.getElementsByName("approvazioni["+j+"]["+i+"]"));
				if(document.getElementById('imgNoteApp['+j+']['+i+']')) {
					document.getElementById('imgNoteApp['+j+']['+i+']').style.visibility='hidden';
					if (getCheckedValue(document.getElementsByName('approvazioni['+j+']['+i+']')) == 'S') {
						document.getElementById('imgNoteApp['+j+']['+i+']').style.visibility='visible';
					}
				} 
				i++;
			}
			j++;
		}
		//alert('ciao end');
	}
	
	function pulisci_tutto() {
		var j=0;
		while (document.getElementsByName('approvazioni['+j+'][0]').length>0) {
			var i=0;
			while ( document.getElementsByName('approvazioni['+j+']['+i+']').length>0 ) {
				if(document.getElementsByName('approvazioni['+j+']['+i+']')) {
					if(document.getElementsByName('approvazioni['+j+']['+i+']')[0]) {
				document.getElementsByName('approvazioni['+j+']['+i+']')[0].checked=false;
					}
					if(document.getElementsByName('approvazioni['+j+']['+i+']')[1]) {
				document.getElementsByName('approvazioni['+j+']['+i+']')[1].checked=false;
					}
				}
				i++;
			}
			j++;
		}
		check_mostraNotaApprovazione();
		check_mostraRifiuto();
	}

	
	function pulisci_am() {
		var j=0;
		while (document.getElementsByName('chiudi['+j+']').length>0) {
			document.getElementsByName('chiudi['+j+']')[0].checked=false;
			j++;
		}
	}
	
	function blurra() {
		var i=0;
		var elemento=document.getElementsByName('button')[i];
		while (elemento!=null && elemento!=undefined) {
			elemento.blur();
			i++;
			elemento=document.getElementsByName('button')[i];
		}
	}

	function hide_buttons() {
		var i=0;
		var elemento=document.getElementsByName('button')[i];
		while (elemento!=null && elemento!=undefined) {
			elemento.style.visibility='hidden';
			i++;
			elemento=document.getElementsByName('button')[i];
		}
	}

	
	function check_completo() {
		
		var j=0;
		while (document.getElementsByName('approvazioni['+j+'][0]').length>0) {
			var i=0;
			var completo=true;
			var iniziato=false;
			while ( document.getElementsByName('approvazioni['+j+']['+i+']').length>0 ) {
				if (!isChecked(document.getElementsByName('approvazioni['+j+']['+i+']'))) { 
					completo=false;
				} else {
					iniziato=true;
				}
				i++;
			}
			if (iniziato==true && completo==false) {
				return false;
			}
			j++;
		}
		return true;
	}
	
	function approva_rifiuta(index, value) {
		var i=0;
		while ( document.getElementsByName('approvazioni['+index+']['+i+']').length>0 ) {
			setCheckedValue(document.getElementsByName('approvazioni['+index+']['+i+']'),value);
			i++;
		}
	}

	function setCheckedValue(radioObj, newValue) {
		if(!radioObj)
			return;
		var radioLength = radioObj.length;
		if(radioLength == undefined) {
			radioObj.checked = (radioObj.value == newValue.toString());
			return;
		}
		for(var i = 0; i < radioLength; i++) {
			radioObj[i].checked = false;
			if(radioObj[i].value == newValue.toString()) {
				radioObj[i].checked = true;
			}
		}
	}

	function isChecked(radioObj) {
		if(!radioObj)
			return;
		var radioLength = radioObj.length;
		if(radioLength == undefined) {
			return radioObj.checked;
			return;
		}
		var check=false;
		for(var i = 0; i < radioLength; i++) {
			if (radioObj[i].checked == true) check=true;
		}
		return check;
	}

	function getCheckedValue(radioObj) {
		if(!radioObj)
			return;
		var radioLength = radioObj.length;
		if(radioLength == undefined) {
			return radioObj.checked;
			return;
		}
		var check=false;
		for(var i = 0; i < radioLength; i++) {
			if (radioObj[i].checked == true) return radioObj[i].value;
		}
		return "";
	}

	function torna_stato() {
		location.replace('stato.htm?method=showAmministrazione');
	}
	
	function torna_stato_ict() {
		location.replace('statoICT.htm?method=showAmministrazione');
	}
	
	function chiudiDiv(d) {
		document.getElementById(d).style.visibility = 'hidden';
		if (document.all) // Only do this for IE, hack from Niku
	    {
	        for (formIdx=0; formIdx<document.forms.length; formIdx++) 
	        {
	            var theForm = document.forms[formIdx];
	            for(elementIdx=0; elementIdx<theForm.elements.length; elementIdx++)
	            {
	                if(theForm[elementIdx].type == "select-one" && theForm[elementIdx].id.indexOf("profilo_sel[")!=-1  && d!="popUpLookup") 
	                {    theForm[elementIdx].style.visibility = "visible";    }
	            }
	        }
	    } 
	}
	
	function mostra(d,t) {
		var top = (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
		document.getElementById(d).style.top=top+114;
		document.getElementById(d).style.visibility = 'visible';
		Drag.init(document.getElementById(t),document.getElementById(d));
	}

	function mostraDiv(d) {
		var top = (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
		document.getElementById(d).style.top=top+114;
		document.getElementById(d).style.visibility = 'visible';
		
		Drag.init(document.getElementById('titoloPopUp'),document.getElementById(d));
	}

	function ajaxScriviOID(userID,profilo,risorsa,pacchetto,richiesta, process_id,indice_richiesta, tipo_richiesta) {
		
		var action="/customWorklist/index.htm";
		var parametri="method=profiloOid&userID="+userID+"&profilo="+profilo+"&resourceID="+risorsa+"&pacchetto="+process_id+"&richiesta="+indice_richiesta+"&tipoRichiesta="+tipo_richiesta; 
		document.body.style.cursor='wait';
		
		var MyAjax = new Ajax.Request(
				action,
		              {      method: "post",
		                     parameters: parametri, 
							 onFailure: function (response) {
								alert('Attenzione,errore nel recupero delle informazioni su OID!');
								alert('failure:' + response.responseText);
							 	document.body.style.cursor='default';
							 }, 
							 onSuccess: function (response) {
								document.getElementById('popUpOID').innerHTML=response.responseText;
								document.getElementById('popUpButton1OID').innerHTML='<a href="javascript:salva_oid(\''+pacchetto+'\',\''+richiesta+'\')">Salva su OID</a>';
								mostraDiv('popUpOID');
								document.body.style.cursor='default';
							 }
		              }
			  );
		//alert('end Ajax');
	}
	
	
	function ajaxDettagliUtente(userID) {
		
		var action="/customWorklist/index.htm";
		var parametri="method=dettagliUser&userID="+userID; 
		document.body.style.cursor='wait';
		
		var MyAjax = new Ajax.Request(
				action,
		              {      method: "post",
		                     parameters: parametri, 
							 onFailure: function (response) {
								alert('Attenzione,errore nel recupero delle informazioni su Utente!');
								alert('failure:' + response.responseText);
							 	document.body.style.cursor='default';
							 }, 
							 onSuccess: function (response) {
								 
								document.getElementById('popUpUser').innerHTML=response.responseText;
								mostraDiv('popUpUser');
								
								Drag.init(document.getElementById('titoloPopUpUser'),document.getElementById('popUpUser'));
								document.body.style.cursor='default';
							 }
		              }
			  );
		//alert('end Ajax');
	}
	
	function popUpEliminaTask(processId) {
		document.getElementById('alertMessage').innerHTML='Vuoi veramente cancellare questa richiesta?';
		document.getElementById('popUpButton1').innerHTML='<a href="javascript:ajaxEliminaTask(\''+processId + '\');">Elimina</a>';
		mostraDiv('popUp');
		Drag.init(document.getElementById('titoloPopUp'),document.getElementById('popUp'));
	}
	
function ajaxEliminaTask(processId) {
		
		var action="/customWorklist/index.htm";
		var parametri="method=eliminaTask&processID="+processId; 
		document.body.style.cursor='wait';
		
		var MyAjax = new Ajax.Request(
				action,
		              {      method: "post",
		                     parameters: parametri, 
							 onFailure: function (response) {
								alert('Attenzione,errore eliminado task');
								alert('failure:' + response.responseText);
							 	document.body.style.cursor='default';
							 }, 
							 onSuccess: function (response) {
								document.getElementById('alertMessage').innerHTML=response.responseText;
								//document.getElementById('popUpButton1').innerHTML='<a href="javascript:window.location.reload();">Ricarica</a>';
								document.getElementById('popUpButton1').innerHTML='<a href="javascript:document.forms.index.submit();">Ricarica</a>';
								
								 
								mostraDiv('popUp');
								Drag.init(document.getElementById('titoloPopUp'),document.getElementById('popUp'));
								document.body.style.cursor='default';
							 }
		              }
			  );
		//alert('end Ajax');
	}
	
	
	
	function get_selected_text(selObjectId) {
		var w = document.getElementById(selObjectId).selectedIndex;
		var selected_text = document.getElementById(selObjectId).options[w].text;
		return (selected_text);
	}
	
	function set_tickectPacchetto(pacchettoId) {
		var tickectPacchetto = document.getElementById('tickectPacchetto_' + pacchettoId);
		if(tickectPacchetto) {
			var tickets = document.getElementsByName('ticket[' + pacchettoId + ']');
			if(tickets) {
				for(var i = 0; i < tickets.length; i++) {
					tickets[i].value = tickectPacchetto.value;
				}
			}
		}
	}
	
	function clear_tickectPacchetto(pacchettoId) {
		var tickectPacchetto = document.getElementById('tickectPacchetto_' + pacchettoId);
		if(tickectPacchetto) {
			tickectPacchetto.value = '';
		}
	}

	function set_tagPacchetto(pacchettoId) {
		var tagPacchetto = document.getElementById('tagPacchetto_' + pacchettoId);
		if(tagPacchetto) {
			var tags = document.getElementsByName('tag[' + pacchettoId + ']');
			if(tags) {
				for(var i = 0; i < tags.length; i++) {
					tags[i].value = tagPacchetto.value;
				}
			}
		}
	}
	
	function clear_tagPacchetto(pacchettoId) {
		var tagPacchetto = document.getElementById('tagPacchetto_' + pacchettoId);
		if(tagPacchetto) {
			tagPacchetto.value = '';
		}
	}
	
	function annulla_avanzaTask() {
		var avanzaTaskOptions = document.getElementsByTagName('input');
		if(avanzaTaskOptions) {
			for(var i = 0; i < avanzaTaskOptions.length; i++) {
				if(avanzaTaskOptions[i].checked) {
					avanzaTaskOptions[i].checked = false;
					avanzaTaskOptions[i].value = '';
				}
			}
		}
	}
	
	function avanzaPacchetto(pacchettoId) {
		var avanzaTaskOptions = document.getElementsByName('avanzaTask[' + pacchettoId + ']');
		if(avanzaTaskOptions) {
			for(var i = 0; i < avanzaTaskOptions.length; i++) {
				avanzaTaskOptions[i].checked = true;
				avanzaTaskOptions[i].value = 'S';
			}
		}
	}

	function showStatoICT() {
		location.replace('statoICT.htm?method=showAttoreRichieste');
	}
	
//  Risoluzione: MPORT00000024	
//  Questa funzione JS effettua un redirect ad una destinazione non piÃ¹ aggiornata (statoTLC.htm)
//  La funzione showStatoICT() effettua il corretto redirect.	
//	function showStatoTLC() {
//		location.replace('statoTLC.htm?method=showAttoreRichieste');
//	}

	function showWorklistICT() {
		location.replace('ict.htm?method=viewLista');
	}
	
	function showWorklistTLC() {
		location.replace('tlc.htm?method=viewListaTLC');
	}
	
	function stampa(invoker) {
		window.open("ict.htm?method=stampaRichiesta&stampaInvokerId=" + invoker,"Stampa","status=no,toolbar=no,width=1000,height=430,scrollbars=1"); 
	}
	function stampaTLC(invoker) {
		window.open("tlc.htm?method=stampaRichiesta&stampaInvokerId=" + invoker,"Stampa","status=no,toolbar=no,width=1000,height=430,scrollbars=1"); 
	}
	function stampaEDS(invoker) {
		window.open("ict.htm?method=stampaRichiestaEDS&stampaInvokerId=" + invoker,"Stampa","status=no,toolbar=no,width=1000,height=430,scrollbars=1"); 
	}
	
	//Evolutiva pulsante STAMPA Napoli 23 novembre 2011
	function stampaDettagliRichiesta(invoker, indiceRichiesta) {
		window.open("stampa.htm?method=stampaDettagliRichiesta&invokerId=" + invoker,"Stampa","status=no,toolbar=no,width=1000,height=430,scrollbars=1"); 
	}
	
	function mostraRiapertura(utenteId, invokerId) {
		//alert("ecc");
		if (document.all){
		document.getElementById('invokerId').value=invokerId;
		document.getElementById('invokerNr').innerHTML=invokerId;
		document.getElementById('utenteId').value=utenteId;
		document.getElementById('chiudiLink').style.visibility ='visible';
		document.getElementById('chiudiLinkSuccesso').style.visibility = 'hidden';
		document.getElementById('chiudiButton').style.visibility ='visible';
		document.getElementById('chiudiButtonSuccesso').style.visibility = 'hidden';
		document.getElementById('popUpButtonRiapertura').style.visibility = 'visible';
		document.getElementById('note').innerHTML="";
		mostraDiv('popUpR');
		}
	}	
	function inviaRiapertura(){
		document.getElementById('requestData').style.visibility = 'hidden';
		document.getElementById('popUpButtonRiapertura').style.visibility = 'hidden';
		document.getElementById('answerData').style.visibility = "visible";
		document.getElementById('answerData').innerHTML = "<i>Invio in corso ...</i>";
		document.getElementById('chiudiLink').style.visibility = 'hidden';
		document.getElementById('chiudiButton').style.visibility = 'hidden';
		document.body.style.cursor='wait';
		var myTextField = "";
		var myTextField2 = "";
		var myTextField3 = "";
		if (document.all){
			myTextField = document.getElementById('note');
			myTextField2 = document.getElementById('invokerId');
			myTextField3 = document.getElementById('utenteId');
			
		}
		
//		alert("stato richieste");
//		alert("You entered: Note = " + myTextField.value);
//		alert("You entered: Invoker ID = " + myTextField2.value);
//		alert("You entered: Utente ID = " + myTextField3.value);
		var action="/GestioneForzature/riapertura";
		var parametri="userId="+myTextField3.value+"&invokerId="+myTextField2.value+"&note="+encodeURIComponent(myTextField.value);
		
		var MyAjax = new Ajax.Request(
				action,
		              {      method: "post",
		                     parameters: parametri, 
							 onFailure: function (response) {
								alert('Attenzione,errore nel recupero delle informazioni su richiesta da completare!');
								alert('failure:' + response.responseText);
							 	document.body.style.cursor='default';
							 }, 
							 onSuccess: function (response) {
								 document.getElementById('requestData').style.visibility = 'hidden';
								 document.getElementById('answerData').innerHTML = '<b>Richiesta riaperta con successo</b>';
								 document.getElementById('chiudiLinkSuccesso').style.visibility = 'visible';
								 document.getElementById('chiudiButtonSuccesso').style.visibility = 'visible';
								 //alert("risposta ok");
								 document.body.style.cursor='default';
								
							}
		              }
		)
		 
	}
	String.prototype.trim = function () {
	    return this.replace(/^\s*/, "").replace(/\s*$/, "");
	}
	function chiudiDivRich(d) {
		document.getElementById(d).style.visibility = 'hidden';
		if (document.all) // Only do this for IE, hack from Niku
	    {
			var myButton = "R"+document.getElementById('invokerId').value;
			var myInnerHtml = "Stato-"+document.getElementById('invokerId').value;
			//alert('Inizio'+myTextField);
			var elements = document.getElementsByTagName('span');
			for (i=0; i<elements.length; i++){
				if(elements[i].className == myButton){
			    	//alert(elements[i].className);
					elements[i].style.visibility='hidden';
				}
				if(elements[i].className.trim() == myInnerHtml.trim()){
			    	//alert(elements[i].className);
					elements[i].innerHTML='RICHIESTA RIAPERTA';
				}
			}
			//alert('Fine');
		}
		document.getElementById('requestData').style.visibility = 'visible';
		document.getElementById('chiudiLink').style.visibility = 'visible';
		document.getElementById('chiudiButton').style.visibility = 'visible';
		document.getElementById('answerData').style.visibility = 'hidden';
	}
