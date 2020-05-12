# LCD_Controlador
## Explicación 
Se realizó con VHDL un controlador para un display LCD. Teniendo una inicialización y un modo libre, en donde se podrían enviar tanto instrucciones como datos. Para esto se realizó una máquina de estados (cinco estados). La inicialización constaba de cuatro pasos, los cuales eran los siguentes:
  1. Display Clear
  1. Function Set
  1. Display on/off control
  1. Entry mode set

Cada instrucción se le asigno un estado dentro de la máquina de estados, cuando se pasaba por los 4, se entra al quinto estado, el cual es el estado *libre*, en el cual el usuario puede mandar tanto instrucciones como datos. 

## Modo de Input y Output
Absolutamente todo el input se realiza por un texto con título *input_test.txt* y el output se genera en un texto de nombre *output_test.txt*

## Prueba Final 
Se realizó la prueba final corriendo el código con el [input](https://github.com/Miguelelizondov/LCD_Controlador/blob/master/input_test.txt), esto generó el [output](https://github.com/Miguelelizondov/LCD_Controlador/blob/master/output_test.txt), al poner esto dentro del [simulador](https://www.bobtech.ro/tutoriale/componente-electronice/57-lcd-16x2-simulator), se generó lo siguiente: 

### Simulador
![Simulador_Miguel](/Proyecto_2parcial_avanzados.PNG)
