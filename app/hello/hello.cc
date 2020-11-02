#include <utility/ostream.h>

using namespace EPOS;

OStream cout;


void add_timer(int n) {
	volatile unsigned int *mtimecmp = reinterpret_cast<unsigned int*>(0x2004000);
	volatile unsigned int *mtime = reinterpret_cast<unsigned int*>(0x200bff8);

	cout << "MTIMECMP: " << *mtimecmp << " MTIME: " << *mtime << endl;

	*mtimecmp = *mtime + (n*100);
}

int main()
{
    cout << "Hello world!" << endl;
    add_timer(1);
    int j = 0;
    for (int i=0; i<100000; i++) {
        j = i;
    }
    cout << "Goodbye world!" << endl;
    return 0;
}
