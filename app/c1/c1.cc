#include <utility/ostream.h>
#include <process.h>
#include <system/memory_map.h>
#include <machine/ic.h>

using namespace EPOS;

OStream cout;

int func(int n)
{
    int id = CPU::id();
    cout << "CPU rodando: " << id << endl;
    for(int i = 0; i < 1000; i++){
        int j = i+i;
        if (id != CPU::id()){
            cout << "Error: changed queue"; //caso seja imprimido isso, a thread trocou de cpu
        }
    }
    return 0;
}

int main()
{
    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 1 - INÍCIO " << endl;
    cout << "----------------------------------" << endl;

    Thread * a_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);
    Thread * b_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    Thread * c_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    Thread * d_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(20000000)), &func, 2);
    Thread * e_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);
    Thread * f_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    Thread * g_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    Thread * h_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(20000000)), &func, 2);

    a_thread->join();
    b_thread->join();
    c_thread->join();
    d_thread->join();
    e_thread->join();
    f_thread->join();
    g_thread->join();
    h_thread->join();

    delete a_thread;
    delete b_thread;
    delete c_thread;
    delete d_thread;
    delete e_thread;
    delete f_thread;
    delete g_thread;
    delete h_thread;

    cout << endl;

    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 1 - FIM    " << endl;
    cout << "----------------------------------" << endl;
    return 0;
}
