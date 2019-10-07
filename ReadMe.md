Tensor networks for quantum simulations
=======================================

C code using CBLAS and LAPACKE; Mathematica reference implementation for testing.

Features:
- common operations on tensors of arbitrary dimension
- MPS and MPO structures
- built-in support for quantum numbers (U(1) symmetries)
- construction of common Hamiltonians (Ising, Heisenberg, Fermi-Hubbard, Bose-Hubbard) in 1D, by even-odd splitting or as MPO representation; MPO representation from arbitrary operator chain description
- imaginary and real-time evolution using even-odd splitting
- time-dynamical correlation functions and OTOCs at finite temperature
- one-site and two-site local energy minimization using Lanczos iteration
- preliminary support for PEPS

Directory structure:
- mathematica:  standalone Mathematica reference implementation, with the core routines in the `tn_base.m` package
- include, src: source code of the C implementation
- test:         unit tests for the C implementation, using the Mathematica version as reference
- doc:          documentation of the C code (generated by Doxygen)
- analysis:     simulation analysis notebooks, as illustration

The Mathematica notebooks can be opened by the free [CDF player](https://www.wolfram.com/cdf-player).


License
-------
Copyright (c) 2013-2019, Christian B. Mendl  
All rights reserved.  
http://christian.mendl.net

This program is free software; you can redistribute it and/or
modify it under the terms of the Simplified BSD License
http://www.opensource.org/licenses/bsd-license.php


References
----------
1. U. Schollwöck  
   The density-matrix renormalization group in the age of matrix product states  
   Ann. Phys. 326, 96-192 (2011) [arXiv:1008.3477](http://arxiv.org/abs/1008.3477), [DOI](http://dx.doi.org/10.1016/j.aop.2010.09.012)
2. T. Barthel  
   Precise evaluation of thermal response functions by optimized density matrix renormalization group schemes  
   New J. Phys. 15, 073010 (2013) [arXiv:1301.2246](http://arxiv.org/abs/1301.2246), [DOI](http://dx.doi.org/10.1088/1367-2630/15/7/073010)
3. F. Verstraete, V. Murg, J. I. Cirac  
   Matrix product states, projected entangled pair states, and variational renormalization group methods for quantum spin systems  
   Adv. Phys. 57, 143-224 (2008) [arXiv:0907.2796](http://arxiv.org/abs/0907.2796), [DOI](http://dx.doi.org/10.1080/14789940801912366)
