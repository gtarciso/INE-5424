#include <utility/ostream.h>

using namespace EPOS;

OStream cout;

int main()
{
    cout << "Hello world!" << endl;
    int j = 0;
    for (int i=0; i<10000000; i++) {
        j = i;
    }
    cout << "Goodbye world!" << endl;
    return 0;
}
