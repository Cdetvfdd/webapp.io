#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��8Rdstart.sh �X�SW���1���&[������J��M���Mw7�t���Vf����Җ�p�>��3�<>�_蹻��y���C۝�r���=��MB�Ѕ	Y�:	�����X�W��{�Ç�̍���.޻�_��/?�n~Q��tki��=Yʯ~o=��
֥����Y�N�����K_�nݜ-�>�^�,�MC�4�FX���L��$�)����$���E6�$��/�(ϝ+�pU(-=pDo�-����֕G��(Қ[�u�Zz|�0wκz���[��#h�/<[(_�����i��w����ɡ����ײo�p�#��p��z�H������@eq|�o��!<���h���l6{��w���R��Nd����� ��q8n�!}u�������t�PѠ8�N��&�#&$2���g�"�gL������ײ�-�+�N=CSE4�a�����1{���gpĕ�#��~��u�W3��̈j�H!""��)QO�H��x&m;�k�.��_�-��)-�;��8�y�((���p�9g��JI�X��,4~#�Q��Y����,Q�U��������!�%��*n�p'.���������#��m�n��W��	1���_�V��d]\(���TZ|Y�c���4"5��R\��VnZ��3�ٕKU�q���Q *�j������5�+\�	f���(lBA0SiA�"&�j�;'et��A�q����at�dJ���l=�j�L��1�N�׵9 i�j�:0��-�褠f0f�ݛ��� �&�v�HIьi	�H®]�7�ϵ4�h�*�2')I������1�IZF5�=�������لN�m�#2	>6���S��k��mu�r�"�驮��N��`S�{��ݹ¯�֕�(�0���6�
�^�|ÚY�Vno-�<��><��#����\�aR���6nX��a�W&���.�"���f�a#gݎ�����Ď�W�a���7��i�Մ�fםӽq�t7qN�k�Ä��s\߰D4X&:Z�����-���{XWӴ���P�)�~��PO���T�8�U�Jje�J�y��)~�)���#m)�������a���O��@G9�� �Μ�>�c����A��_�yp�+j�?���2�P뺶e=�X�	�>���(�J��#\�m���7�DR�㰒P�g��;`�6�]����ݳ�i�W�)9��b��X��zWu���`�J�����7��=�È��a*�[B�f��.I����L�"��Fdtkx,��Y.��a7]�̉#�]+�Ч>g=��lg�|F��tD����ю\$�$|�]�Q��aY�E� qY��9�:٧S
��BU|!.h,A��&�T7X�5$����DBX�Y�1�&�JR3���@ ��$�}��hO$*��Me��d���"9�36���r�nT���^>�+�{?jR�lE4q�a���Ȯ����-�J@M���,��zm
�1W'�q{}�b���1HQ%�6Kh��%��&�Y|��$�x�"Ԕ���t�u�*�yY�_ɯ=.�_�m#��V���o�e�AH�$�qlv��vo��c\�sQIR7�|g�6�v�bwj�K�3�ا�.�;��5���N�$  