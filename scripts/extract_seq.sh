#!/bin/bash
 #mk subdirectories for projects
#Quiz 1
## mkdir exercise if you dont have it


mkdir exercise
cd  exercise

#  Quiz 2 create  subdirectories  to store various input  and analysis  output
mkdir dataset  result  analysis
# cd   into  result directory to create a file needed for  analysis process
cd result

touch "nucleotide_C_count.txt" "nucleotide_T_count.txt" "nucleotide_G_count.txt" "nucleotide_A_count.txt" "nucleotidecount.txt" "sequence_names.txt" "non_transcripts_count.txt" "non_mrna.txt" "predicted.txt" "predicted_count.txt" "mrna_transcripts.txt" "organism.txt" "mrna_transcript_count.txt"


## Download your .fa sequence files and move them to dataset directory
## https://drive.google.com/drive/folders/1w1WhQFbRYB9G72YXv8qq2s5Qp1ZREVwQ?usp=sharing
cd ../dataset


# Quiz  4
#Go to the directory containing downloaded fasta files
#Extract the headers  from both files using grep.You can use absolute or relative path
#to directory with .fa  files /with your sequence.


grep ">" *.fa | cat > /home/odongo/Desktop/exercise/result/sequence_names.txt

#QUIZ 6
# Extract squence that are mRNA  and discard non- mRNA sequences
grep ">" *.fa | grep "mRNA" | uniq | cat >/home/odongo/Desktop/exercise/result/mrna_transcripts.txt
#count mrna transcripts
grep ">" *.fa | grep "mRNA" |cut -d "," -f1 |cut -d ":" -f3| cut  -d "" -f12 |sort| uniq | wc -l| cat >  /home/odongo/Desktop/exercise/result/mrna_transcript_count.txt
##obtain non _mrna transcripts 
grep ">" *.fa | grep -v "mRNA" | cat > /home/odongo/Desktop/exercise/result/non_mrna.txt 

#Extract  predicted sequences and count them .Store count in predicted_count.txt and sequences in predicted.txt in your result directory
 grep "PREDICTED" *.fa | cat >  /home/odongo/Desktop/exercise/result/predicted.txt
#count predictedseq
 grep "PREDICTED" *.fa | wc -l|  cat >  /home/odongo/Desktop/exercise/result/predicted_count.txt


#Xtract non mrna trasncripts and store thme  in in non_trasscript folder located in  result folder
 grep ">" *.fa | grep -v "mRNA"| cat >  /home/odongo/Desktop/exercise/result/non_transcripts.txt
# count non mrna transcripts and store in  non_transcripts_count.txt
 grep ">" *.fa | grep -v "mRNA"| wc -l| cat >   /home/odongo/Desktop/exercise/result/non_transcripts_count.txt

#Quiz 7
# extract organism names from the sequences and remove none organisms
grep ">" *.fa | grep "mRNA" |cut -d "," -f1 |cut -d ":" -f3| cut  -d "" -f12 |sort| uniq | cat >  /home/odongo/Desktop/exercise/result/organism.txt

##counting nucleotide numbers
grep -v "nrf1" *.fa | tr -d '\n' | grep -o '[AGCTagct]' | wc -c > /home/odongo/Desktop/exercise/result/nucleotidecount.txt

#cd in result directory to visualize the sequence
##count nucleotide 
grep -v "nrf1" *.fa | tr -d '\n' | grep -o 'A' | wc -c > /home/odongo/Desktop/exercise/result/nucleotide_A_count.txt
grep -v "nrf1" *.fa | tr -d '\n' | grep -o 'G' | wc -c > /home/odongo/Desktop/exercise/result/nucleotide_G_count.txt
grep -v "nrf1" *.fa | tr -d '\n' | grep -o 'C' | wc -c > /home/odongo/Desktop/exercise/result/nucleotide_C_count.txt
grep -v "nrf1" *.fa | tr -d '\n' | grep -o 'T' | wc -c > /home/odongo/Desktop/exercise/result/nucleotide_T_count.txt


