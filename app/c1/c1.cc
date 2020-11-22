#include <utility/ostream.h>
#include <process.h>

using namespace EPOS;


OStream cout;
char buffer[2];

int func(int n)
{
    bool enable_0 = true;
    bool enable_1 = true;
    bool enable_2 = true;
    bool enable_3 = true;
    for(;;)
    {
        int j = 5;
        if (CPU::id() == 0 && enable_0)
        {
            cout << "0 ";
            enable_0 = false;
            CPU::smp_barrier();
            return 0;
        }
        if (CPU::id() == 1 && enable_1)
        {
            cout << "1 ";
            enable_1 = false;
            CPU::smp_barrier();
            return 0;
        }
        if (CPU::id() == 2 && enable_2)
        {
            cout << "2 ";
            enable_2 = false;
            CPU::smp_barrier();
            return 0;
        }
        if (CPU::id() == 3 && enable_3)
        {
            cout << "3 ";
            enable_3 = false;
            CPU::smp_barrier();
            return 0;
        }
        j = j*j; // uma operacao para consumir clocks
        Thread::yield();
    }
    return 0;
}

int main()
{
    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 1 - INÍCIO " << endl;
    cout << "----------------------------------" << endl;

    cout << "Teste verificando a corretude da inicialização" << endl;

    cout << "Thread main rodando no Hart: " << CPU::id() << endl;

    cout << "As próximas threads irão rodar um loop e será printado o ID dos harts" << endl;
    cout << "Assim é possível notar que todos os harts estão computando algo" << endl;
    cout << "Como todos IDs foram printados duas vezes, é possivel ver que a barreira esta funcionando" << endl;

    Thread * a_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);
    Thread * b_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    Thread * c_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    Thread * d_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(20000000)), &func, 2);
    Thread * e_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);
    Thread * f_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    Thread * g_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    Thread * h_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(20000000)), &func, 2);

    cout << endl;
    a_thread->join();
    b_thread->join();
    c_thread->join();
    d_thread->join();
    e_thread->join();
    f_thread->join();
    g_thread->join();
    h_thread->join();

    cout << "The end!" << endl;

    delete a_thread;
    delete b_thread;
    delete c_thread;
    delete d_thread;
    delete e_thread;
    delete f_thread;
    delete g_thread;
    delete h_thread;

    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 1 - FIM    " << endl;
    cout << "----------------------------------" << endl;

    return 0;
}