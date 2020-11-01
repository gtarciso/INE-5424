// EPOS RISC V Initialization

#include <machine.h>

__BEGIN_SYS

void Machine::pre_init(System_Info * si)
{
    if(CPU::id() == 0)
        Display::init();

    db<Init>(WRN) << "Machine::pre_init()" << endl;

    db<Init, Machine>(TRC) << "Machine::pre_init()" << endl;
    TSC::Time_Stamp end = TSC::time_stamp();
    db<Init, Machine>(TRC) << "TIMESTAMP: " << end << endl;

    if(CPU::id() == 0) {
        if(Traits<IC>::enabled) {
            IC::init();

            // Wake up remaining CPUs
            // si->bm.n_cpus = Traits<Build>::CPUS;
            if(Traits<System>::multicore)
                smp_barrier_init(Traits<Build>::CPUS);
        }
    }
}

void Machine::init()
{
    db<Init, Machine>(TRC) << "Machine::init()" << endl;

    // IMPLEMENT to uncomment
    if(Traits<Timer>::enabled)
        Timer::init();
}

__END_SYS
