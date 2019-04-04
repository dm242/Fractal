#Uso sierpinsky.Lindenmayer()
sierpinsky.Lindenmayer <- function(){
	#Se carga libreria LindenmayeR en la ruta donde se encuentra instalada
	library("LindenmayeR", lib.loc="D:/R/R-3.4.3/library")
	#Se preparan las reglas L-System
	rSierp <- data.frame(inp = c("A", "B"), out = c("B-A-B", "A+B+A"), stringsAsFactors = FALSE)
	#Se indica que habrán 8 niveles en la generación del triangulo
	s <- Lsys(init = "A", rules = rSierp, n = 8)
	
	#Simbolos y acciones que realiza la tortuga 
	#"F" Move forward drawing as you go.
	#"f" Move forward w/o drawing.
	#"+" Turn by positive ang.
	#"-" Turn by negative ang.
	#"[" Save current position and heading.
	#"]" Restore saved position and heading (allows one to go back).
	dSierp <- data.frame(symbol = c("A", "B", "+", "-", "[", "]"),
	action = c("F", "F", "+", "-", "[", "]"), stringsAsFactors = FALSE)
	
	#Se pinta el triangulo con las siguientes condiciones: 
	#Cada paso mide 0.3
	#El angulo de rotación de la tortuga es 60°
	#La posición inicial de la tortuga es (12,20) y el ángulo inicial es 0°
	drawLsys(string = s, stepSize = 0.3, ang = 60, st = c(12, 20, 0), drules = dSierp)
	
	#Una leyenda con la posición del text centrado y abajo
	grid.text("Sierpinski Triangle (n = 8)", 0.5, 0.1)
}
