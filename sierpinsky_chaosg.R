#Uso sierpinsky.chaosg(cantidadPuntos,color=TRUE|FALSE)
sierpinsky.chaosg <- function(iteraciones,color){

	# Sierpinsky gasked, Chaos game -algorithm:
	X11(width=6,height=6)#ventana de 6X6 pulgadas
	plot(0,0,xlim=c(0,1),ylim=c(0,1), col="white") #plano cartesiano con x de 0 a 1 e y de 0 a 1
	
	#vertices del triangulo
	A=c(0,0)
	B=c(1,0)
	C=c(0.5,0.8)

	#coordenada interior del triangulo inicial
	D=sample(0:1000,2)/1000
	#Distintos colores para los puntos
	colores = c('blue','red','green','white','yellow','violet','orange')
	for(i in 1:iteraciones){
		Corner=sample(1:3,1) #se genera esquina aleatoria
		if(Corner==1){
			CornerS=A
		}
		if(Corner==2){
			CornerS=B
		}
		if(Corner==3){
			CornerS=C
		}
		#punto medio entre el punto actual y la esquina del triangulo selecionada
		D=(D+CornerS)/2
		#Se pinta el punto negro o de algun color
		if(color == TRUE){
			colorNum=sample(1:7,1)
			points(D[1],D[2],pch=".",cex=1, col=colores[colorNum])
		}else{
			points(D[1],D[2],pch=".",cex=1)
		}
	}
}