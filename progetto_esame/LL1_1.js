//Mostra-chiudi informazioni
function gestoreApriInformazioni() {
	try {
		if (nodoBoxInformazioni.getAttribute("class") == "nascondi") {
			nodoBoxInformazioni.removeAttribute("class");
            nodoBoxInformazioni.setAttribute("class", "articoli_box");
            nodoDesc.removeAttribute("class");
            nodoDesc.setAttribute("class", "desc_manos_insieme");
            nodoMani.removeAttribute("class");
            nodoMani.setAttribute("class", "mani_insieme"); 
		} else {
			nodoBoxInformazioni.removeAttribute("class");
            nodoBoxInformazioni.setAttribute("class", "nascondi");
            nodoDesc.removeAttribute("class");
            nodoDesc.setAttribute("class", "desc_manos_senza");
            nodoMani.removeAttribute("class");
            nodoMani.setAttribute("class", "mani_senza");
		} 
	} catch(e) {
		alert("gestoreApriInformazioni"+e);
    }
}


//Mostra-chiudi Contenuto del fronte della lettera
function gestoreApriFronte() {
	try {
		if (nodoBoxFronte.getAttribute("class") == "nascondi") {
			nodoBoxFronte.removeAttribute("class");
            nodoBoxFronte.setAttribute("class", "contenuto_front");
            nodoTitoloFront.removeAttribute("class");
            nodoTitoloFront.setAttribute("class", "titolo_front_insieme");
            nodoIconaBoxFronte.removeAttribute("class", "ruota");
		} else {
			nodoBoxFronte.removeAttribute("class");
            nodoBoxFronte.setAttribute("class", "nascondi");
            nodoTitoloFront.removeAttribute("class");
            nodoTitoloFront.setAttribute("class", "titolo_front_senza");
            nodoIconaBoxFronte.setAttribute("class", "ruota"); 
		} 
	} catch(e) {
		alert("gestoreApriFronte"+e);
    }
}


//Seleziona immagine1
function gestoreSelezionaScan1() {
	try {
        nodoScan1.removeAttribute("class");
        nodoScan1.setAttribute("class", "immagini_lettera");
        nodoScan2.removeAttribute("class");
        nodoScan2.setAttribute("class", "nascondi");
        nodoScan3.removeAttribute("class");
        nodoScan3.setAttribute("class", "nascondi");
        nodoScan4.removeAttribute("class");
        nodoScan4.setAttribute("class", "nascondi");	
    } catch(e) {
		alert("gestoreSelezionaScan1"+e);
    }
}
//Seleziona immagine2
function gestoreSelezionaScan2() {
	try {
        nodoScan2.removeAttribute("class");
        nodoScan2.setAttribute("class", "immagini_lettera");
        nodoScan1.removeAttribute("class");
        nodoScan1.setAttribute("class", "nascondi");
        nodoScan3.removeAttribute("class");
        nodoScan3.setAttribute("class", "nascondi");
        nodoScan4.removeAttribute("class");
        nodoScan4.setAttribute("class", "nascondi");	
    } catch(e) {
		alert("gestoreSelezionaScan2"+e);
    }
}
//Seleziona immagine3
function gestoreSelezionaScan3() {
	try {
        nodoScan3.removeAttribute("class");
        nodoScan3.setAttribute("class", "immagini_lettera");
        nodoScan2.removeAttribute("class");
        nodoScan2.setAttribute("class", "nascondi");
        nodoScan1.removeAttribute("class");
        nodoScan1.setAttribute("class", "nascondi");
        nodoScan4.removeAttribute("class");
        nodoScan4.setAttribute("class", "nascondi");	
    } catch(e) {
		alert("gestoreSelezionaScan3"+e);
    }
}
//Seleziona immagine1
function gestoreSelezionaScan4() {
	try {
        nodoScan4.removeAttribute("class");
        nodoScan4.setAttribute("class", "immagini_lettera");
        nodoScan2.removeAttribute("class");
        nodoScan2.setAttribute("class", "nascondi");
        nodoScan3.removeAttribute("class");
        nodoScan3.setAttribute("class", "nascondi");
        nodoScan1.removeAttribute("class");
        nodoScan1.setAttribute("class", "nascondi");	
    } catch(e) {
		alert("gestoreSelezionaScan4"+e);
    }
} 


