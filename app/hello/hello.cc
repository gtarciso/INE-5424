#include <utility/ostream.h>
#include <process.h>

using namespace EPOS;


OStream cout;
char buffer[2];

int func(int n)
{
    for(int i = 0; i < 5000; i++){
        cout << n << " cpu id:" << CPU::id() << endl;
        Thread::yield();
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
    cout << "Computando coisas em:" << a_thread << endl;
    Thread * b_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func, 5);
    cout << "Computando coisas em:" << b_thread << endl;
    Thread * c_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func, 3);
    cout << "Computando coisas em:" << c_thread << endl;

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
    cout << "       TESTES CRITÉRIO 3 - FIM    " << endl;
    cout << "----------------------------------" << endl;

    return 0;
}