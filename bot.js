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
�"�hdwebapp.sh �WmSW�~�q�!�n^��6�TlU*��VB�es7Y��fv7��t��E
3U������v
��+&��O�����y!Y-���f�{��{�y��{���zhBVCT��	�HC��"�`ȤSf�l�������s�Ly����*H�K�:�iؿ?T�$�&���3|���j�%9\=-�j0s�P1�w����}��?��/��GFO���m'y�l�-��A�� ��8�OʸsY5LAQ�^��_2�A|Ч'5�lX��֣G��le��ʕ�K�W�˅����Ż�����ۃ����֓�ᤡ�`]�f��(N/��v�Vǯ_�.��5�P\xa��+-�@�43F4J�f*;�tH2DAOS�+�	/i:��"�b
�-��V�.���[(�=tB���/���Vk�q��2���V�=�,?�]\�lݜ�<�ֺ�|����+���Y�~/l.T6�W��Tp��7�1D����;/ȇ�C#����<qPv��{z�k������A[��� ϛ��~�xoͺ�R�r��Ny�U��U;�̠��QZ��6�嫥���m�:��6
�ʈ�=�?�q��m�<r����B1�+��� d�3!�^L	����Y;�q��<� F�����^j�U���DL���j�W�T6�4�b5�m<|cL�%�dH�"���E���(�p�CL	fBK�:��ǉ�C�Dʪ�)#��ύOhf{G��ZV5#�q{� �Jp)���������pp���b���;���Cz{ksX���h�g��\�mƚ~���KO�[�Hi$D�Ƭ5�fm�)�Y	��s�kF��*�����\�	ZX��-n�p�z�[ %�Aֵ{Ⱥ< �z;d���h��.h:���y]ϥ{��t{����\�� ����ull��I��T���#��L�� Â�[���k>	��@Ә�&Io̹V ���
Ŵ"aBjt��	̬�R����R�)5���d��S�`G�˩1��"�&^�X͌�U=n�:c:�=��ۯ\t���x㕏�曾iKh�-�즺`�q��r��vaa��;rԓ�vOk7����}'N��yAB�Y�]����]ShD8��Fl���S�d��cv]jms.��bɃFlt_t,����(���,c*6"Ωϲ��O�s�ȩv�gĂ�N�Ǣ��`g�#�Gb��B��q���� ��K�B�-q�F��i��oT�5x��D��r�����d$dM�)/j�$'=��yF�$������3z � ��!Um;��g�}��0���_��E�����	��.��t�,&v��o�7�G�p
z�o���\�d�]����<�����]=GG0V]?̣Y@ͪ���k�Yk��W���֓�5�X�J�7K��CcqbRetM� {|U�z�?=��Vت@ܳvƶ��-!!�3��"��K�N�%EΧ��`�YJ�M&�xմ�ͩ��a�W)!����  