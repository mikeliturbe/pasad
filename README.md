# PASAD
## Process-Aware Stealthy Attack Detector

This repository contains the necessary code and data files to reproduce
the findings from the paper titled "*Truth Will Out: Departure-Based 
Process-Level Detection of Stealthy Attacks on Control Systems*" published in ACM CCS 2018.

This repository contains both the data and code to reproduce the figures
from Sections 4.1, 4.2, 4.4 and 4.5 in the paper, relating to the
detection of damage attacks, stealthy attacks, and other experiments such
as setting the alarm threshold. The model-based implementation is not included
here, but it was performed using [ar](https://github.com/RhysU/ar).

### Data

This repository contains the captures obtained from the
Tennessee-Eastman challenge process, by using
[DVCP-TE](https://github.com/satejnik/DVCP-TE) that were
used in the paper. However, this repository does not contain the data
from the SWaT testbed plant used in Section 4.3 (as the dataset is
already available and we do not have redistribution rights) nor the data
from the real water distribution plant from Section 4.6, due to the
confidentiality of the process.

In the Data directory, each subdirectory contains the data used for the
validation in the aforementioned sections.

### Code

The `pasad.m` file in the Matlab code directory contains the Matlab code
to reproduce the figures from the aforementioned sections of the paper.
`Data_creator.m` uses the DVCP-TE model to create the data used in the
scenarios. Be aware that, as the DVCP-TE model is randomized, the created data
from the script might slightly vary from the actual data contained in
the data directory.

The `pasad_param.pdf` file shows the parameters that are needed to run
with PASAD to reproduce the figures in the paper. The different
parameters are explained in Section II of the paper. Apart from these
used parameters, this file also contains the Sensor signal that was
plotted. The number of the sensor is the same as the index of the data column in the
CSV files from the data directory. For instance, `XMEAS(5)` readings are
in the fifth column of the CSV files.

In the case of the SWaT data, the Sensor column shows the analyzed
sensor signal of the Testbed. As for the "Run no." number column, it
shows the observation numbers of the `SWaT_Dataset_Attack_v0.xlsx` file
from the dataset that were used for the experiment. That variable has no
effect in the rest of the rows.

### Using the repository
The code and data contained in this repository is free to
download, execute, modify and share for research and other
non-commercial purposes. Published works using the code and/or data
from this repository should cite the following paper:

Wissam Aoudi, Mikel Iturbe, and Magnus Almgren. "Truth Will Out:
Departure-Based Process-Level Detection of Stealthy Attacks on Control
Systems". ACM CCS 2018.
