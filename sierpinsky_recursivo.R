#Uso sierpinsky.recursivo(grado del fractal, color TRUE o FALSE)
sierpinsky.recursivo <- function(grado,color){
	 #Coordenadas del triangulo base
	 x = c(-100, 0, 100)
	 y = c(-50, 100, -50)
	 #se genera plano cartesiano
	 plot(x, y, type = "n")
	 #Se llama al proceso recursivo
	 sierpinsky.proceso(x,y,grado,color)
}

sierpinsky.proceso <- function(x,y,grado,color){
	#Colores a utilizar en la version a color (TRUE|FALSE)
	colores = c('blue','red','green','white','yellow','violet','orange')
	if(color == TRUE){
		polygon(x, y, col = colores[grado], border = NA)#triangulo a color
	} else {
		polygon(x, y) #triangulo blanco y negro
	}
	
	#condicion de finalizacion de recursividad
	if(grado > 0){
		#triangulo inferior izquierdo
		sierpinsky.proceso(c(x[1],(x[1]+x[2])/2,(x[1]+x[3])/2),
		                   c(y[1],(y[1]+y[2])/2,(y[1]+y[3])/2),
                           grado-1,color)
		#triangulo superior				   
        sierpinsky.proceso(c(x[2],(x[1]+x[2])/2,(x[2]+x[3])/2),
						   c(y[2],(y[1]+y[2])/2,(y[2]+y[3])/2),
                           grado-1,color)
        #triangulo inferior derecho
		sierpinsky.proceso(c(x[3],(x[3]+x[2])/2,(x[1]+x[3])/2),
						   c(y[3],(y[3]+y[2])/2,(y[1]+y[3])/2),
						   grado-1,color)
	}
}