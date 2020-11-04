Para cada teste há instruções individuais para visualizar a corretude de cada critério.

*Teste demonstrando a corretude na inicialização e configuração do(s) Timer(s),
 incluindo handler com eoi e configuração de alarmes - 4 pts.

 Executar o comando `make APPLICATION=c1 run`
 Será imprimido na tela os valores inicializados, e depois é imprimido na tela uma
 sequencia de caracteres de acordo com os alarmes setados para cada função.

 *Teste apresentando a corretude no tratamento de interrupções - 3 pts;

 Executar o comando `make APPLICATION=c2 run`
 Será imprimido na tela o valor do registrador mtimecmp, depois é feita uma execução
 arbitrária para que o timer seja incrementado, e depois é imprimido na tela o valor
 de mtimecmp novamente.

 *Teste demonstrando o funcionamento do escalonador com preempção por Timer, com 
 possibilidade de configuração do tempo necessário para preempção - 3 pts.

 Executar o comando `make APPLICATION=c3 run`
 O teste busca atestar o funcionamento do escalonador Shortest Remaining Time First.
 Para o teste, são feitas 3 threads com tempos diferentes, onde as threads que imprimem
 1 e 3 brigam pelo processador, enquanto a thread que imprime 5 fica em por último.