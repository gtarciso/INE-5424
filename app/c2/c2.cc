#include <utility/ostream.h>
#include <time.h>

using namespace EPOS;

OStream cout;


void print_timer() {
	volatile unsigned int *mtimecmp = reinterpret_cast<unsigned int*>(0x2004000);
	volatile unsigned int *mtime = reinterpret_cast<unsigned int*>(0x200bff8);

	cout << "MTIMECMP: " << *mtimecmp << endl;

}


int main()
{
    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 2 - INÍCIO " << endl;
    cout << "----------------------------------" << endl;

    cout << "Hello world!" << endl;
    print_timer();
    int j = 0;
    for (int i=0; i<100000; i++) {
        j = i;
    }
    cout << "Goodbye world!" << endl;

    print_timer();

    cout << "Como o valor de mtimecmp alterou, então temos o correto tratamento de interrupção" << endl;

    cout << "----------------------------------" << endl;
    cout << "       TESTES CRITÉRIO 2 - FIM    " << endl;
    cout << "----------------------------------" << endl;
    return 0;
}
