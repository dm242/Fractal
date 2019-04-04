import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from random import randint

fig, ax = plt.subplots()
ax = plt.axes(xlim=(0, 1), ylim=(0, np.sqrt(3)/2))

# Se define una nube puntos vacia, donde el cada punto
# tendra valor s=1 de diametro de color negro
scatterplot = plt.scatter([],[],s=1,color = 'black',marker='.')
data = []
curr_point = [0,0]

# Vertices del triangulo
v1 = [0,0]
v2 = [1,0]
v3 = [.5,np.sqrt(3)/2]

# Calcula punto medio entre 2 puntos
def midpoint(point1, point2):
    return [(point1[0] + point2[0])/2, (point1[1] + point2[1])/2]

# Funcion de inicializacion de la animacion
def init():
    scatterplot.set_offsets([[], []])
    return [scatterplot]

# Funcion de animacion que se llama secuencialmente.
# Calcula en punto medio entre el punto actual y
# uno de los vertices del triangulo y se pinta en la
# nube de puntos
def animate(i):
    global curr_point, v1, v2, v3, data
    val = randint(0,2)
    if val == 0:
        curr_point = midpoint(curr_point, v1)
    if val == 1:
        curr_point = midpoint(curr_point, v2)
    if val == 2:
        curr_point = midpoint(curr_point, v3)
    
    data.append((curr_point[0],curr_point[1]))
    scatterplot.set_offsets(data)
    return [scatterplot]
    
anim = animation.FuncAnimation(fig, animate, init_func=init, frames=30, interval=1, blit=True)
plt.show()