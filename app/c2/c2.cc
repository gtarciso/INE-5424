#include <utility/ostream.h>
#include <process.h>
#include <synchronizer.h>

#define TOTAL 45000

using namespace EPOS;


OStream cout;
char buffer[2];
Mutex control;

int count;

int func(int n)
{
    for(int i = 0; i < 5000; i++){
        control.lock();
        cout << "computando no hart: " << CPU::id() << endl;
        count += n;
        control.unlock();
    }
    return 0;
}

int main()
{
    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 2 - INÍCIO " << endl;
    cout << "----------------------------------" << endl;

    count = 0;

    cout << "Somatorio multicore" << endl;
    Thread * a_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);
    cout << "Computando coisas em:" << a_thread << endl;
    Thread * b_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    cout << "Computando coisas em:" << b_thread << endl;
    Thread * c_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    cout << "Computando coisas em:" << c_thread << endl;

    cout << "verificando se a contagem foi correta" << endl;
    assert(count == TOTAL);

    a_thread->join();
    cout << "Joining thread:" << a_thread <<endl;
    b_thread->join();
    cout << "Joining thread:" << b_thread <<endl;
    c_thread->join();
    cout << "Joining thread:" << c_thread <<endl;

    cout << "The end!" << endl;

    delete a_thread;
    delete b_thread;
    delete c_thread;

    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 2 - FIM    " << endl;
    cout << "----------------------------------" << endl;

    return 0;
}