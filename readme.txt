Foi feito um teste demonstrando a corretude da implementação do PRSTF.

*Teste apresentando a corretude na execução da política de escalonamento particionado

    `make APPLICATION=c1 run`
    Apartir dos prints é possível ver que cada thread é direcionada a seu core, e que
    por sua vez está relacionado com apenas uma queue. Existe uma verificação que testa 
    se a thread muda de queue, e não deve imprimir nada se estiver correto.

    Para vereficar a correta atribuição de cada queue a cada core, pode-se ligar o trace
    nos traits no programa (c1_traits.h). O endereço é formatado como 'Memory@Queue'
