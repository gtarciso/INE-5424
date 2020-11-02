#include <utility/ostream.h>

using namespace EPOS;

OStream cout;


void add_timer(int n) {
	volatile unsigned int *mtimecmp = reinterpret_cast<unsigned int*>(0x02004000);
	volatile unsigned int *mtime = reinterpret_cast<unsigned int*>(0x0200bff8);

	cout << "MTIMECMP: " << *mtimecmp << " MTIME: " << *mtime << endl;

	*mtimecmp = *mtime + (n * 100);
}

int main()
{
    cout << "Hello world!" << endl;
    add_timer(1);
    cout << "Goodbye world!" << endl;
    return 0;
}
