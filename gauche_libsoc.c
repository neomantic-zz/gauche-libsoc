/*
 * gauche_libsoc.c
 */

#include "gauche_libsoc.h"

/*
 * Module initialization function.
 */
extern void Scm_Init_gauche_libsoclib(ScmModule*);

void Scm_Init_gauche_libsoc(void)
{
    ScmModule *mod;

    /* Register this DSO to Gauche */
    SCM_INIT_EXTENSION(gauche_libsoc);

    /* Create the module if it doesn't exist yet. */
    mod = SCM_MODULE(SCM_FIND_MODULE("ext.libsoc", TRUE));

    /* Register stub-generated procedures */
    Scm_Init_gauche_libsoclib(mod);
}
