dnl -------------------------------------------------------------
dnl exodus
dnl -------------------------------------------------------------
AC_DEFUN([CONFIGURE_EXODUS], 
[
  AC_ARG_ENABLE(exodus,
                AC_HELP_STRING([--enable-exodus],
                               [build with ExodusII API support]),
		[case "${enableval}" in
		  yes)  enableexodus=yes ;;
		   no)  enableexodus=no ;;
 		    *)  AC_MSG_ERROR(bad value ${enableval} for --enable-exodus) ;;
		 esac],
		 [enableexodus=yes])


		
  dnl The EXODUS API is distributed with libmesh, so we don't have to guess
  dnl where it might be installed...
  if (test $enableexodus = yes); then
     EXODUS_INCLUDE="-I\$(top_srcdir)/contrib/exodusii/Lib/include"
     AC_DEFINE(HAVE_EXODUS, 1, [Flag indicating whether the library will be compiled with Exodus support])
     AC_MSG_RESULT(<<< Configuring library with Exodus support >>>)
     have_exodus=yes
  else
     EXODUS_INCLUDE=""
     enableexodus=no
     have_exodus=no
  fi

  AC_SUBST(EXODUS_INCLUDE)
  AC_SUBST(enableexodus)
		 
  AM_CONDITIONAL(ENABLE_EXODUS, test x$enableexodus = xyes)
  AC_CONFIG_FILES([contrib/exodusii/Lib/Makefile])
])
