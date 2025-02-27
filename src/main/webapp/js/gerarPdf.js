	

function imprimir() { 
	
   const conteudo = document.getElementById('content').innerHTML;
   
 
   let estilo = "<style>"
   estilo += "table {width: 90%; font:15px Calibri; }"
   estilo += "table, th, td {border: solid 2px #888; border-collapse: collapse;"
   estilo += "padding: 4px 8px; text-align: center; }"
    estilo += "h2 { font:39px Calibri; text-align: center; margin: 2px;}"
    estilo += "h5 { font:23px Calibri; text-align: left}"
    estilo += ".form-control { width: 80%; text-align: left}"
   estilo += "</style>";

   const win = window.open ('', '', 'height = 700, width = 750')
  

   win.document.write('<html><head>')
   win.document.write('<title> Lista de Ramais </title>')
   win.document.write(estilo)
   win.document.write('</head><body><h2>Lista de Ramais</h2><br>')
   win.document.write(conteudo)
   win.document.write('</body></html>')
   win.print()
   win.close()
 
}

