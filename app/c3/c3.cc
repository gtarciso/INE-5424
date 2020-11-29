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
    for(int i = 0; i < 5000000; i++){
        int j = i+i;
        if (id != CPU::id()){
            cout << "deu ruim :c";
        }
        Thread::yield();
    }
    return 0;
}

int main()
{
    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 3 - INÍCIO " << endl;
    cout << "----------------------------------" << endl;

    volatile unsigned int *mtimecmp0 = reinterpret_cast<unsigned int*>(0x2004000); //endereco d mtimecmp
    volatile unsigned int *mtimecmp1 = reinterpret_cast<unsigned int*>(0x2004000 | 1 << 3);
    volatile unsigned int *mtimecmp2 = reinterpret_cast<unsigned int*>(0x2004000 | 2 << 3);
    volatile unsigned int *mtimecmp3 = reinterpret_cast<unsigned int*>(0x2004000 | 3 << 3);

    // cout << "mtimecmp hart 0: " << *mtimecmp0 << endl;
    // cout << "mtimecmp hart 1: " << *mtimecmp1 << endl;
    // cout << "mtimecmp hart 2: " << *mtimecmp2 << endl;
    // cout << "mtimecmp hart 3: " << *mtimecmp3 << endl;
    
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

    // cout << a_thread->_link.rank().queue() << endl;
    
    // cout << "mtimecmp devem ser maiores depois de computarem coisas: " << endl;

    // mtimecmp0 = reinterpret_cast<unsigned int*>(0x2004000); //endereco d mtimecmp
    // mtimecmp1 = reinterpret_cast<unsigned int*>(0x2004000 | 1 << 3);//deslocamento de 8 pois é 64 bits
    // mtimecmp2 = reinterpret_cast<unsigned int*>(0x2004000 | 2 << 3);
    // mtimecmp3 = reinterpret_cast<unsigned int*>(0x2004000 | 3 << 3);
    
    // cout << "mtimecmp hart 0: " << *mtimecmp0 << endl;
    // cout << "mtimecmp hart 1: " << *mtimecmp1 << endl;
    // cout << "mtimecmp hart 2: " << *mtimecmp2 << endl;
    // cout << "mtimecmp hart 3: " << *mtimecmp3 << endl;

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
    cout << "       TESTES CRITÉRIO 3 - FIM    " << endl;
    cout << "----------------------------------" << endl;
    return 0;
}
