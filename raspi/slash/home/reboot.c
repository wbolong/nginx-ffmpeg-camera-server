#include <unistd.h>
#include <sys/reboot.h>

int main(int argc, char *argv[]) {
    sync();
    reboot(RB_AUTOBOOT);
    return(0);
}

