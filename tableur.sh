#!/bin/sh

i=0
file_in="Null"
file_out="Null"
sep_col="\t"
sep_lig="
"
sep_lig_ret=0
sep_col_ret=0
inverse=0

est_col_ret=0
est_lig_ret=0

while [ $# -ne 0 ]
do
	case "$1" in 
		"-in")
			shift
			file_in="$1"
			shift
			;;
		"-out")
			shift
			file_out="$1"
			shift
			;;
		"-scin")
			shift
			sep_col="$1"
			shift
			;;

		"-slin")
			shift
			sep_lig="$1"
			shift
			;;
		"-scout")
			shift
			est_col_ret=1
			sep_col_ret="$1"
			shift
			;;
		"-slout")
			shift
			est_lig_ret=1
			sep_lig_ret="$1"
			shift
			;;
		"-inverse")
			inverse=1
			;;
		*)
			echo "$1 indéfini ou ne trouve pas de correspondance."
			shift
			;;
		esac

		# Si les options -slout et -scout ne sont pas spécifiés alors ils sont 
		# identiques au séparateur de lignes/colonnes
		if [ $est_lig_ret -eq 0 ]; then sep_lig_ret="$sep_lig"; fi
		if [ $est_col_ret -eq 0 ]; then sep_col_ret="$sep_col"; fi
done

echo "calcul dans la feuille stockée dans le fichier $file_in où le spérateur de colonnes est $sep_col, le séparteur del igne est $sep_lig. La feuille calculée sera affiché sur $file_out avec comme séparateur de colonne le symbole $sep_col_ret"


