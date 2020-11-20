#include <utility/ostream.h>
#include <process.h>
#include <time.h>

using namespace EPOS;

OStream cout;



void func1(int n)
{
    for(int i = 0; i < 40; i++) 
        cout << n << CPU::id();
    
}

void func2()
{
    for(int i = 0; i < 40; i++) 
        cout << CPU::id();
    
}

void func3()
{  
    for(int i = 0; i < 40; i++) 
        cout << '3'<< CPU::id();
    
}

void func(){

    Function_Handler h1(&func2);

    Alarm alarm_1(1000000, &h1, 20);

}

int main()
{
    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 3 - INÍCIO " << endl;
    cout << "----------------------------------" << endl;


    Thread * a_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func);
    Thread * b_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(50000000)), &func);
    Thread * c_thread = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(30000000)), &func);

    Alarm::delay(2000000 * 23);

    a_thread->join();
    cout << "Joining thread:" << a_thread <<endl;
    b_thread->join();
    cout << "Joining thread:" << b_thread <<endl;
    c_thread->join();
    cout << "Joining thread:" << c_thread <<endl;

    delete a_thread;
    delete b_thread;
    delete c_thread;

    cout << endl;

    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 3 - FIM    " << endl;
    cout << "----------------------------------" << endl;
    return 0;
}