//Evidenzia riga
function gestoreEvidenzia(name){  
    try {
        for (var i = 0; i <= 125; i++){
            document.getElementsByTagName('a').item([i]).className='nascondi';
        }
        if (name == 'ID#LL1.1_line_fr-01' ) {
            document.getElementsByName(name).item(0).className='freccia_sopra';
        } else {
            document.getElementsByName(name).item(0).className='dot';
        }
        setTimeout(reloadFunction, 4000);
    } catch(e) {
        alert("gestoreEvidenzia()"+e);   
    }                                     
}
/* 
Una volta cambiate le classi agli elementi non di interesse, 
facendo scomparire il puntino che precede le righe della lettera, 
ma anche tutti i collegamenti "a href='...' nella pagina, 
ricarico la pagina per riportare i simboli "i" e "♪" delle note
altrimenti non sarebbero più visibili 
*/
function reloadFunction(){                  
    document.location.reload(true);
}


/*Apri fronte ed evidenzia, per #ID#LL1.1_hotspot_fr-04 
(perché è nel front, che può anche non essere visibile ed aperto in quel momento, 
e in questo caso non verrebbe mostrata la riga evidenziata)*/ 
//Apri fronte ed evidenzia
function gestoreApriFronte_Evidenzia() {
    try {
		if (nodoBoxFronte.getAttribute("class") == "nascondi") {
			nodoBoxFronte.removeAttribute("class");
            nodoBoxFronte.setAttribute("class", "contenuto_front");
            nodoTitoloFront.removeAttribute("class");
            nodoTitoloFront.setAttribute("class", "titolo_front_insieme");
            nodoIconaBoxFronte.removeAttribute("class", "ruota");
        } 
        for (var i = 0; i <= 125; i++){
            document.getElementsByTagName('a').item([i]).className='nascondi';
        }
        document.getElementById("titolo_front").scrollIntoView();
        document.getElementById("info_dest").className='dot_perCatania';
    } catch(e) {
        alert("gestoreApriFronte"+e);
    }
}


//Variabili
var nodoIconaTecnica1;
var nodoBoxInformazioni;
var nodoTastoChiudiBox1;
var nodoDesc;
var nodoMani;

var nodoBoxFronte;
var nodoTitoloFront;
var nodoIconaBoxFronte;

var nodoTasto1;
var nodoTasto2;
var nodoTasto3;
var nodoTasto4;
var nodoScan1;
var nodoScan2;
var nodoScan3;
var nodoScan4; 
var nodoScanCatania;

//Gestore load
function gestoreLoad(){
    try {
        nodoIconaTecnica1 = document.getElementById("icona_apertura_fileDesc");
        nodoIconaTecnica1.onclick = gestoreApriInformazioni;
        nodoBoxInformazioni = document.getElementById("div_scomparsa");
        nodoDesc = document.getElementById("descrizione_manoscritto");
        nodoMani = document.getElementById("mani");
        nodoTastoChiudiBox1 = document.getElementById("icona_spegni");
        nodoTastoChiudiBox1.onclick = gestoreApriInformazioni;

        nodoIconaBoxFronte = document.getElementById("icona_apertura_front");
        nodoIconaBoxFronte.onclick = gestoreApriFronte;
        nodoBoxFronte = document.getElementById("contenuto_front");
        nodoTitoloFront = document.getElementById("titolo_front"); 

        nodoTasto1 = document.getElementById("icona_1");
        nodoTasto2 = document.getElementById("icona_2");
        nodoTasto3 = document.getElementById("icona_3");
        nodoTasto4 = document.getElementById("icona_4");
        nodoTasto1.onclick = gestoreSelezionaScan1;
        nodoTasto2.onclick = gestoreSelezionaScan2;
        nodoTasto3.onclick = gestoreSelezionaScan3;
        nodoTasto4.onclick = gestoreSelezionaScan4; 
        nodoScan1 = document.getElementById("imglettera1");
        nodoScan2 = document.getElementById("imglettera2");
        nodoScan3 = document.getElementById("imglettera3");
        nodoScan4 = document.getElementById("imglettera4");
        nodoScan2.setAttribute("class", "nascondi");
        nodoScan3.setAttribute("class", "nascondi");
        nodoScan4.setAttribute("class", "nascondi");

        nodoScanCatania = document.getElementById("LL1.1_hotspot_fr-04");
        nodoScanCatania.onclick = gestoreApriFronte_Evidenzia;  //per gli altri elementi del facsimile .onClick è nell'HTML

	} catch(e) {
		alert("gestoreLoad" + e); 
	}
}

window.onload = gestoreLoad;