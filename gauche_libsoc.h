/*
 * gauche_libsoc.h
 */

/* Prologue */
#ifndef GAUCHE_GAUCHE_LIBSOC_H
#define GAUCHE_GAUCHE_LIBSOC_H

#include <gauche.h>
#include <gauche/extend.h>
#include <gauche/class.h>
#include <libsoc_gpio.h>

SCM_DECL_BEGIN

typedef struct ScmSocGpioRec {
  SCM_HEADER;
  gpio *gpio;
} ScmSocGpio;


/* Epilogue */
SCM_DECL_END

#endif  /* GAUCHE_GAUCHE_LIBSOC_H */
