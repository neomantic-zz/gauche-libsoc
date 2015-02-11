#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])

AC_INIT([gauche-libsoc], [0.0.1], [calbers@neomantic.com])
AM_INIT_AUTOMAKE([1.9 foreign])

AC_CONFIG_MACRO_DIR([m4])

# Checks for programs.
AC_PROG_CC

AC_PATH_PROG([GOSH], gosh)
AC_PATH_PROG([GAUCHE_CONFIG], gauche-config)
AC_PATH_PROG([GAUCHE_PACKAGE], gauche-package)
AC_PATH_PROG([GAUCHE_INSTALL], gauche-install)
AC_PATH_PROG([GAUCHE_CESCONV], gauche-cesconv)

# Checks for libraries.
PKG_CHECK_MODULES([LIBSOC],[libsoc])

SOEXT=`"$GAUCHE_CONFIG" --so-suffix`
OBJEXT=`"$GAUCHE_CONFIG" --object-suffix`
EXEEXT=`"$GAUCHE_CONFIG" --executable-suffix`
AC_SUBST(SOEXT)
AC_SUBST(OBJEXT)
AC_SUBST(EXEEXT)

ac_default_prefix=`$GAUCHE_CONFIG --prefix`

GAUCHE_PACKAGE_CONFIGURE_ARGS="`echo ""$ac_configure_args"" | sed 's/[\\""\`\$]/\\\&/g'`"
AC_MSG_NOTICE([creating ${PACKAGE_NAME}.gpd])
"$GAUCHE_PACKAGE" make-gpd "$PACKAGE_NAME" \
  -version "$PACKAGE_VERSION" \
  -configure "./configure $GAUCHE_PACKAGE_CONFIGURE_ARGS"

echo $PACKAGE_VERSION > VERSION

AC_CONFIG_FILES([Makefile])

LT_INIT

AC_OUTPUT
