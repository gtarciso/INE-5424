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
        j = j*j;  // uma operacao para consumir clocks
    }
    return 0;
}

int main()
{
    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 3 - INÍCIO " << endl;
    cout << "----------------------------------" << endl;


    cout << "Context Switch" << endl;
    Thread * a_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);
    Thread * b_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    Thread * c_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    Thread * d_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(20000000)), &func, 2);
    Thread * e_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);
    Thread * f_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    Thread * g_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    Thread * h_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(20000000)), &func, 2);

    a_thread->join();
    cout << "Joining thread:" << a_thread <<endl;
    b_thread->join();
    cout << "Joining thread:" << b_thread <<endl;
    c_thread->join();
    cout << "Joining thread:" << c_thread <<endl;
    d_thread->join();
    cout << "Joining thread:" << d_thread <<endl;
    e_thread->join();
    cout << "Joining thread:" << e_thread <<endl;
    f_thread->join();
    cout << "Joining thread:" << f_thread <<endl;
    g_thread->join();
    cout << "Joining thread:" << g_thread <<endl;
    h_thread->join();
    cout << "Joining thread:" << h_thread <<endl;

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
    cout << "       TESTES CRITÉRIO 3 - FIM    " << endl;
    cout << "----------------------------------" << endl;

    return 0;
}