var xPos_inicio = 80;
var xPos_servicos = 80;
var xPos_produtos = 80;
var xPos_portifolio = 80;
var xPos_orcamento = 80;
var xPos_eventos = 80;
var xPos_contato = 80;
var intervalo_inicio = 0;
var intervalo_servicos = 0;
var intervalo_produtos = 0;
var intervalo_portifolio = 0;
var intervalo_orcamento = 0;
var intervalo_eventos = 0;
var intervalo_contato = 0;
var start = 0;
var end = 0;
var step = 0;
var obj;
var inter = 0;
var opcao_anterior;
var saiu = false;
var browser = navigator.appName;


function efeitoin(div){
	playSound("mouse_over");
	eval('xPos_' + div + ' = 80;');
	objeto = document.getElementById("menu_" + div);
	objeto.style.backgroundRepeat = "no-repeat";
	objeto.style.backgroundImage = "url('imagens/fundo_botao_menu.gif')";
	eval('objeto.style.backgroundPosition =  xPos_' + div + ' + " 0px"');
	eval("intervalo_" + div + ' = setInterval("move(\'"+ div + "\')", 30)');
}
function efeitoout(div){
	if(saiu){
		clearInterval(eval('intervalo_'+div));
		objeto = document.getElementById("menu_" + div);
		objeto.style.backgroundImage = "";
		img = document.getElementById("img_" + div);
		img.width = 0;
		img.height = 0;
		if(opcao_anterior != div) objeto.style.color = "#999999";
	}
	saiu = true;
}
function move(div){
	objeto = document.getElementById("menu_" + div);
	eval('xPos_' + div + ' = xPos_' + div + '- 10;');
	eval('objeto.style.backgroundPosition =  xPos_' + div + '+" 0px";');
	
	img = document.getElementById("img_" + div);
	img.width = eval('xPos_' + div)/10;
	img.height = eval('xPos_' + div)/10;
	
	if(eval('xPos_' + div) <= 0){
		clearInterval(eval('intervalo_'+div));
		eval('xPos_' + div + ' = 0;');
		eval('intervalo_'+div+'=0;');
		img.width = 10;
		img.height = 10;
		if(opcao_anterior != div) objeto.style.color = "#FFFFFF";
	}
}
function playSound(som) {
	if(navigator.appName == "Microsoft Internet Explorer"){
		document.getElementById(som+"_swf").style.display = "block";
		document.getElementById(som).Play();
	}
}
function abertura(){
	document.getElementById("img_loading").style.display = "none";
	document.getElementById("loading").style.display = "none";
	start = 878;
	end = 248;
	step = -30;
	obj = document.getElementById("iframe_border");
	obj.style.left = start + "px";
	playSound("zum");
	inter = setInterval("entra_frame_border()", 20);
}

function entra_frame_border(){
	start = start + step;
	obj.style.left = start + "px";
	if(start <= end){
		clearInterval(inter);
		obj.style.left = end;
		inter = 0;
		
		// Logo
		start = -176;
		end = 35;
		step = 20;
		obj = document.getElementById("logo");
		obj.style.left = start + "px";
		playSound("zum");
		inter = setInterval("entra_logo()", 20);
	}
}

function entra_logo(){
	start = start + step;
	obj.style.left = start + "px";
	if(start >= end){
		clearInterval(inter);
		obj.style.left = end + "px";
		inter = 0;
		
		// Topo
		start = 878;
		end = 351;
		step = -30;
		obj = document.getElementById("topo");
		obj.style.left = start + "px";
		playSound("zum");
		inter = setInterval("entra_topo()", 20);
	}
}

function entra_topo(){
	start = start + step;
	obj.style.left = start + "px";
	if(start <= end){
		clearInterval(inter);
		obj.style.left = end + "px";
		inter = 0;
		
		// menu
		start = 878;
		end = 250;
		step = -30;
		obj = document.getElementById("menu");
		obj.style.left = start + "px";
		playSound("zum");
		inter = setInterval("entra_menu()", 20);
	}
}

function entra_menu(){
	start = start + step;
	obj.style.left = start + "px";
	if(start <= end){
		clearInterval(inter);
		obj.style.left = end + "px";
		inter = 0;
		
		// Noiva
		start = -334;
		end = 0;
		step = 20;
		obj = document.getElementById("noiva");
		obj.style.left = start + "px";
		playSound("zum");
		inter = setInterval("entra_noiva()", 20);
	}
}

function entra_noiva(){
	start = start + step;
	obj.style.left = start + "px";
	if(start >= end){
		playSound("zum");
		clearInterval(inter);
		obj.style.left = end + "px";
		inter = 0;
		
		//copy
		obj = document.getElementById("copy");
		obj.style.display = "block";
		
		if(browser == "Microsoft Internet Explorer"){
			//div_iframe
			obj = document.getElementById("div_iframe");
			obj.style.visibility = "hidden";
			obj.style.display = "block";
			
			fadein(obj);
		}
		else {
			obj = document.getElementById("div_iframe");
			obj.style.visibility = "visible";
			obj.style.display = "block";
			obj.style.zIndex = "800";
		}
	}
}
function fadein(oDiv) {
	oDiv.style.filter="blendTrans(duration=2)";
	// Make sure the filter is not playing.
	if (oDiv.filters.blendTrans.status != 2) {
		oDiv.filters.blendTrans.apply();
		oDiv.style.visibility="visible";
		oDiv.filters.blendTrans.play();
	}
}
function ir(pagina, opcao_menu){
	saiu = false;
	objeto_anterior = document.getElementById("menu_" + opcao_anterior);
	if(opcao_anterior != null){
		objeto_anterior.style.color = "#999999";
	}
	opcao_anterior = opcao_menu;
	objeto = document.getElementById("menu_" + opcao_menu);
	objeto.style.backgroundImage = "";
	objeto.style.color = "#000000";
	img = document.getElementById("img_" + opcao_menu);
	img.width = 0;
	img.height = 0;
	playSound("click");
	navegacao.location = pagina;
}