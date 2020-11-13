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
    add_timer(1);
    int j = 0;
    for (int i=0; i<100000; i++) {
        j = i;
    }
    cout << "Goodbye world!" << endl;

    Function_Handler h1(&func1);
    Function_Handler h2(&func2);
    Function_Handler h3(&func3);

    Alarm alarm_1(1000000, &h1, 20);
    Alarm alarm_2(2000000, &h2, 20);
    Alarm alarm_3(3000000, &h3, 20);

    Alarm::delay(2000000 * 23);

    cout << endl;

    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 1 - FIM    " << endl;
    cout << "----------------------------------" << endl;
    return 0;
}