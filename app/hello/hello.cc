#include <utility/ostream.h>
#include <time.h>
#include <architecture/cpu.h>

using namespace EPOS;

OStream cout;


void add_timer(int n) {
	volatile unsigned int *mtimecmp = reinterpret_cast<unsigned int*>(0x2004000);
	volatile unsigned int *mtime = reinterpret_cast<unsigned int*>(0x200bff8);

	cout << "MTIMECMP: " << *mtimecmp << " MTIME: " << *mtime << endl;

	*mtimecmp = *mtime + (n*100);
}

void func1()
{
    for(int i = 0; i < 39; i++) 
        cout << '1';
    cout << CPU::id() << endl;
}

void func2()
{
    for(int i = 0; i < 39; i++) 
        cout << '2';
    cout << CPU::id() << endl;
}

void func3()
{  
    for(int i = 0; i < 39; i++) 
        cout << '3';
    cout << CPU::id() << endl;
}

int main()
{
    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 1 - INÍCIO " << endl;
    cout << "----------------------------------" << endl;

    cout << "Hello world!" << endl;
    

    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 1 - FIM    " << endl;
    cout << "----------------------------------" << endl;
    return 0;
}