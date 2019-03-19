function dessiner() {
  var canevas = document.getElementById('canevas');
  if (canevas.getContext) {
    var ctx = canevas.getContext('2d');

    ctx.beginPath();
    ctx.font = "20px Georgia";
    ctx.moveTo(20, 20);
    ctx.fillText("A",0,20);
    ctx.lineTo(20, 130);
    ctx.fillText("D",0,150);
    ctx.lineTo(130, 130);
    ctx.fillText("C",135,150);
    ctx.lineTo(130, 20);
    ctx.fillText("B",135,20);
    ctx.lineTo(20, 20);
    ctx.stroke();
  }
}

function annimation(){
    var canevas = document.getElementById('canevas2');
    if (canevas.getContext) {
      var ctx = canevas.getContext('2d');
      ctx.globalCompositeOperation = 'destination-over';
      ctx.clearRect(0,0,300,300); // effacer le canvas

      ctx.beginPath();
      ctx.font = "20px Georgia";
      ctx.moveTo(20, 20);
      ctx.fillText("A",0,20);
      ctx.lineTo(20, 130);
      ctx.fillText("D",0,150);
      ctx.lineTo(130, 130);
      ctx.fillText("C",135,150);
      ctx.lineTo(130, 20);
      ctx.fillText("B",135,20);
      ctx.lineTo(20, 20);
      ctx.stroke();
      
      var elem = document.getElementById("myAnimation");
      elem.style.visibility = "visible";
      elem.style.top = 108+'px';
      elem.style.left = 15+'px';
      var indice = 0;
      var id = setInterval(frame, 1000);
      var tabX = [135,25,25,25,135,135]
      var tabY = [25,25,135,25,25,135]
      var tabDés = [2,6,3,5,4,3]
      function frame() {
        if (indice == tabX.length) {
          clearInterval(id);
          ctx.clearRect(50, 55, 50, 50);
          ctx.fillText("Victoire !",38,75);
        } else {
          ctx.clearRect(50, 55, 50, 50);
          ctx.fillText(tabDés[indice],70,75);
          elem.style.top = tabY[indice]+49+35 + 'px'; 
          elem.style.left = tabX[indice]-10 + 'px'; 
          indice++;
        }
        
      }
      }
  }
  
 function moyenne(hashmap){
    //calcul la moyenne de coups par partie
    var output = document.getElementById("moy");
    hashmap = hashmap.split(";");
    for(var i = 0;i<hashmap.length;i++){
        hashmap[i] = hashmap[i].split(",");
    }

    var nbPartieTotal = 0;
    var nbCoupsTotal = 0;
    for (i=0;i<hashmap.length-1;i++){
        nbPartieTotal += parseInt(hashmap[i][1]);
        nbCoupsTotal += parseInt(hashmap[i][0])*parseInt(hashmap[i][1]);
        
    }
    var moyenne = parseInt(nbCoupsTotal)/parseInt(nbPartieTotal);    
    output.value = moyenne;
 }
 
 function ecart_type(hashmap){
    var output = document.getElementById("et");
    
    //calcul la moyenne de coups par partie
    hashmap = hashmap.split(";");
    for(var i = 0;i<hashmap.length;i++){
        hashmap[i] = hashmap[i].split(",");
    }

    var nbPartieTotal = 0;
    var nbCoupsTotal = 0;
    for (i=0;i<hashmap.length-1;i++){
        nbPartieTotal += parseInt(hashmap[i][1]);
        nbCoupsTotal += parseInt(hashmap[i][0])*parseInt(hashmap[i][1]);
        
    }
    var moyenne = parseInt(nbCoupsTotal)/parseInt(nbPartieTotal);
    
    console.log(moyenne);
    //calcul de la liste de coups
    var list = new Array();
    
    for (i=0;i<hashmap.length-1;i++){
        for (var y = 0;y<hashmap[i][1];y++){
            list.push(hashmap[i][0]);
        }
    }
    console.log(list);
    
    //calcul de l'ecart type
    var som = 0;
    var ecartType = 0;
    
    for (y = 0;y<nbPartieTotal;y++){
        som += Math.pow(list[y]-moyenne, 2);  
    }
    
    ecartType = Math.sqrt((1/nbPartieTotal)*som);
    console.log(ecartType);
    
    output.value = ecartType;
 }
 
 
 function show_bar(hashmap){
	//calcul la moyenne de coups par partie
        console.log(hashmap);

        hashmap = hashmap.split(";");
        console.log(hashmap);

        for(var i = 0;i<hashmap.length;i++){
            hashmap[i] = hashmap[i].split(",");
        }
	console.log(hashmap);
        
        var listNbPartie = Array();
        var listNbCoups = Array();
        for(var i = 0;i<hashmap.length;i++){
            listNbPartie.push(hashmap[i][1]);
            listNbCoups.push(hashmap[i][0]);
        }
        console.log(listNbPartie);
        console.log(listNbCoups);
	
	var ctxB = document.getElementById("barChart").getContext('2d');
	
	if (typeof myBarChart !== 'undefined'){
		resetCHart(myBarChart);
	}
	
	myBarChart = new Chart(ctxB, {
	type: 'bar',
	data: {
	  labels: listNbCoups,
	  datasets: [{
		label: '# Coups par partie',
		data: listNbPartie,
		backgroundColor: [
		  'rgba(255, 99, 132, 0.2)',
		  'rgba(54, 162, 235, 0.2)',
		  'rgba(255, 206, 86, 0.2)',
		  'rgba(75, 192, 192, 0.2)',
		  'rgba(153, 102, 255, 0.2)',
		  'rgba(255, 159, 64, 0.2)'
		],
		borderColor: [
		  'rgba(255,99,132,1)',
		  'rgba(54, 162, 235, 1)',
		  'rgba(255, 206, 86, 1)',
		  'rgba(75, 192, 192, 1)',
		  'rgba(153, 102, 255, 1)',
		  'rgba(255, 159, 64, 1)'
		],
		borderWidth: 1
	  }]
	},
	options: {
	  scales: {
		yAxes: [{
		  ticks: {
			beginAtZero: true
		  }
		}]
	  }
	}
	});
	
	
}
  


