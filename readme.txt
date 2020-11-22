*Sugestão de implementação*
    Foi feita uma implementação do sistema multicore considerando que os harts tenham
    ids contíguos, apesar de que na ISA é sugerido que nem sempre pode ser assim, e que
    os ids podem assumir não sequenciais. Portanto a sugestão seria de guardar os ids dos
    harts em uma estrutura de dados.


Para cada teste há instruções individuais para visualizar a corretude de cada critério.

*Teste demonstrando a corretude na inicialização do Sistema Operacional multicore (e.g. 
 inicialização dos cores, uso de barreiras, configuração de métodos da cpu) atentando a 
 inicialização correta de todos os componentes de sistema - 3 pts. 

 Executar o comando `make APPLICATION=c1 run`
 Será imprimido na tela qual hart está rodando a Thread main, e depois é imprimido na tela uma
 sequencia de caracteres de acordo com as threads executando e após passarem a barreira.

 *Teste apresentando a corretude de operações atômicas - 2 pt;

 Executar o comando `make APPLICATION=c2 run`
 São criadas threads aonde serão feitas somas dentro de um lock e depois será feito um assert
 comparando o valor esperado com o valor final. O objetivo do lock é não deixar nenhuma thread
 sobreescrever o valor da variável global enquanto outra thread está alterando o valor dela.

 *Teste demonstrando a corretude na configuração de timers e tratamento de interrupções, 
 incluindo interrupções entre processadores (IPI) - 3 pts;

 Executar o comando `make APPLICATION=c3 run`
 Será imprimido o valor de mtimecmp de cara hart e após uma execução de um cálculo qualquer
 será impresso novamente o valor que deverá ser maior, assim demonstrando que cada timer
 de cada hart está funcionando corretamente.

 *Teste demonstrando o funcionamento do escalonador multicore global e preemptivo - 2 pts.

 Executar o comando `make APPLICATION=c4 run`
 Escalonador usado é uma adaptação do escalonador da entrega P2 (Shortest remaing time first)
 onde o mesmo foi especializado para suportar um sistema multicore.