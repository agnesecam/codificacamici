//Mostra-chiudi BOX 
function gestoreApriBoxTecnica1() {
	try {
		if (nodoBoxTecn1.getAttribute("class") == "nascondi") {
			nodoBoxTecn1.removeAttribute("class");
            nodoBoxTecn1.setAttribute("class", "articoli_box");
            nodoDesc.removeAttribute("class");
            nodoDesc.setAttribute("class", "desc_manos_insieme");
            nodoMani.removeAttribute("class");
            nodoMani.setAttribute("class", "mani_insieme"); 
		} else {
			nodoBoxTecn1.removeAttribute("class");
            nodoBoxTecn1.setAttribute("class", "nascondi");
            nodoDesc.removeAttribute("class");
            nodoDesc.setAttribute("class", "desc_manos_senza");
            nodoMani.removeAttribute("class");
            nodoMani.setAttribute("class", "mani_senza");
		} 
	} catch(e) {
		alert("gestoreApriBoxTecnica1"+e);
    }
}

//Variabili
var nodoIconaTecnica1;
var nodoBoxTecn1;
var nodoTastoChiudiBox1;
var nodoDesc;
var nodoMani;

//Gestore load
function gestoreLoad(){
    try {
        nodoIconaTecnica1 = document.getElementById("icona_apertura_fileDesc");
        nodoIconaTecnica1.onclick = gestoreApriBoxTecnica1;
        nodoBoxTecn1 = document.getElementById("div_scomparsa");
        nodoDesc = document.getElementById("descrizione_manoscritto");
        nodoMani = document.getElementById("mani");
        nodoTastoChiudiBox1 = document.getElementById("icona_spegni");
        nodoTastoChiudiBox1.onclick = gestoreApriBoxTecnica1;

	} catch(e) {
		alert("gestoreLoad" + e); 
	}
}

window.onload = gestoreLoad;