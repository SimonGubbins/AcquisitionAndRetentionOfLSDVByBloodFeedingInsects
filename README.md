# AcquisitionAndRetentionOfLSDVByBloodFeedingInsects

This folder contains the OpenBUGS and R scripts and raw and processed data files for the analyses
presented in Sanz-Bernardo et al. 2022 "The acquisition and retention of lumpy skin disease virus
by blood-feeding insects is influenced by the source of virus, the insect body part, and the time
since feeding" J. Virol. (in press) doi: 10.1128/jvi.00751-22

RAW DATA
--------

AnimalStudy.xlsx - Excel spreadsheet containing the data from the animal study. The data are in
                   the "Data" tab and the notes describing the data and how it is coded are in the
                   "Notes" tab

ExVivoStudy.xlsx - Excel spreadsheet containing the data from the ex vivo study. The data are in
                   the "Data" tab and the notes describing the data and how it is coded are in the
                   "Notes" tab


PROCESSED DATA
--------------

ProcessedInsectData_FourSpecies.txt - data for animal study in OpenBUGS list format; elements are:
                                      nObs - number of observations in data set
                                      nInsect - number of insects in data set
                                      nSpp - number of insect species in data set
                                      Y - data structure; columns are:
                                          1 - number identifying insect from which part taken
                                          2 - species (1-Ae. aegypyi, 2-Cx. quinquefasciatus, 3-C. nubeculosus,
                                              4-S. calcitrans)
                                          3 - body part (1-proboscis, 2-body)
                                          4 - source of LSDV (1-normal skin, 2-lesion, 3-viraemic blood)
                                          5 - log10 copy number in virus source
                                          6 - days post feeding when tested
                                          7 - status (0-negative, 1-positive)

ProcessedInsectData_ThreeSpecies.txt - data for animal study in OpenBUGS list format; elements are:
                                        nObs - number of observations in data set
                                        nInsect - number of insects in data set
                                        nSpp - number of insect species in data set
                                        Y - data structure; columns are:
                                            1 - number identifying insect from which part taken
                                            2 - species (1-Ae. aegypyi, 2-Cx. quinquefasciatus, 3-C. nubeculosus)
                                            3 - body part (1-proboscis, 2-head/thorax, 3-abdomen)
                                            4 - source of LSDV (1-normal skin, 2-lesion, 3-viraemic blood)
                                            5 - log10 copy number in virus source
                                            6 - days post feeding when tested
                                            7 - status (0-negative, 1-positive)

ProcessedExVivoData.txt - data for ex vivo experiment in OpenBUGS list format; elements are:
                          nObs - number of observations in data set
                          nInsect - number of insects in data set
                          Y - data structure; columns are:
                              1 - number identifying insect from which part taken
                              2 - body part (1-proboscis, 2-head/thorax, 3-abdomen)
                              3 - source of LSDV (1-lesion ex vivo, 2-blood, high titre, 3-blood, low titre)
                              4 - days post feeding when tested
                              5 - log10 copy number/part
                              6 - status (0-negative, 1-positive)

ProcessedExVivoDataForR.txt - data for ex vivo experiment in R format; columns are:
                              insectID - number identifying insect from which part taken
                              bodyPart - body part (1-proboscis, 2-head/thorax, 3-abdomen)
                              source - source of LSDV (1-lesion ex vivo, 2-blood, high titre)
                              dpf - days post feeding when tested
                              logCopies - log10 copy number/part

ProcessedAeAegyptiData.txt - combined data for Aedes aegypti from the animal and ex vivo experiments in
                             OpenBUGS list format; elements are:
                             nObs - number of observations in data set
                             Y - data structure; columns are:
                                 1 - number identifying insect from which part taken
                                 2 - body part (1-proboscis, 2-head/thorax, 3-abdomen)
                                 3 - source of LSDV (1-lesion ex vivo, 2-blood, high titre, 3-blood, low titre,
                                     4-normal skin on calf, 5-lesion on calf, 6-viraemic blood from calf)
                                 4 - days post feeding when tested
                                 5 - log10 copy number/part
                                 6 - status (0-negative, 1-positive)


OpenBUGS CODE
-------------

script_[num]Spp.txt - OpenBUGS script implementing model comparison for analysis 1 ([num]=Four)
                      or analysis 2 ([num]=Three)
model[n]_[num]Spp.txt - OpenBUGS code implementing model [n] (n=1-8, models in order presented in Table A.1)
                        for analysis 1 ([num]=Four) or analysis 2 ([num]=Three)

modelWithCopyNum_[num]Spp.txt - OpenBUGS code implementing the dose-response model for analysis 1 ([num]=Four)
                                or analysis 2 ([num]=Three)

model_ExVivo.txt - OpenBUGS code implementing analysis of ex vivo study or combined ex vivo and animal study
                   data for Ae. aegypti. The different models in Table A.2 are implemented by commenting and
                   uncommenting the appropriate lines specifying the model and priors.


R SCRIPTS
---------

analyseExVivo.R - R script implementing the linear model for levels of retained viral DNA and its dependence on
                  insect part, source of virus and days post feeding when tested

