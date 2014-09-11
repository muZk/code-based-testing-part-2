# Feature list

incorporar aliens como luchadores (contenders)

weapon
	uniq name - if exists? then return the existing one when creating

robots
	start with default health - defined somewhere else (code_name)

Health 
	starts with current equal to maximum if unset

"habilidades especiales" de los robots 
	regenerarse
	crear nuevas armas
	regenerar las armas
	economizar municiones (problema de la mochila knap-sack - recalcular en cada turno)
	psico-mode (gamble - half_the_damage a cambio de x% de ganar)
	probabilidad de fallar el ataque
	double-attack 
	pace-attack-mode (each contender has its own attack-pace, the attack accordingly in a event-based-simulation)

efectos secundarios de armas
	freeze (frozen 1 to 2 attack turns - does not attack then unfreezes)
	burn  (takes extra damage each turn)
	rust - decay (takes extra damage accumulatively)
	batery (start skipping turns as the batery goes down until total freeze)

condiciones especiales de armas
	implica cierto "nivel" de las armas para ser utilizadas


encuentro de n contra m 

simulación de varios combates consecutivos

vistas
	probar vistas anidadas
	formulario anidado - asignar o crear una nueva serie

factories ?? - 
	

servicio web externo para inicializar
	robots
	armas

mover el health managemente de robot y robot_weapon a un módulo en un concern


-- hacer un cambio grande sobre la repartición de código
y que siga funcionando... 

