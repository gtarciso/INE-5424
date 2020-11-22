#include <utility/ostream.h>
#include <process.h>

using namespace EPOS;


OStream cout;
char buffer[2];

int func(int n)
{
    for(int i = 0; i < 5; i++){
        cout << n;
        Thread::yield();
    }
    return 0;
}

int main()
{
    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 4 - INÍCIO " << endl;
    cout << "----------------------------------" << endl;


    cout << "Creating Threads" << endl; //Threads vao printar suas prioridades que deveriam estar (aprox.) em ordem
    Thread * a_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);
    Thread * b_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);
    Thread * c_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);
    Thread * d_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);

    Thread * e_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    Thread * f_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    Thread * g_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    Thread * h_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    
    Thread * i_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    Thread * j_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    Thread * k_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    Thread * l_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    
    a_thread->join();    
    b_thread->join();
    c_thread->join();
    d_thread->join();

    e_thread->join();
    f_thread->join();
    g_thread->join();
    h_thread->join();

    i_thread->join();
    j_thread->join();
    k_thread->join();
    l_thread->join();

    cout << endl << "The end!" << endl;

    delete a_thread;
    delete b_thread;
    delete c_thread;
    delete d_thread;

    delete e_thread;
    delete f_thread;
    delete g_thread;
    delete h_thread;

    delete i_thread;
    delete j_thread;
    delete k_thread;
    delete l_thread;

    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 4 - FIM    " << endl;
    cout << "----------------------------------" << endl;

    return 0;
}