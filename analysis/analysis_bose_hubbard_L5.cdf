(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 10.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[    132012,       3208]
NotebookOptionsPosition[    129171,       3092]
NotebookOutlinePosition[    129514,       3107]
CellTagsIndexPosition[    129471,       3104]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Bose-Hubbard model simulation", "Section"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{"<<", "../mathematica/tn_base.m"}]], "Input"],

Cell[CellGroupData[{

Cell["General definitions", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SparseIdentityMatrix", "[", "d_", "]"}], ":=", 
  RowBox[{"SparseArray", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{"i_", ",", "i_"}], "}"}], "\[Rule]", "1"}], ",", 
    RowBox[{"{", 
     RowBox[{"d", ",", "d"}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SiteCreateOp", "[", "M_", "]"}], ":=", 
  RowBox[{"DiagonalMatrix", "[", 
   RowBox[{
    RowBox[{"Sqrt", "[", 
     RowBox[{"Range", "[", 
      RowBox[{"1", ",", "M"}], "]"}], "]"}], ",", 
    RowBox[{"-", "1"}]}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"SiteAnnihilOp", "[", "M_", "]"}], ":=", 
  RowBox[{"DiagonalMatrix", "[", 
   RowBox[{
    RowBox[{"Sqrt", "[", 
     RowBox[{"Range", "[", 
      RowBox[{"1", ",", "M"}], "]"}], "]"}], ",", "1"}], "]"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"NumberOp", "[", "M_", "]"}], ":=", 
  RowBox[{"DiagonalMatrix", "[", 
   RowBox[{"Range", "[", 
    RowBox[{"0", ",", "M"}], "]"}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Z", "[", 
   RowBox[{"H_", ",", "\[Beta]_"}], "]"}], ":=", 
  SuperscriptBox[
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", 
        FractionBox["\[Beta]", "2"]}], "H"}], "]"}], ",", 
     "\"\<Frobenius\>\""}], "]"}], "2"]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"construct", " ", "Bose"}], "-", 
    RowBox[{
    "Hamiltonian", " ", "with", " ", "open", " ", "boundary", " ", 
     "conditions"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"HBoseHubbard", "[", 
     RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_", ",", "1"}], "]"}], ":=", 
    RowBox[{
     RowBox[{
      FractionBox["U", "2"], 
      RowBox[{
       RowBox[{"NumberOp", "[", "M", "]"}], ".", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"NumberOp", "[", "M", "]"}], "-", 
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}]}], "-", 
     RowBox[{"\[Mu]", " ", 
      RowBox[{"NumberOp", "[", "M", "]"}]}]}]}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"HBoseHubbard", "[", 
     RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_", ",", "L_"}], "]"}], ":=", 
    RowBox[{
     RowBox[{
      RowBox[{"-", "t"}], " ", 
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"l", "-", "1"}]], "]"}], ",", 
           RowBox[{"SiteCreateOp", "[", "M", "]"}], ",", 
           RowBox[{"SiteAnnihilOp", "[", "M", "]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"L", "-", "l", "-", "1"}]], "]"}]}], "]"}], "+", 
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"l", "-", "1"}]], "]"}], ",", 
           RowBox[{"SiteAnnihilOp", "[", "M", "]"}], ",", 
           RowBox[{"SiteCreateOp", "[", "M", "]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"L", "-", "l", "-", "1"}]], "]"}]}], "]"}]}], ",", 
        RowBox[{"{", 
         RowBox[{"l", ",", "1", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "+", 
     RowBox[{"Sum", "[", 
      RowBox[{
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"SparseIdentityMatrix", "[", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"M", "+", "1"}], ")"}], 
           RowBox[{"l", "-", "1"}]], "]"}], ",", 
         RowBox[{
          RowBox[{
           FractionBox["U", "2"], 
           RowBox[{
            RowBox[{"NumberOp", "[", "M", "]"}], ".", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"NumberOp", "[", "M", "]"}], "-", 
              RowBox[{"IdentityMatrix", "[", 
               RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}]}], "-", 
          RowBox[{"\[Mu]", " ", 
           RowBox[{"NumberOp", "[", "M", "]"}]}]}], ",", 
         RowBox[{"SparseIdentityMatrix", "[", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"M", "+", "1"}], ")"}], 
           RowBox[{"L", "-", "l"}]], "]"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"l", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Simulation parameters", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"kinetic", " ", "hopping", " ", "parameter"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["tH", "val"], "=", "1"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"interaction", " ", "strength"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["U", "val"], "=", "5"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"chemical", " ", "potential"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Mu]", "val"], "=", 
    FractionBox["1", "7"]}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "5"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "single", " ", "site", " ", "occupation", " ", "number", " ", "cut"}], 
    "-", "off"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["M", "val"], "=", "2"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"inverse", " ", "temperature"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Beta]", "val"], "=", 
    RowBox[{"3", "/", "5"}]}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["t", "list"], "=", 
   RowBox[{"Range", "[", 
    RowBox[{"0", ",", "5", ",", 
     RowBox[{"1", "/", "4"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Length", "[", "%", "]"}]}], "Input"],

Cell[BoxData["21"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[{
 "Compare MPO representation of ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Beta]"}], " ", 
     RowBox[{"H", "/", "2"}]}]], TraditionalForm]]],
 " with reference calculation"
}], "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "local", " ", "Hamiltonian", " ", "terms", " ", "acting", " ", "on", " ", 
    "neighboring", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"h2", "[", 
    RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"bd", "=", 
        RowBox[{"SiteCreateOp", "[", "M", "]"}]}], ",", 
       RowBox[{"b", "=", 
        RowBox[{"SiteAnnihilOp", "[", "M", "]"}]}], ",", 
       RowBox[{"S", "=", 
        RowBox[{
         RowBox[{
          FractionBox["U", "2"], 
          RowBox[{
           RowBox[{"NumberOp", "[", "M", "]"}], ".", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"NumberOp", "[", "M", "]"}], "-", 
             RowBox[{"IdentityMatrix", "[", 
              RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}]}], "-", 
         RowBox[{"\[Mu]", " ", 
          RowBox[{"NumberOp", "[", "M", "]"}]}]}]}], ",", "SI", ",", "IS"}], 
      "}"}], ",", 
     RowBox[{
      RowBox[{"SI", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{"S", ",", 
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"M", "+", "1"}], "]"}]}], "]"}]}], ";", 
      RowBox[{"IS", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"M", "+", "1"}], "]"}], ",", "S"}], "]"}]}], ";", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{
         RowBox[{
          RowBox[{"-", "t"}], 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{"bd", ",", "b"}], "]"}], "+", 
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{"b", ",", "bd"}], "]"}]}], ")"}]}], "+", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"j", "\[Equal]", "1"}], ",", 
           RowBox[{"SI", "+", 
            RowBox[{
             FractionBox["1", "2"], "IS"}]}], ",", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{"j", "<", 
              RowBox[{"L", "-", "1"}]}], ",", 
             RowBox[{
              FractionBox["1", "2"], 
              RowBox[{"(", 
               RowBox[{"SI", "+", "IS"}], ")"}]}], ",", 
             RowBox[{
              RowBox[{
               FractionBox["1", "2"], "SI"}], "+", "IS"}]}], "]"}]}], "]"}]}],
         ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}]}], "]"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
      RowBox[{"M", "=", "2"}], ",", 
      RowBox[{"L", "=", "5"}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{"Flatten", "[", 
      RowBox[{"FullSimplify", "[", 
       RowBox[{
        RowBox[{"Sum", "[", 
         RowBox[{
          RowBox[{"KroneckerProduct", "[", 
           RowBox[{
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"M", "+", "1"}], ")"}], 
              RowBox[{"l", "-", "1"}]], "]"}], ",", 
            RowBox[{
             RowBox[{"h2", "[", 
              RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], 
              "]"}], "\[LeftDoubleBracket]", "l", "\[RightDoubleBracket]"}], 
            ",", 
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"M", "+", "1"}], ")"}], 
              RowBox[{"L", "-", "l", "-", "1"}]], "]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"l", ",", "1", ",", 
            RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
        RowBox[{"HBoseHubbard", "[", 
         RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}]}], 
       "]"}], "]"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"MPO", " ", "representing", " ", "identity", " ", "operation"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"IdMPO", "[", 
    RowBox[{"M_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"ArrayReshape", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"M", "+", "1"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"M", "+", "1"}], ",", 
           RowBox[{"M", "+", "1"}], ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
       RowBox[{"{", "0", "}"}], ",", 
       RowBox[{"{", "0", "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", "L"}], "}"}]}], "]"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "compute", " ", "reference", " ", "MPO", " ", "representation", " ", "of", 
    " ", 
    FormBox[
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "\[Beta]"}], " ", 
       RowBox[{"H", "/", "2"}]}]],
     TraditionalForm]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"qd", "=", 
         RowBox[{"Range", "[", 
          RowBox[{"0", ",", 
           SubscriptBox["M", "val"]}], "]"}]}], ",", 
        RowBox[{"M", "=", 
         SubscriptBox["M", "val"]}], ",", 
        RowBox[{"L", "=", 
         SubscriptBox["L", "val"]}], ",", 
        RowBox[{"\[CapitalDelta]\[Tau]", "=", 
         FractionBox["1", "40"]}], ",", 
        RowBox[{"\[Beta]", "=", 
         SubscriptBox["\[Beta]", "val"]}], ",", 
        RowBox[{"tol", "=", 
         SuperscriptBox["10", 
          RowBox[{"-", "10"}]]}]}], "}"}], ",", 
      RowBox[{
       SubscriptBox["A", 
        RowBox[{"\[Rho]\[Beta]", ",", "ref"}]], "=", 
       RowBox[{"MPOStrangEvolution", "[", 
        RowBox[{
         RowBox[{"N", "[", 
          RowBox[{"IdMPO", "[", 
           RowBox[{"M", ",", "L"}], "]"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"h2", "[", 
           RowBox[{
            SubscriptBox["tH", "val"], ",", 
            SubscriptBox["U", "val"], ",", 
            SubscriptBox["\[Mu]", "val"], ",", "M", ",", "L"}], "]"}], "]"}], 
         ",", "qd", ",", 
         FractionBox["\[Beta]", "2"], ",", 
         FractionBox["\[Beta]", 
          RowBox[{"2", "\[CapitalDelta]\[Tau]"}]], ",", "tol"}], "]"}]}]}], 
     "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "/@", 
    RowBox[{"(", 
     RowBox[{"First", "/@", "%"}], ")"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "22"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "22", ",", "22"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "22", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"compare", " ", "with", " ", "\"\<exact\>\"", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", 
      RowBox[{"H", "/", "2"}]}]]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"tH", "=", 
       SubscriptBox["tH", "val"]}], ",", 
      RowBox[{"U", "=", 
       SubscriptBox["U", "val"]}], ",", 
      RowBox[{"\[Mu]", "=", 
       SubscriptBox["\[Mu]", "val"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", "\[Rho]", ",", "HB"}], "}"}], 
    ",", 
    RowBox[{
     RowBox[{"HB", "=", 
      RowBox[{"N", "[", 
       RowBox[{"HBoseHubbard", "[", 
        RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}]}], ";", 
     RowBox[{"\[Rho]", "=", 
      RowBox[{"MatrixExp", "[", 
       RowBox[{
        RowBox[{"-", 
         FractionBox["\[Beta]", "2"]}], "HB"}], "]"}]}], ";", 
     FractionBox[
      RowBox[{"Norm", "[", 
       RowBox[{
        RowBox[{"MPOMergeFull", "[", 
         RowBox[{"First", "/@", 
          SubscriptBox["A", 
           RowBox[{"\[Rho]\[Beta]", ",", "ref"}]]}], "]"}], "-", "\[Rho]"}], 
       "]"}], 
      RowBox[{"Norm", "[", "\[Rho]", "]"}]]}]}], "]"}]}]], "Input"],

Cell[BoxData["0.00026515719858631213`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"\[Rho]\[Beta]", ",", "ref"}]], "\[LeftDoubleBracket]", 
    RowBox[{"3", ",", "1", ",", "2", ",", "3", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", 
       RowBox[{"-", "1"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", 
       RowBox[{"-", "1"}]}], "}"}]}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "0"},
     {
      RowBox[{"-", "0.00024202929908631897`"}], "0", "0"},
     {"0", "0", "0"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "virtual", " ", "bond", " ", "dimensions", " ", "obtained", " ", "by", " ",
     "C", " ", "implementation"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["D", "\[Rho]\[Beta]"], "=", 
   RowBox[{"Import", "[", 
    RowBox[{
     RowBox[{"\"\<../output/bose_hubbard/L\>\"", "<>", 
      RowBox[{"ToString", "[", 
       SubscriptBox["L", "val"], "]"}], "<>", "\"\<_rho/bose_hubbard_L\>\"", "<>", 
      RowBox[{"ToString", "[", 
       SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
      RowBox[{"ToString", "[", 
       SubscriptBox["M", "val"], "]"}], "<>", "\"\<_beta\>\"", "<>", 
      RowBox[{"ToString", "[", 
       RowBox[{"N", "[", 
        SubscriptBox["\[Beta]", "val"], "]"}], "]"}], "<>", 
      "\"\<_D.dat\>\""}], ",", "\"\<Integer64\>\""}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "9", ",", "22", ",", "22", ",", "9", ",", "1"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"read", " ", "MPO", " ", "tensors", " ", "of", " ", 
    FormBox[
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "\[Beta]"}], " ", 
       RowBox[{"H", "/", "2"}]}]],
     TraditionalForm], " ", "from", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["A", "\[Rho]\[Beta]"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"M", "=", 
          SubscriptBox["M", "val"]}], ",", 
         RowBox[{"L", "=", 
          SubscriptBox["L", "val"]}], ",", 
         RowBox[{"D", "=", 
          SubscriptBox["D", "\[Rho]\[Beta]"]}]}], "}"}], ",", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{"ArrayReshape", "[", 
            RowBox[{
             RowBox[{"Import", "[", 
              RowBox[{
               RowBox[{"\"\<../output/bose_hubbard/L\>\"", "<>", 
                RowBox[{"ToString", "[", "L", "]"}], "<>", 
                "\"\<_rho/bose_hubbard_L\>\"", "<>", 
                RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<_M\>\"", "<>", 
                RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<_beta\>\"", "<>", 
                RowBox[{"ToString", "[", 
                 RowBox[{"N", "[", 
                  SubscriptBox["\[Beta]", "val"], "]"}], "]"}], "<>", 
                "\"\<_A\>\"", "<>", 
                RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], 
               ",", "\"\<Complex128\>\""}], "]"}], ",", 
             RowBox[{"{", 
              RowBox[{
               RowBox[{"D", "\[LeftDoubleBracket]", 
                RowBox[{"i", "+", "2"}], "\[RightDoubleBracket]"}], ",", 
               RowBox[{"D", "\[LeftDoubleBracket]", 
                RowBox[{"i", "+", "1"}], "\[RightDoubleBracket]"}], ",", 
               RowBox[{"M", "+", "1"}], ",", 
               RowBox[{"M", "+", "1"}]}], "}"}]}], "]"}], ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"i", ",", "0", ",", 
           RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "/@", "%"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "22"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "22", ",", "22"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "22", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", " ", "normalization"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"MPOMergeFull", "[", 
      SubscriptBox["A", "\[Rho]\[Beta]"], "]"}], ",", "\"\<Frobenius\>\""}], 
    "]"}], "-", "1"}]}]], "Input"],

Cell[BoxData["1.1102230246251565`*^-15"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"compare", " ", "with", " ", "reference"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"\[Rho]\[Beta]ref", "=", 
      RowBox[{"MPOMergeFull", "[", 
       RowBox[{"First", "/@", 
        SubscriptBox["A", 
         RowBox[{"\[Rho]\[Beta]", ",", "ref"}]]}], "]"}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{
      RowBox[{"MPOMergeFull", "[", 
       SubscriptBox["A", "\[Rho]\[Beta]"], "]"}], "-", 
      FractionBox["\[Rho]\[Beta]ref", 
       RowBox[{"Norm", "[", 
        RowBox[{"\[Rho]\[Beta]ref", ",", "\"\<Frobenius\>\""}], "]"}]]}], 
     "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["1.0521545481842168`*^-14"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Response function", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"\[Chi]C", "[", 
   RowBox[{"A_", ",", "B_", ",", "H_", ",", "\[Beta]_", ",", "t_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"tA", "=", 
       FractionBox["t", "2"]}], ",", 
      RowBox[{"tB", "=", 
       FractionBox["t", "2"]}], ",", 
      RowBox[{"\[Rho]\[Beta]", "=", 
       RowBox[{"MatrixExp", "[", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["\[Beta]", "2"]}], "H"}], "]"}]}]}], "}"}], ",", 
    RowBox[{
     FractionBox["1", 
      RowBox[{"Z", "[", 
       RowBox[{"H", ",", "\[Beta]"}], "]"}]], 
     RowBox[{"Tr", "[", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"MatrixExp", "[", 
          RowBox[{"\[ImaginaryI]", " ", "tB", " ", "H"}], "]"}], ".", 
         "\[Rho]\[Beta]", ".", "B", ".", 
         RowBox[{"MatrixExp", "[", 
          RowBox[{
           RowBox[{"-", "\[ImaginaryI]"}], " ", "tB", " ", "H"}], "]"}]}], 
        ")"}], ".", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"MatrixExp", "[", 
          RowBox[{
           RowBox[{"-", "\[ImaginaryI]"}], " ", "tA", " ", "H"}], "]"}], ".", 
         "A", ".", "\[Rho]\[Beta]", ".", 
         RowBox[{"MatrixExp", "[", 
          RowBox[{"\[ImaginaryI]", " ", "tA", " ", "H"}], "]"}]}], ")"}]}], 
      "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["A", "op"], "[", 
   RowBox[{"n_", ",", "M_", ",", "L_"}], "]"}], ":=", 
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"M", "+", "1"}], ")"}], 
      RowBox[{"n", "-", "1"}]], "]"}], ",", 
    RowBox[{"NumberOp", "[", "M", "]"}], ",", 
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"M", "+", "1"}], ")"}], 
      RowBox[{"L", "-", "n"}]], "]"}]}], "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "read", " ", "simulation", " ", "results", " ", "from", " ", "disk"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Chi]", "list"], "=", 
    RowBox[{"Import", "[", 
     RowBox[{
      RowBox[{"\"\<../output/bose_hubbard/L\>\"", "<>", 
       RowBox[{"ToString", "[", 
        SubscriptBox["L", "val"], "]"}], "<>", "\"\</bose_hubbard_L\>\"", "<>", 
       RowBox[{"ToString", "[", 
        SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
       RowBox[{"ToString", "[", 
        SubscriptBox["M", "val"], "]"}], "<>", "\"\<_chi.dat\>\""}], ",", 
      "\"\<Complex128\>\""}], "]"}]}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"0.45515409336125107`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4523834857676874`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.005688771107024853`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.46579512102437015`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.02152411233647784`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.49134617245410744`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.018217402843750626`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.49777306363552565`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.009315623576828289`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5071801765658734`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.01630357829951735`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5283729188253894`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0071275775101312154`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5221739994907111`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.0192631632839748`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4917634593455743`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.026173230368953776`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4690132470208151`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.01180983126938594`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4652388876105023`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0139631753616456`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.49094119563302857`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0467734497860163`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.549839566506872`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.06770792242892647`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.6186864201113009`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0543132565721132`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.6534295992057646`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.004697287249339811`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.6265020484311632`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.04478785766330601`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5677198619329303`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.05920282464705128`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5147737225483261`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.04939779389786637`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.47624385773926675`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.02493686119726412`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4687795824808192`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.014199420250101106`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5029551186240722`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.04796258092401402`", " ", "\[ImaginaryI]"}]}]}], 
  "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", "21", "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["j", "A"], "=", "2"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["j", "B"], "=", "4"}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"reference", " ", "calculation"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"tH", "=", 
       SubscriptBox["tH", "val"]}], ",", 
      RowBox[{"U", "=", 
       SubscriptBox["U", "val"]}], ",", 
      RowBox[{"\[Mu]", "=", 
       SubscriptBox["\[Mu]", "val"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", "HB"}], "}"}], ",", 
    RowBox[{
     RowBox[{"HB", "=", 
      RowBox[{"N", "[", 
       RowBox[{"HBoseHubbard", "[", 
        RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}]}], ";", 
     RowBox[{
      SubscriptBox["\[Chi]", 
       RowBox[{"list", ",", "ref"}]], "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"\[Chi]C", "[", 
         RowBox[{
          RowBox[{"N", "[", 
           RowBox[{
            SubscriptBox["A", "op"], "[", 
            RowBox[{
             StyleBox[
              SubscriptBox["j", "A"],
              FontWeight->"Plain"], ",", "M", ",", "L"}], "]"}], "]"}], ",", 
          RowBox[{"N", "[", 
           RowBox[{
            SubscriptBox["A", "op"], "[", 
            RowBox[{
             SubscriptBox["j", "B"], ",", "M", ",", "L"}], "]"}], "]"}], ",", 
          "HB", ",", "\[Beta]", ",", "t"}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"t", ",", 
          SubscriptBox["t", "list"]}], "}"}]}], "]"}]}]}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.45510993891384116`", ",", 
   RowBox[{"0.45233679322593145`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.005688057166625198`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4657444234957373`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.021527023472789744`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4912995522602068`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.01822266592240091`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4977289632599498`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.009315708398444365`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5071315933366345`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.016300283715700557`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5283209285715464`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.007126109163626508`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5221223740806926`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.019262679074012717`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4917125305043655`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.026171906799266485`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.46896105291073453`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.011807469352517594`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4651872609599165`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.013967202416921974`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.49089250118173966`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0467772192121893`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5497956532025887`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.06771103898114018`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.6186476036337719`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.05431141767074702`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.6533895302951658`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.004691544250273205`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.6264602312465806`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.044792601227138316`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5676753627761435`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.05920810960293734`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5147225135413135`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.04940269175645744`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4761881904252879`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.024938299048497682`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.468725107916006`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.01420049352529661`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.5029046614135293`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.04796357600155195`", " ", "\[ImaginaryI]"}]}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Abs", "[", 
   RowBox[{
    SubscriptBox["\[Chi]", "list"], "-", 
    SubscriptBox["\[Chi]", 
     RowBox[{"list", ",", "ref"}]]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.00004415444740990537`", ",", "0.00004669799959873851`", ",", 
   "0.00005078104099075701`", ",", "0.00004691633485487984`", ",", 
   "0.000044100457147706084`", ",", "0.000048694809228607245`", ",", 
   "0.00005201098476391407`", ",", "0.00005162768074261927`", ",", 
   "0.00005094603717259454`", ",", "0.00005224752413650542`", ",", 
   "0.00005178347443832888`", ",", "0.00004884012858297794`", ",", 
   "0.000044023757117957496`", ",", "0.00003886001139983031`", ",", 
   "0.000040478384785654295`", ",", "0.00004208536947976866`", ",", 
   "0.00004481189254491583`", ",", "0.00005144270033732268`", ",", 
   "0.000055685880273071706`", ",", "0.00005448513679187421`", ",", 
   "0.000050467021658440025`"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["plot", "label"], "=", 
   RowBox[{
   "\"\<Bose-Hubbard model with\\n\!\(\*SubscriptBox[\(t\), \(H\)]\)=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["tH", "val"], "]"}], "<>", "\"\<, U=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["U", "val"], "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{"InputForm", "[", 
      SubscriptBox["\[Mu]", "val"], "]"}], "]"}], "<>", "\"\<, M=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["M", "val"], "]"}], "<>", "\"\<, L=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{"N", "[", 
      SubscriptBox["\[Beta]", "val"], "]"}], "]"}], "<>", 
    "\"\< (scheme C)\\nA: number operator at site \>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["j", "A"], "]"}], "<>", 
    "\"\<, B: number operator at site \>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["j", "B"], "]"}]}]}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "export"], "=", 
   RowBox[{
    RowBox[{
     RowBox[{
     "\"\<plots/\>\"", "<>", "#", "<>", "\"\</\>\"", "<>", "#", "<>", 
      "\"\<_\>\""}], "&"}], "[", 
    RowBox[{"FileBaseName", "[", 
     RowBox[{"NotebookFileName", "[", "]"}], "]"}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"Transpose", "[", 
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["t", "list"], ",", 
        RowBox[{"Re", "[", 
         SubscriptBox["\[Chi]", "list"], "]"}]}], "}"}], "]"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"Automatic", ",", 
        RowBox[{"{", 
         RowBox[{"0.4", ",", "0.68"}], "}"}]}], "}"}]}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<Re[\!\(\*SubscriptBox[\(\[Chi]\), \(A, B\)]\)[\[Beta],t]]\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
       SubscriptBox["plot", "label"], "<>", 
       "\"\<\\nred: independent reference calculation\>\""}]}]}], "]"}], ",", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Interpolation", "[", 
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Re", "[", 
           SubscriptBox["\[Chi]", 
            RowBox[{"list", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], "[", 
      "\[Tau]", "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Tau]", ",", "0", ",", "5"}], "}"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{
       RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Export", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["fn", "export"], "<>", "\"\<chiAB_L\>\"", "<>", 
     RowBox[{"ToString", "[", 
      SubscriptBox["L", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
   "]"}], ";"}]}], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQOVShmL7BTv2kN4F+x9bqnfvfn5DpT/wP7T89th
087D5F/YlyvmmpsX3YfyP9jH2Xj2Nt+G8b/Ym3z98Pqi1QMo/4f9Lr9zQXkv
YPw/9ge8QuyXbYXxGRxOFV8o5K2E6WdycBUPUw5guQflszhkhhwPrjwGs5/N
QdTwwbwp2TD1HA4PjNtUPWc8hPK5HIryZ5e5n3kM5fM4/Cm/ZfD0xRMon8+h
rlCGzY8Hxhdw6A3hvHFI6xGUL+hQ+fbpXrZKmPuEHFz9qlqOV8HcI+zwIuOT
cA0DjC/i8E/YOtRU4oE9AN87YgY=
      "]]}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], LineBox[CompressedData["
1:eJwV2Xc8lV8YAHBcZFzrolSSSiqySUqeo0KphCKJshKykzKSKCuromUkDaOM
yJbsECIi4466195763d+f/l8P+97z/ue5zzPc877scPKxfAqCxMTkweBien/
vwl+VuwKNj4axyxiHB6IkyHRdPTQBfGLYGtbPXZ6Oxm6zoS5i4vbQzv5RdIm
MTLc0rnIyybuBdveqzzK30oG7WpktrA9FKyOKQds2USGjADlwMntL8B10KHK
i5cMZeyd2yY+vQSFdOb6GzxkaAnzKhw7Fg/+MzDuSiTD9OOyseFrr8AkOfeJ
BxcZ4g0kPk53JsPYJh/Z1+xk+GOZuXFsexqYv0ypivzXC8Nv/lmPDqbBqk/t
qeL1Xpju0/808ikdnFci6YNrvcDqMHNq+NhHMLm4TePsai9Iuh+8N3AtCzQP
KgWipV4Q6T5+7YZINthlJTveX+wFUZ8xnhnfbAj8UWr+faEXJL5oXJrW+gR7
oqcMreZ74YDmn7nJzhzYWmzh9HmmFw79DY13Vc+Fnu37bvNjawQqHptMyoVs
tYQAl+le0KkJjJ6w/wyyfKGPD0z1gslJSenxlTxwGXQPGBzvBbPh5lYni3zo
iI13NsO2fHjr9lh1Pniy3DBsG+sFh6a6mtGIAhhPlFyrH+0FH4PrFiPbi+DL
w4+V3cO9sB54YDM1vAgkLnOnmGH75zP//LlUBGE+1et/hnrh/tbnx4rbioEe
IENYGOwFdj3r1QxUAglWBhlB2KH+snmvM0qg73ZBzWbsyL5qydDgUvigrKiu
O9AL/CLRVN/ZUpj8UfxsoL8XHuteeu5q+QUMIpzMQrCfZU1xmhwug5mLaqLt
fb2w5W9p5anUMli9XCt0FzteKMQHhL9CpttVNxnsJC+xMcmJr5D4ocIghtEL
Ah2zhjyy5ZBcN/3zNLahi6lcsE05UCjbcjmwf73ePejdWg7hf08+DKP3wsbD
D6tnN1RAdU2Zvz62SftkkrNGBVRGCLdsxu5mL71o9aECEgr0b+X/7YWtSTsO
9P6pAE2+tMZQbDO1YJKxSCWoqX73tMBO+Dk6/kOvEuyk3DwOYVOuG34/+aAS
cujnqzdhb2crTKkqqYRlc/mri396wSJx2/0j05UgEfPFqBc7WTXQomBvFQje
y4+pwqa3DKorXKmCj9t/iWdiSzjobf4QWwUtDm2Lcdi2hM9zEo1VcNX8+tYI
7JT4zT8TWarh9LRx8D3sQZW7mSJq1XBdQv+wF/a+H4ywxy7V8Hac/4AHtoOd
7jXi+2roOXXO0x37A3P2saDeapg50Lp8A3v0pbA4k2ANtKQfr7yNLaPss+p1
sgaMk69998d2bqL9nrlbA3Yis0Lh2Nm22nlO+TUwtOFtwkvsqX8fHg2M1sCX
6wo2H7EVXwg4W+6qhW8axtcqsD0Ub+n2XKyFEZ/Gd13Yed97JY2ia4FHTE9s
Dnve5ijhR20t8IvH/hDE8VNdT6GeWKuFTt9LhSrYt5/xlFYqfQMduUudptjF
8jeeqzt8g6OKetKB2Cv1vz3yk77BR//xnExsdWsNA/nOb2AnPO9IxvZbfSOT
zlMHl0bETPjwejPJufQneNeBq3ZpqS+2Zl175aZPdWBa8VapEDvA8tCrRwN1
wGH/tGMemzWGzeTB+XrQkLoTdwfnl5bMdeV/YfUQodZfXIMdVNvC71VRD7KW
iFkA5yvnUly9o2wDzDGy1rKxDwZ3eetaNsAhh9sr/7DthDft3xvTADw8jp8N
cD3UKjyOpC81QD131rk17PsOIedMa76DQ3S81E1cX58Xa1gPLn6Htbf5jC5s
ehAhX1i6EcafZRto4no9+sZPpDW6Ec55iSERXM9MvR5kHbMmWG/sNugf6QV5
h5zI3VFNcPHW6AML3A+uLE4AobIJ/pQ/tiFjlwldTy7b0wz0R7e2UXH/8Dlj
eU1lphl8m19asExiU9/fFtBqgU91xOPfZnE9v9cy8L/cApw5/95en+uFdCfG
volbLSBTOvmKhPtd98qOnsb0FkBPUq7Y4X54UCThSAh/K9hPWAwpLuP11n/C
8q+nFVw8vx05xkQGXhHFHqe5VkgvVKrkZyaDJLUlt5f3J5xN2NBCwzZy4r1a
rPkTILM8MIRAhs+hod9upvyEqEeusvO4v7tV3g0fdW+Dpx7hqSfxfrEoEJPR
87ANEq8GuRziI4OfZWpzw9s2OCFb8VSGnwzhTK38aR1tkDvIz7KVRIZUjZ2x
Vw+1g4lbmTxpIxloxdUJFOZfIHfmjqAb3q/0czmzWqI7oIOzf9OwPBk6WcRa
vqZ1gJy/E8tuRTJcNlScyqzsgHrqtIyVEhkcp0yVImY7YGqV9zhdhQwhch8L
Tpp0QoCYogHTYTJ8/aBXXrn9N6x4nRV6p0UG2bdPWj9ndgGv09Frj83IIPRc
fqG8vgvqXBd0lS+TYeVhk2gTowu2hpZm/75ChrobG+z6tnQDn4D32l5rMt43
fdaFg7vhi/zv2wP2ZIj9ayV960oPRB5rpnbfIsOquOIDNTxvcVPez49jyfBX
6Ee6ljQZ6Ke0XQKekaGew7HFQJsMemIp9z1ekOHp5LutDr5kiPPrL7ySQAb5
8s05LwfJ8I7qJmH4jgzWV5ipK+UU+FVgN/kujwy65xJZOXopoP3pYWFxAb5f
57CU0AIFbKfota1F+PmyN2/ul6GC0hXVT+xlePz1QW7zF1R49Obui4e1ZOjT
sxOlHqTBBlU2FoFuPP9aRwk/LRr8+aD+/HkvGY4ecdu/zZAGka/Dp3dQyZAk
7a1+6ToNdoqwt6sxyGDGEW7WmUADK5ezznfGyfCzIiv+B8sfGMn6sv0MgQJl
ygui5Y1/YG/tJvdOGQo82xK07bUFHX5kqedR71Ngnt6coudMB6djvsPtwRQ4
n7FJcdWHDmyVMvT6MAqQUJr2hWd0GFSkz+dEUyD8aqMLTzMd5mv9o/zjKeCf
Tar0OsyA9ramaqbPFLDTfmVruLEPhs0H1c7+pUAt3+Dkv119YDf03WdfHwV2
d8n7ZCj0wbZ5dk2WQQr8vV4ZxXGmDya1/GWyxihg9qivsCywD/KT7TznFimg
3yvNLT2Ff+94YYM0HxXU3AuzCI39kLqtf/usGhVa/h2+7NbVD3zMSSZ31alg
G/GVSO3vB4uPm8Y3ABUep9baFzMPQIOhNafAcSoMU9p3uakOAFOKxSKzHhX8
HU1+Uo4PwPKjNZ5b+lTYuNzjf9pwAKaUE5WHDKlwTJhO3uM0ANSXPFHVF6gQ
f2rqGSV5AFYyX7gYW1JBsctD+3T2AGzbeZI115oKdbaLs0VfBkDvyNHLRFsq
zN77ZxD7ewAGrJXV8xyoEMYXyEToH4DzIxoZrE5UEE9gz3KdGYAuUv4XfRcq
5EuFmVOYBuFhuuSjUDcqnCnkIZ7mHQR7gUyJbncqMLQeFRdtHQTOWy6n93hQ
wbtNyH7PvkFYO7SVz+0mFd6Pb61lOT4I281m7i7fosK6hJR/kdcg7Lk12dDn
S4WYnAzZPcGDoHTs7AMRPypIIQVyTMwgbHLYyn/iLhWMLx085Jo1CB+1v3xK
uEeFrEfas5J9g9CV6UbbFUQFi3Uruxj9Iejtmqx5HUmFqs44fZc9w3A8qi/w
cQIe38podk5pGOaXNHPME/F6jPE+90XDMMTS2S75igpchABq6MVhcNxhRcxN
ooK+rJ3z24f4+th6b+4bKlDuK4d3TQxD5ser1ZfSqJDNNy5nsToMYm1VFRzp
VAh4mdLWzzECR66ocn3G3p29ZevsjhG43C38mO0jFRx7mNJ5z4+AYlGOcGwm
FZYVmr4dKxwBIea7Hx1yqdBYGnS9oXoESKYf+texE3UQn0HrCOyn1Vc++kwF
TfNc48vDIxD2LsYzN48KISEv+m6LjsK0m7XNQAHOD+pVQqb/KDguLYpsLKWC
Qvi6hsjJMchgiev/XIXzwX7VJsN4DEqCJyIVqqmgrL0cdtRmDGacbttlYB9g
mu9wvDsG/b6dDck1VFD3GHOuyBsDDr843gffqHDCrDfRYec4FHdUJMl8p4Ku
Wnf1P7lx2C/AFJeEfWrj7+GYI+Pwd6+SimAjFfRa2g58NRmHXXx7ry5gnz/+
vVkwahyfv7fdLG3G67W/eL10ZRzyZMqs4ScVrDgLJQw5J0CdOhaXhW3dn6c7
sHECdg3//Lu9Da9X0qenAooTICLtVMjUjuMplCZrazcBdYq5x6t/UcF56v35
lZsTcCfk8meVDiq4NL/1jg6cgKSb2x1SsN1DkmqLEydASeVx1cNOKtxafXaZ
79cE1OwkTpp0UeF2V+z9t38nQJhHxbAJ2zv/Sbra5ARQG9sUjnZTwefJo5bm
tQnot2+PLcDWKNRZ+cQ2CZ2Lk9KWPVT4+l470pc4CUzhrzWFe6mAYrV26AhO
QqF162A9tqb7MZ1e8Uk4Vlk0r0yhgk7/Iar8hUnQWDEnLdPx/NraR4PNJ+GK
+HmlNAYV7pc7L1OsJ2HryeYJkz4qVLxMFo5wnYS+ZN3jxf1UOHyW6/RQ6CRo
2eq8vD9EBbnCrsLXpZOgl+Q6pTZBhU1htx+Tdk7BwYA7bKoreH1vkZLs907h
8w/L1Br2eZuPGeWyU2CoOvq1ZhX3fQ1anfPhKbBN7ec3WacC94zOv4bzU6Bp
JEetYqLBv0ubHAOD8f0GR15xsdJgQCZfa3Z0CuKZ5bRXuXDfv+N0VXpmClxN
LnU4cdPArFHigdXSFNhQzs5TsVscnlS3sE2D50jjUA2RBsUprscyxKYhU7mg
9DkvDcJ3SGva6k/DXMeZf6YkGigIJ6n/zp2GYwsRVy5uoYGjzQUzvuJpeKwd
PkfBfp/L66tdPg2HrGWPXN1Kgy2Gd0o+N07Dpdsv+m6I0oA1yvTQo75pMFH/
UPhCjAYdHMIHdTfNQLlf2XmOXTTwWQ1VKvWegbTQzMbb+2nQ7GEd431vBj49
DxaRkKGB+Jj63MGQGei9dsu8BbuaPJGfFzsDLTKE39JyNCB+NTqUlT0DH9OT
88YVaHBZVS7OqWAGtHk4J18r0iA7i2NVumwGXNeNZI2VaGCUVPIl9fsMpN/g
Lq1QpkHivR2ayf0zcGC1RPOdKg0ml5ZfW4zNQPNu2QoLvO8edW9n2T47AzYf
jc9uU6NBzHCGNXl5BqpDo8a6sQesgqvjmGfhhNfgXO4hGhzqsdhtyjEL/kpz
0n8P43ieOxQkwjcLEpsJTgJHaCB/fEwnVnQWevdtXXQHGgSU1qae2zULYfk7
DrxDNGhXTuIkSc1Cm8LOa781aXB797nvkaqzYF/AGaZ5nAYV7EV6IYazsHIe
SYudpIHQ3cdZ2hfxeB/pJhd0aWC7cJ2fzWIWirzcTz46RQOuQbGf95xmIUHl
1KUNejQwrL9v5BMyC6bh+S9W8LmB8VDfzLlsFozsqPDPDJ8zBAbtz0vNwWOX
HxIn3WgwH2ym9Up+Dt51WhzxcqdB/3qL+PCBOYhTemuSdoMGtaNFnXePzQHj
aUkgpycNguoean0wm4O/hSG76r1pwO4vt4Mlag5Uur2Oa97HnvD8nTUzBxl8
b/5OP8XjXx3JXV6ag6moid7Nz/H4vVeitJjmofJe9RH0Ao/fcEK7hzgPVaEB
2x/G4fHfb/nMLjkPKl3p3SJJeLzLZVHmJvMQ3Bc6zJdGA7YmNh3uL/Ogr+Ck
o1uM88Mp3ppcNQ8W8VJjDiU4XjxK/lkN8/BxQ6JkWCkNJM5YFJ37PQ9KOg2H
q8tocLypWDp+Zh4Sj8lrSlbh9Wly4ZeRWoDu9Umd+O80CHNil/knvwBxb5Xh
TSMNHvMknGxVXYCgkRLb1CYaJJ9pCLiptQCkmkKZjB94vZok5r5YLECyv/XY
qzYaMDV3dek9W4Cn/YerJHpowOHsOi+euABdv6jt3L004OfdIDjzdgEUNxjl
TmKL6ymffpazAFbPO77kUmgAzZFl1KYFMNKTvST2lwbazrt7PrUvwMCe87tn
sPV4SxcCexaAXehxWA0d14PekPzeoQWQCPfise7D+TF+98zyxAJoNn4Wk+2n
gXPkRofG+QXYHSydM4/tKZsRlLi2ALSn7ytKB2jg13zsjSvrIiiJSoqgQRx/
5+6vR7kXoUhQ5nYidiSvW68QaRGKu9NPL2Mn6CUKF21fBLUJXqP0IRr+zlZW
fCi5CKUnFkLXsT9Gftczl1mEmlBTFf1hGpQ2LwYzH14E9+7YqRHsaueot22a
iyA670I4MEKDRl7JincnFsFIoD7iDnav3rnlk8aLEHB5lYdtFOfv+NBGUfNF
8In/zaqFPRrprzRuvQi806qeAdgrzRmOj90WgWc1sGEOW6zVMu74bTy+zmyB
1Biu7zbhhnm/RXj+65CaOXZY5509l8IX4TuH0lIxdmaXgjHPk0W40/b7YD92
a0/f/a8vFuGxzBFevnEaiNDO/N2Vsgi/e/b5XsRW/8ss0JGxCKzG74V9sC0Y
eRDyeRFCPtRrv8S+32/vfKhkEawmePgLsFMGtyWMVixClPKYWyt2w3Dr98S6
RSBG/nEcwh4ffbCs/2MROnmvMv/DJk2o7SN0LMJ4/ZQcaYIGB6bGLuT1LsKZ
n8xLO7FNZ14HXaMvwvQhPnMF7DtzRnmbhxehe2OM2RHspAVOxvdJ/H5eXIva
2NVLX0h+C4vg6DEqp4c9uOKmKb++CPyin1nPYRPXd7v+ZV2CsYAeTyNseabu
xBjuJWAu7Q363+dYIpu0SUtwsltB5f/7PVmPri6KLEHV5PmA/8d7yT4v9WH7
ElwnlTvrYJdxpF80l1wCZDi2/P/7/OW6HMInswRQZbxHEZudh1RQobQEV297
zu7C3sdX23fj0BJk36+1EsQ+LeAtJKm5BNtWyt2ZsF0FZY/91lmC9HGqxAiO
T4zwX7cwvSU4557g1YZdsOlpkrrREmx6ccOtCLt7s+6P8UtLMHOzl5iAvb51
fS3Jagn6thqe9sPeKZaz/5z9Egwl6MmbY2uL215ic12CNd7TRWrYERLNhfZ3
luAUl2LpCM6HbMmAga33l8C/mFe1Art974GNzWFLUPKu3SQGW1Qm8Ybi8yVQ
82J9ooSN5AyTGYlL4Bls9fEfzkdrBfbWp++WIEv0sXM9drqKs+xKzhJw7dWb
MMJuVt1pnlG0BJLVzZki2NNqHQ+vlC+BshLn5i5cD2oaGkNVTUuwuePJhCF2
nTbv2/BBHP+jpjlSuJ5GT1T+1JhYgp1hhF/duP74TnkyT80twWV11fch2MZn
KZeNCMtgJSNpTMb123chc7OY2DIYGvkuOeD6f2+yVmkmsQw6e5ABH7bdxdOO
cVLL0PFsV+on3C+GTYfLRFSXgcf+1/lJ3F8mzSVtBPWXYe5i0WcjBg1yLt/k
MTRehsZMPf5h3I9uXKnOjzZbhraGrc6+2PMWVpy89stQ4TikEIf716p1YiZH
wDLs7ZfsK6fhfLEZu6ATsgzPWc6aa2HfvarOHBS5DD94v3V/o9KA5Vr3OULc
Ms4jpYFa3B85HDYureUuw7vtP/QzcP8UdI08NtO3DJL7S79s/Y3Xx5U8qjC6
DOPvzhT5d9Lgqdv+p67Ty/DB4ko5vQPX842GwbH1ZTiXETX95hfuF57skYOb
VsBWYXGKiPu3lK/fb/LJFRAzisi9h/v9qG/TPVH9FdgCEbHf8H6QcUdU+pLx
ChwqORLKjS1/t/jOb6sVUPBTT4lowPUaML+zzWcFOL48qPP+RgPNEGenuowV
oEaOzC+W4/NTDvVC5OcVkN2WmcuDPdujf/R8yQpYZhxXFP+K10NOaROtbgUu
yg54anzB9dm5UL5AXwFmuTZpiyK8fkz2H74Mr8DPExvYrAtx/KS6YwOnVsB0
C8tb6wIaPD9/yv/k4goYL2tyWuXTwM2v1IHv3wr4gZbK5Twa6KbKGP1iW4XQ
vbc3bP+M98efiRBHXIXutwS39hx8ftt9T2jPllUgXMkoPphNg6yz0+uj4qvA
nZzzdiCTBiFe1kM5e1Zhf6eoc0wGDQ43aZVpqKzCpp3jOQPpuP94cNkZ66+C
WqBk1M13NLhe9aTkQdAqDBUwDSi+xPvvGOv7UxGr0HrOe3MlPg+IbfKMFohZ
BWPuR95nn/1/fjW5mvB6FWI7rXttYnA8Sdv48kpXIUJGM807Eu+vlu+tGNOr
8EZorNQ4gAax64Wcx66sAf9SnMeMHY7Xnhrn2Ktr8DNoatjpGu7HZ1vbBq6v
wYF3MUYDV2ngnjSUEH57DWqOUzZ1WuH99OgWxY5Ha3CsT60iHZ+P2IN8TO2r
16DBfGi/pD4+n/FofIjatw6qXyhPQw/Q4JJo1enemXWIKvghxWDG9eE0NZ23
vA45nYShTfj8fvvr9hdRzP8AzmeoPsPn/adWvn1H+f7BIOeHgatzVPiZquKX
JvUP7HFTIwzg7zuV1CxPy38gk1DddaqBCof0IkgCP/7BTEKBluEjKhDLpUd3
GjGh1dR0ubD9VPj7wqDurgkT2nuz50jyPioU3Lj1tvcSE0ofsOIslcTfd3uq
zJ5aMaGT3w/3z4rj65GmTZyuTEiccneTrzC+bh6aORnGhO6VvLlEX6dA4XK/
a1k5Eyp4NX5fpo0Cke3EM1urmZB3+5+hwBYKWGcq7rv9jQmZEM28e5sowGvl
90ehmQnNR3+QjqnD1+uFDd/1MKFxjR3yYmX4+vPjSuHzTGhnQVHVqzQKXFVJ
nru4nxkdtVaSdwugQFikMN8dOWZ0cubeEXV/CmQOhOxNUmRG74TWIzj9KDD/
wuVS/0Fm5MnIIHzwokDIunqFuxb+fapSNKcbBdK/dYY/vMyMPmhsSlK1oMD4
RR6JL9HMaO7ZIZnriAKkXP8jtCfMaJ/vKNd9DQocIM4aE54xoyfFRx+8UqfA
3bLu0JMJzGjndu5LlIMU4N+VOvErjRkteJ7r8lGggOLo0ZLxSmb0hsr85OAu
Ctzyu20oPseMDga1hjdyUGDvqC8xeBGPb/iSbdsGCvy+eK92bIUZ6YT/XHJl
o8BBlbBDJSws6KhNroskCwUWR+J2GvOzoEc2Oe3VK2Twvvh1+qE0C7JMY+bM
nCCD1Leqj9OyLOjczqUXh8fJ0K1cZ3tRkQVtHGrvaRwlw2H+1m5JNRZUaO1+
d3mIDKu1fysrtFmQxp725AAGGfyU2Z8sWLKgB3kfNE52k0E2mevM5assaMLr
qYNgFxkofHwbauxYEP3lSd8/nWSAkU0+j11YkOi85uXQX2RgSt5nLXOHBUVJ
c3lxtJIhm092W4w/CxIer5Wb/kEGizuKncuBLOi+UFk/tZkMFSaHT9WFsaD6
6Birb41kCOA7o2T9nAUVWLiN19aRQfGOwVh9HAvSNosmtH4jw99hoxT5Vyxo
S9UlJWotGY7VXt66/g7Hp0N+ckMNGVjvuBJe5LIgk/3Whx9WkOHzsMeXf/ks
qDvOIyC/nAw2Jl63bItZEJPf2/W+r2SoVgoYUapgQX8Tnr8xKCPDg+Enbc3N
LKjpquXqpRIy3O/sa1hpZUGvsh4w5xVjV6tW7v3FgqwUfeoEsAMSe7IDeliQ
1Gz8+45CHD/DXZEHBllQxV/+iYh8MtyBmw+sR1jQdmchPTZs3/3ffKPHWZCu
kct9/zy8fuzXrw/PsqBbJ8bvBXwmg2dxzolEZgKSU7flzsshw80UVvSdlYBW
t3u7nsL2iDFWXdxAQO4B1yv7PpHB3Xl5tyEvATW2p6lKYrtdOr3trgAB2Z4x
sWjMJoPriUShj0IEtNk4xd8T22XnUQL7VgJS3jec05FFBme+mGVFMQI67wsN
4f97tW/qyg4CWnZdpGtjOw2pDoVLEFDg9xoWNmzHjlBa0R4COqlvsu9bJhn3
457OfikCSq2yMI3AdsiW+SEoi993KOr5BWz7hLu1SIGAkoKf9u/Gtgtr/eKk
TECTFrt1FjPIcO3WrryXqgSkc2istBnb1ubmx2+HCIj5d6JuGvZVg29vZo8Q
kPf68HQwto3G5rgdmgTE4x5Q6IBtLX39sd5xAhJeEE40wLYS+RLqo0NA4wbG
79X/NxvfvVRdAprVnm2Txractrj96wyez8ukfduxLag5LiwGBDTHT0zf+L8b
Wa/JnSegFOeBCyTsK0XGl80uENDMLbrK/778PtUo1JSADkxla/9/v/mT5dP5
5jj+iUwRYthm/qeP0y0IiFcrkPv/511ySjzMb0NApqlD1YexTU0nFY9cIyDu
CEaJPvZFnaNSDg4E5FsgMWOPbaIcs+OZEwFxjZo6/T/fCzv6Rapd8XgTqjL/
x8OY9yD/1A0C6r/vqPID22gldIPYLQIadUsLWcI+P9izruuNx/N+tW8vjvf5
XzLzt+4Q0LTVvy2XsM9V3h17609AaRNeVx5jG2a1MloDCWiN8XWp6X/H7+pd
D8LruyFglAevt77ntwaTCAI6xDjS/xL7rPXmygfRBBSz58X0ALae/vWinCcE
ZJymZKWG8+u0FF8q8SUB+XgN3RzCvljnkrovgYBeB8Ud1Mb5aWvbkqqdREA/
+PYdScH2T36U5v+egDwDl4U9cX5HoOm0hDQCCrfRn6Bjv6QYphd/JCBq5jsh
41xcz1uEPszmENBtR/czOrheKgo9PgjkE5BJx8rVWuxm418fZIsIKONpavtJ
XF+Dj59+tPuK82FDdJk5rj9R7s2Zvd9xvu17zF2M63VfmlfmUjMB6VcpiJoV
keGATnfmxp8EpB6p/owF17d+YFyW/m8cvzcFHWb/94OVbZ+qGQRkdgoqtXG/
ePTC79OfAQJaGVRyIuJ+kqhK/bQ+TEAjj3qedmAX3kjKOTiF82/6mutt3I9G
R3Z+/rhGQHucXQOnq8mwFBr4uZ6JFXW3/Myn4/7FvpfxuZ/AivgSTrNN4P4m
bvMuT5yLFdkvhJoL1uP17N1TELORFYl16Ak9aSJDaeP+Yl85VpR0ZouNC+7H
9Q4RxS8UWZFrwPfPX3+ToYNjvDhfhRV9Lnd4L4T7+eTxrJLJw6woPoXLtbGX
DBJfFL7YnGBFBzRn8m78xfHPOFB+2pIVvc3z//Ua7x+SFnstM2xYkXvd2dwr
k2QoI21h4bVjRZrraUK7pvF4t9aO/XBmRVVRsbbFc/j9jlZ/M/BlRXc9LK9J
r+F4dxr8MH7GihZjI8ibeCiQF3rMteAlK5JdeXlHlo8CeuoqAiKJrGjIMyxX
V4AC/q9FznW9ZUUNzu/6nghTgHGd2nEphxXZhNED7MUo8JHJiWLRxIo2V2om
78T7q1bu5bsVLayI/ml13xMlClCu6ovvbMfz/TB5kfMA3o+/K1nRu1mRrvfm
AvbDFPCIXe67OsiKnDKCgrS0KHBYKmTMgcCG8kqjvdtNKdBw7s2qhxob8uZw
/gJhFMh58Lc7Tp0NtR0TtlCIoMDLgh1FlcCGRLqb+PZGU8Bha9JNfm029GB+
/0uJpxTgpMePfzDE43EUepgmU+CE+1Pa3+tsqM4iXaC4hAI10aHV+olsKMhQ
2/XsNJ5PZV3yrddsyH9NPJAxR4GY2Q33Et+yobOrPeV+SxS8XwUdGU1nQ2Ht
H8srmajAKh6YH1zAhlQ5f4yE8FHhaJZvalkLG2oyKCvnlaVCeZNL+H4CO6qv
zP7m40IFZSHE/YydHZ06zEmL9qBCqil/GDMXO1LMbhX96EWFqIHs4A5+dhSQ
xdU/G0iFy8zTAf5i7Ei//8FA83MqrCp7eLWrsaN+rcF9iVVUUIu/bevryo5u
fdClF/Pi7zWHe6iRzI6kQtJFVFzx+fsUHHT+vAHJ6ZpR17X/wLF/ZoGvfDmQ
tiS/kO+ev2DT8XW60IgTORqzUp9vowP/n4ZYugkn2uVin8G1gw4lI78O8ppx
om0a7/u9JehAYh71s7biRG82aAUaS9Phq7QIN68LJ7odZF+3dJAOW+657rIO
4UTq22nxI+fo0Cq94zxPCSdqEBU8ZhRCB98D+xdUy/B1WIkJfUiHvZqqL60q
OJHa5Q+JJZF08DM+Qyv4xoniXjJXicTSYf89L0erdk4UqPs7J/81HUI6Wu8X
jHGiVvfyk77FdNC4F5BnKc6FZls/jsYN0mFBPd7SdxcXYp/MsD01QofsxTye
Z5Jc6Marzs2LY3TY5Tp0tXE/F/IcuSF2coYOHFf0N6qqcaGGb97H69fo0KYu
dotoyIU4+DbuABID7BaLDhYEcqHcSskNwwcZsONzG6M1iAst5b44eugwA7pd
xqJHQ7nQlX+ZZ4KPMODMgPjQjmgu9IocVbPpKAMUO4JfhMdzoTidX1SBUwxY
yzVatszjQnS9qp5rZgx47DJVQhzgQuHCLT2BvgzohHiO68NcKGPWIC3ajwGi
/DpG9WNcSGmVTe2FPwNSsuPHH8xyoTEFqciE+wwondLZ8Y+ZG6XMO7xwD2dA
/43EoClRbhTYxX1fN44B0sdPtp0V50YiMVt8BBIY4Co0uz1zF7bM9GRbIgNW
Pp8scpDiRr9Tdpw4lcwA/vnZEboqNxryC5UlpDHg0O1TBh2G3CgppVg6Jo8B
d0/MJygbcyOexAphgQIGVIu8Hn58kRsN7917OLSQAWeL5gPPWnAjrzS1PddL
GGCz/Dq/zokbuQl58s6VMyCt4TRhjxs3Gne8Z36qkgHjLxfOPvDgRrTPqrXx
VQzwOnxmSNOHG70ub2iTr2VApO/i1pIQbrQz6LH9tu8MaDv9xm5zODdqEFnj
O93IAJFtenm3ovD7zpln3mxiwJsvb/SUn+L3O7K3sugHAwrX9e5lvOFGvl/6
f7C24/g3LzVxp3Cja1bc5Vy/GHD01dstDuncqPGjWxB3BwOaYDlX8hM3Cqbu
fbDWyYC//u/6X5VxIx2fk+3JPQzwbElwra7gRmW2Z6679jKAS/zp8mA1N1or
SrRVI+P1/hrEq/idG0nf9vL9QmFA4Nq1A9Wd3Kj8pkZNxB/8vmcsyge78ftW
9Iod+MuAj/EmujwUbhR+wK6iC7v98MnLxgxulOj1tI3EYICEt1TQ4CQ3sgq9
23iqH8+nfic/zyw36jicz9OMfXrz1pcKCzjenV6+pwYYQLMTlDBe5kaW5y8L
V2N7FHJneq9xo7fpC+2qgwzg4GA9+IqJiD7tt7gUiR1/YbWiikBEYsEz2new
5VNmTw2yE1Gmlv+Fa9g186O/iFxElCpSHH0a21S774oCDxGdyz4/vx97PJY8
ZMRPRAulhHAO7IC+Xze8BYmoa9zbiIqfv1GleS1xIxEdm3cy/oSdfr82uGoz
EXkFRj/2w9ZoLxMYFCWiau2nPDrYtjeydivsIqI8+S0/6vH8litTsowkiWiw
4J/ofexIUpKa9z4iOn3gWaEadv6n6DNVckRU2ZU+8LSPAbrMoZ0DikRkfSUy
QAObon/PkniAiAwSpr3+4HhumHS7aaRORPIEYsRm7Hhw+OcFRJT1cG92Jh3P
P8oqNPEoET2LiNEAbBPZcwkDJ4ioomzfR0O8PqmOyjVeRkR0WGxS4RiNAeql
+88mmhBRQ5Hcps9UBrRw7+6qvEREq/pmD8Sxl9KFx7itiMhS6RT3KM4P3aF5
oURnIlrk27NbD+cT5eBEYqUbEZm13CyK62aAe8jA3gEPIorjPTvL6GLAyz2/
1eV9cHxqXBwdfjNg5GqRTWUwEYXYCjRr4vwlNhyNknpIRKaO94dMcX7vl20s
ehxJRLWLidwubQxwnKfwWsfi8UdTPENaGTAaxFpEeENEI7IbHf1xvRBHIujX
3xPRBtOfyB3X0/6zm3jb04go9sWk5hVcb46bpKzfZhPRbLx8r1Q9/n3KWR6t
MiI68O77bEg1/j2xSzWjgogu2rzLPo/rd7+rlZVwDX5+TVzZVlzfjgdvFvR9
JyLH/BJ63FcGjNW9tAzqIiJj+NVhU4zzZ6gv79ssEWnc6PDflsUAXj0Xmtwi
EaW/t4tJymCAbM4i1/MVIhJ4Hq61/SMDnL25LexYeFDBiu0TPtyfxrkUuDj5
eVBPvrtlKe5fE9K+l3WleZCY/5kB3VgGTDqRNjRZ8iADn9MJZrcYcMVgyHnF
hgdRJc5H+t1kQLNyecc+Ox701XxNLuEGrscVp/dBznh8p+iYFhfc/0PrtZAP
DzrxXF2P3w7X11v/+7kxPEjqfT11/gIDfvSMM7/8xoOKNsaZ+agwIPPk91Vb
GV6UR43O0R6ggzQl2+mBPC8yR1Xvsxh0SHV/SnmjxIuC3H2ubfxLh+Q4y3Ka
Gi+6UFFnQe6lQ+zYQqCpNi/6c3Qgx+An3i8fSXDrXeFF9Ld5vzpL6aDbdWez
yiNepH7l/WbvaDr028kfIMzxot57p0o2KuH990P3k+AmPsT1qfl6tdlfCLRw
T246xY9EnY/daXr9BxZWN0ecKuJHW1pCUl8M0GBvybMXDRICSLJH368G0aDO
zfXzJUkBRDl+XslDgwZ2e0/+GN0jgHYt+KpLqNMgLXaZlU9aACmKuJ0LUaWB
lKu56zkFAXTB/0SThSwNpHfv0uk9IoBOhvwqOS9KA9mozNkxYwGU1j9cnDFN
hWatYL67JgLIPClqu904FX/fXpHiNxVAtSIZWbuHqZBlL2ChaC6AbLgLrdL/
UEH+uMd3T2sBVHOlI6i7hQqKS2rJ/1wEkArrbfOuLCqoWNecFQgVQAxl+3kn
VyqIvu0/VB0mgOJyc8aOOlKBpW+D5K1wAcTHnaEmaoefb6u72hslgBwz4xg9
V6hg6/AjNfWpAJrK/CwSfZYKz926mNFbAVTY4RHeIkeF5btjuc5f8fPK9qh2
zFCAVs77akeFAKpofoOTiwK1zPJh7ZUC6CgXMTJzlAJPAt0tDtUKIDvHkKGX
fRTYH7xAZG8SQJo1942yOylgHslsm9CNf88hHfOzlALl8cIijXMCqKFtj+bm
h/j8nUDeYbUggJaZdm66HEKBnoR30ouLAujbz7SOlAcUmE9UAYlVPP6CzS5d
fwrIvDay9WUhoT88uZ9mbuLz8LvYz/v5SGhrbHRgoRUF9r43L6vkJ6H+3KTF
axb4vP9+d50JiYReplDDRC9ToCUlr+e+MAmZX8sXiL1IgQ3pv1jIW/F4Jeaz
Vfr4fJ4pbBCxl4QOG+k4bEUUYMkim+6SIqGFY6rz2zQoEJX1zqZImoSUnYMb
dqtTID1b5XafLAm1Nwtd0DpIgT85Rq+OqODryt6nquXx/Apix8Y0SahNetd6
1U4K9BaYLwQeIyH285znRXdQwL5wN/MWLRIyELu3zXs7Be4X5QlpnyChjukp
YW1RCpSU/DqcqEdCEnwug9s34vmVC4fpXSIhuU9hrmQuCqhvvvq814yE+KS9
G2M4KWDg/vm9w2USuqIuGmXAQQFviXNVQZYk9OLdW8MeNgo0hkSvll0jIUuh
9c3yzHh9/1C5ztiTUMH3omkSEwXmDslt7nEgIe6t97RX1skgNtaksuBEQnPM
V+x7V8ngZsDtIudBQtXuUXTaIhmC0k3vfLlJQuvXqT0TC/h7mZD+8NQtEqpZ
e2LNil2ddyL1mjcJaVy/IK2Bv882bgn688qfhFon/OizU2SQuvFrQiYAv6+c
dKI8NjRKrJcE4vhwxK664e89O7+qLb+DSGiUtTmTbYIMxX+ZzvNHkNBaJlHe
bRR/bx/Wt0qMJCE9NfLZ7hEy0GNeue6PJiFt8+o9J7GJOhoRJ56Q0M1pFq6D
w2TYkRQR1xFDQi1vXDcXDuHv7aXeNJunJLTZZcfIEewrH3xq/V+QUEXbbarp
IBk8WL+388aR0NEMlQ3TA2QIMd9Cj48noWVxq5VI7IR8+ympRBJa1AstU8DO
4Sv6V/gKr+eFA+e6+8lQa8fBq/OahIRMZ0tCsHsqLoj+SiYho1t6K+rYk1tS
8IaD1/fHD8GFPjKweswfnHpHQk/uETgKsEWatHTuppBQXqZHty+2jGSsEU8a
zmfPzIgT2EfvMqzj0vF4S4cltmAb/1Zy3/cR56txatIUgwwOCoH+BRkk9DjL
j+0H9t2wn5FaWSR0cJeuUQ52DH1HQls2nk9r7OM47FR1tw+WOSQ00jP6NQy7
NLa8aCIX15dlN/Uudus4X92dPBJKuDc0643dr3Olg7uAhALN3zH7Yi8nZTJe
FJIQRegFRyA23/La9J5iEvr67SwxGlvi3Bnm/BISOvT0PN8b7IMf4/mOfyGh
y0mKQqXYZ9hGt/0sIyFgv7mt5//3GQxcvVdOQl9etb0k4PmxNG7tUajE+SXy
XkkJ2zwrt+hPFQlNrEuP2GMXPj71/FENXl/q2+oUbJIn3VPzGwkxndSvGsV2
uuhjNFVHQhvrnIYP4vjXqQsqv24godRh9SPh2DvFP5AMGknotMZaWT+2L+HY
FFMzCcXpj7ufwOvb2d/9I/sHCUllnTX7hB2ewRXB30ZCNsGWvc9xvvRHJ18v
byehI6KPvDbhfNL0OKTr2kFCOUpyFxOw5w85bGjpIqF68bzRMpyP+mIs/Xd7
cH0KiKaY4nz9wPyyWo6M66FkInsN26Ku/l4UjYT2u/Z8vTiG8/+DpQX8xfF6
6v6dNE4G4agljQk6CdE/eCi1YTcY7VvVG8DP7ynY7YDrR0Ktont9kIQQ/+18
hOvrrujFosxhHC+H19li02RQpod48o6TUNY3mfHJGTIkug5ONs2SkFKc+NA4
rt/Fc/4/7szj+vDeJs68RIZzqiKZMoskZDVyt3vLMhk41nWuR6yQkFfJjX4b
3B/cH6b0nWYRRIqRXPnncH9pdIbqVYIgyvDdY53MQoE9hp3JH9kE0VGH9xmL
BNwPRTZYEDkFEb9X3Z5SdgrovLft/s4niGr/RHO/IlIgOXS90EdAEAVrfVqX
4qXAquPTZ9KCgmiTsHxaGR8FcpRqzz/cKIhYZHUU1kgUEK3Y/UN3myC6WdVs
17mZApM9jKp6KUHUYEE9TdhHgWm/XRVm+wWRcqK95JAUBWZ3WJVNyAiisiG2
vl/7KbB4jVoorCCIDA8QRP/v30yzXRmWqoLI9cZ88cz//18h/ni2dEwQ7Rkb
407WpQApiyc2XEsQxZueubFwmgJChqcfb9cRRCUsS0PnzlJA5Hl9uJauINoW
WcW38zwFxCWq7z3SF0RWV7iDBfF+JK9edH2fuSCKvRRz48wNCihSF+xKLwui
5orrRGFPCigHHLA9ayGIjkTVU+i3KXCwLtfiprUgog2/P/TMjwLofKZRhb0g
UrnRLGIURgF9xzdw0VMQ5av++yL3hgIu8RGCoVGCaB/Ppd03uvF6MEtM6D4S
RFN1Jd9iKRSQulbcQHwiiDzEfNsr/lKAoTBwL/qpIOpZaTh8YIQCJt/Q5LME
QTR03Ck1epUCR6dnGt9/EESyKjvl+XZQYeMJ06Dqb4IoskDj42k3KtzImLQM
qhdEj3KDC954UqGFFHzkxHd8/40Pyay+VHhIzp393iyIPJMV9zCCqMB0g8e6
7Zcgan3Arb8lgQrDCeXwly6I+u9rXbD9TgUdwoWtb/sE0dNndSLmrVR4azc2
f3VAELWwMGbNO6lwRWlL5tCwINp94gm3H50K7XU3RKemcHwMX20+uEoFBVmu
xZwZQaR1y4QbMdMg8klSm8ccXq+O3t32rDQ4ebkpbHFREDmtyuU3cNHgfZW1
bfEyjmd8uhyBlwas+5Y1fVcF8fn6diMSoIFlZPQ2jXVB1BTjEhkoRIOyGcml
f/8E0XDt1VvfN9HgP/+hiwY=
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"t\"", TraditionalForm], 
    FormBox[
    "\"Re[\\!\\(\\*SubscriptBox[\\(\[Chi]\\), \\(A, B\\)]\\)[\[Beta],t]]\"", 
     TraditionalForm]},
  AxesOrigin->{0, 0.40140000000000003`},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"Bose-Hubbard model with\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, \
U=5, \[Mu]=1/7, M=2, L=5, \[Beta]=0.6 (scheme C)\\nA: number operator at site \
2, B: number operator at site 4\\nred: independent reference calculation\"", 
    TraditionalForm],
  PlotRange->{{0, 5.}, {0.4, 0.68}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {0, 0}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Virtual bond dimensions", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["t", "plot"], "=", 
   RowBox[{"Range", "[", 
    RowBox[{"0", ",", "5"}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "dimension", " ", 
    RowBox[{"for", " ", "'"}], 
    RowBox[{"A", "'"}], " ", "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Partition", "[", 
    RowBox[{
     RowBox[{"Import", "[", 
      RowBox[{
       RowBox[{"\"\<../output/bose_hubbard/L\>\"", "<>", 
        RowBox[{"ToString", "[", 
         SubscriptBox["L", "val"], "]"}], "<>", "\"\</bose_hubbard_L\>\"", "<>", 
        RowBox[{"ToString", "[", 
         SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
        RowBox[{"ToString", "[", 
         SubscriptBox["M", "val"], "]"}], "<>", "\"\<_DXA.dat\>\""}], ",", 
       "\"\<Integer64\>\""}], "]"}], ",", 
     RowBox[{
      SubscriptBox["L", "val"], "+", "1"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"%", "\[LeftDoubleBracket]", "#", "\[RightDoubleBracket]"}], 
      "&"}], "/@", 
     RowBox[{"Flatten", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Position", "[", 
         RowBox[{
          SubscriptBox["t", "list"], ",", "#"}], "]"}], "&"}], "/@", 
       SubscriptBox["t", "plot"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"ListLinePlot", "[", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Range", "[", 
           RowBox[{"0", ",", 
            SubscriptBox["L", "val"]}], "]"}], ",", "#"}], "}"}], "]"}], 
       "&"}], "/@", "%"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<j\>\"", ",", "\"\<\!\(\*SubscriptBox[\(D\), \(A, j\)]\)(t)\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
      "\"\<virtual bond dimension of \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\\ H\\\ t/2\)]\
\) A \!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\ H\\\ t/2\)]\)\\n\
\>\"", "<>", 
       SubscriptBox["plot", "label"]}]}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Lighter", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"2", "/", "3"}]}], "]"}], ",", 
        RowBox[{"Lighter", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"1", "/", "3"}]}], "]"}], ",", "Blue", ",", 
        RowBox[{"Darker", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"1", "/", "3"}]}], "]"}], ",", 
        RowBox[{"Darker", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"2", "/", "3"}]}], "]"}], ",", "Black"}], "}"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"\"\<t=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "#", "]"}], "]"}]}], "&"}], "/@", 
        SubscriptBox["t", "plot"]}], ")"}]}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "export"], "<>", "\"\<DA_L\>\"", "<>", 
       RowBox[{"ToString", "[", 
        SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
       RowBox[{"ToString", "[", 
        SubscriptBox["M", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
     "]"}], ";"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "22", ",", "22", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "31", ",", "29", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "41", ",", "39", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "53", ",", "46", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "71", ",", "65", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "79", ",", "78", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], 
    "}"}]}], "}"}]], "Output"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {{{}, {}, {
        Hue[0.67, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[2, 3], 0.6666666666666666], 
          NCache[
           Rational[2, 3], 0.6666666666666666], 1]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 22.}, {3., 22.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[1, 3], 0.3333333333333333], 
          NCache[
           Rational[1, 3], 0.3333333333333333], 1]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 71.}, {3., 65.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}}}, {}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {0, 81.}}, DisplayFunction -> Identity, 
     AspectRatio -> NCache[GoldenRatio^(-1), 0.6180339887498948], 
     Axes -> {True, True}, AxesLabel -> {
       FormBox["\"j\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(A, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\\(-\[ImaginaryI]\\)\\\\ H\\\\ t/2\\)]\\) A \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ \
H/2\\)]\\) \\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \
\\(\[ImaginaryI]\\\\ H\\\\ t/2\\)]\\)\\nBose-Hubbard model \
with\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, M=2, \
L=5, \[Beta]=0.6 (scheme C)\\nA: number operator at site 2, B: number \
operator at site 4\"", TraditionalForm], PlotRange -> {{0, 5.}, {0, 81.}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
      "\"t=0\"", "\"t=1\"", "\"t=2\"", "\"t=3\"", "\"t=4\"", "\"t=5\""}, 
      "LineLegend", DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #6}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.4444444444444444, 0.4444444444444444, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[2/3, 2/3, 1]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.2222222222222222, 0.2222222222222222, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[1/3, 1/3, 1]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.6666666666666666], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 1]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[2, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.4444444444444444], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 2/3]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[2, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[2, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[1, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.2222222222222222], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 1/3]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[1, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[1, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "GrayLevel[0]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False]}], 
                 "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5, ",", #6}], "}"}], 
           ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               
               RowBox[{
                "True", ",", "True", ",", "True", ",", "True", ",", "True", 
                 ",", "True"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}]}], 
         "]"}]& ), Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "dimension", " ", 
    RowBox[{"for", " ", "'"}], 
    RowBox[{"B", "'"}], " ", "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Partition", "[", 
    RowBox[{
     RowBox[{"Import", "[", 
      RowBox[{
       RowBox[{"\"\<../output/bose_hubbard/L\>\"", "<>", 
        RowBox[{"ToString", "[", 
         SubscriptBox["L", "val"], "]"}], "<>", "\"\</bose_hubbard_L\>\"", "<>", 
        RowBox[{"ToString", "[", 
         SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
        RowBox[{"ToString", "[", 
         SubscriptBox["M", "val"], "]"}], "<>", "\"\<_DXB.dat\>\""}], ",", 
       "\"\<Integer64\>\""}], "]"}], ",", 
     RowBox[{
      SubscriptBox["L", "val"], "+", "1"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"%", "\[LeftDoubleBracket]", "#", "\[RightDoubleBracket]"}], 
      "&"}], "/@", 
     RowBox[{"Flatten", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Position", "[", 
         RowBox[{
          SubscriptBox["t", "list"], ",", "#"}], "]"}], "&"}], "/@", 
       SubscriptBox["t", "plot"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"ListLinePlot", "[", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Range", "[", 
           RowBox[{"0", ",", 
            SubscriptBox["L", "val"]}], "]"}], ",", "#"}], "}"}], "]"}], 
       "&"}], "/@", "%"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<j\>\"", ",", "\"\<\!\(\*SubscriptBox[\(D\), \(B, j\)]\)(t)\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
      "\"\<virtual bond dimension of \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\ H\\\ t/2\)]\) \!\
\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\)]\) B \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\\ H\\\ t/2\)]\
\)\\n\>\"", "<>", 
       SubscriptBox["plot", "label"]}]}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Lighter", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"2", "/", "3"}]}], "]"}], ",", 
        RowBox[{"Lighter", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"1", "/", "3"}]}], "]"}], ",", "Blue", ",", 
        RowBox[{"Darker", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"1", "/", "3"}]}], "]"}], ",", 
        RowBox[{"Darker", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"2", "/", "3"}]}], "]"}], ",", "Black"}], "}"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"\"\<t=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "#", "]"}], "]"}]}], "&"}], "/@", 
        SubscriptBox["t", "plot"]}], ")"}]}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "export"], "<>", "\"\<DB_L\>\"", "<>", 
       RowBox[{"ToString", "[", 
        SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
       RowBox[{"ToString", "[", 
        SubscriptBox["M", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
     "]"}], ";"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "22", ",", "22", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "28", ",", "32", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "37", ",", "42", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "45", ",", "57", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "62", ",", "74", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "77", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "9", ",", "81", ",", "81", ",", "9", ",", "1"}], 
    "}"}]}], "}"}]], "Output"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {{{}, {}, {
        Hue[0.67, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[2, 3], 0.6666666666666666], 
          NCache[
           Rational[2, 3], 0.6666666666666666], 1]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 22.}, {3., 22.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[1, 3], 0.3333333333333333], 
          NCache[
           Rational[1, 3], 0.3333333333333333], 1]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 62.}, {3., 74.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}}}, {}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {0, 81.}}, DisplayFunction -> Identity, 
     AspectRatio -> NCache[GoldenRatio^(-1), 0.6180339887498948], 
     Axes -> {True, True}, AxesLabel -> {
       FormBox["\"j\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(B, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ H\\\\ t/2\\)]\\) \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ \
H/2\\)]\\) B \\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\
\[ImaginaryI]\\)\\\\ H\\\\ t/2\\)]\\)\\nBose-Hubbard model \
with\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, M=2, \
L=5, \[Beta]=0.6 (scheme C)\\nA: number operator at site 2, B: number \
operator at site 4\"", TraditionalForm], PlotRange -> {{0, 5.}, {0, 81.}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
      "\"t=0\"", "\"t=1\"", "\"t=2\"", "\"t=3\"", "\"t=4\"", "\"t=5\""}, 
      "LineLegend", DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #6}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.4444444444444444, 0.4444444444444444, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[2/3, 2/3, 1]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.2222222222222222, 0.2222222222222222, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[1/3, 1/3, 1]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.6666666666666666], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 1]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[2, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.4444444444444444], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 2/3]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[2, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[2, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[1, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.2222222222222222], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 1/3]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[1, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[1, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "GrayLevel[0]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False]}], 
                 "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5, ",", #6}], "}"}], 
           ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               
               RowBox[{
                "True", ",", "True", ",", "True", ",", "True", ",", "True", 
                 ",", "True"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}]}], 
         "]"}]& ), Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Effective truncation weight", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"tolerance", " ", 
    RowBox[{"(", 
     RowBox[{"truncation", " ", "weight"}], ")"}], " ", "for", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", 
      RowBox[{"H", "/", "2"}]}]]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Partition", "[", 
     RowBox[{
      RowBox[{"Import", "[", 
       RowBox[{
        RowBox[{"\"\<../output/bose_hubbard/L\>\"", "<>", 
         RowBox[{"ToString", "[", 
          SubscriptBox["L", "val"], "]"}], "<>", "\"\</bose_hubbard_L\>\"", "<>", 
         RowBox[{"ToString", "[", 
          SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
         RowBox[{"ToString", "[", 
          SubscriptBox["M", "val"], "]"}], "<>", 
         "\"\<_tol_eff_beta.dat\>\""}], ",", "\"\<Real64\>\""}], "]"}], ",", 
      RowBox[{
       SubscriptBox["L", "val"], "-", "1"}]}], "]"}], "-", 
    SuperscriptBox["10", 
     RowBox[{"-", "10"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"tolerance", " ", 
    RowBox[{"(", 
     RowBox[{"truncation", " ", "weight"}], ")"}], " ", "for", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[ImaginaryI]"}], " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]], " ", "A", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", 
      RowBox[{"H", "/", "2"}]}]], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{"\[ImaginaryI]", " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Partition", "[", 
     RowBox[{
      RowBox[{"Import", "[", 
       RowBox[{
        RowBox[{"\"\<../output/bose_hubbard/L\>\"", "<>", 
         RowBox[{"ToString", "[", 
          SubscriptBox["L", "val"], "]"}], "<>", "\"\</bose_hubbard_L\>\"", "<>", 
         RowBox[{"ToString", "[", 
          SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
         RowBox[{"ToString", "[", 
          SubscriptBox["M", "val"], "]"}], "<>", "\"\<_tol_eff_A.dat\>\""}], 
        ",", "\"\<Real64\>\""}], "]"}], ",", 
      RowBox[{
       SubscriptBox["L", "val"], "-", "1"}]}], "]"}], "-", 
    SuperscriptBox["10", 
     RowBox[{"-", "10"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"tolerance", " ", 
    RowBox[{"(", 
     RowBox[{"truncation", " ", "weight"}], ")"}], " ", "for", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{"\[ImaginaryI]", " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", 
      RowBox[{"H", "/", "2"}]}]], " ", "B", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[ImaginaryI]"}], " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Partition", "[", 
     RowBox[{
      RowBox[{"Import", "[", 
       RowBox[{
        RowBox[{"\"\<../output/bose_hubbard/L\>\"", "<>", 
         RowBox[{"ToString", "[", 
          SubscriptBox["L", "val"], "]"}], "<>", "\"\</bose_hubbard_L\>\"", "<>", 
         RowBox[{"ToString", "[", 
          SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
         RowBox[{"ToString", "[", 
          SubscriptBox["M", "val"], "]"}], "<>", "\"\<_tol_eff_B.dat\>\""}], 
        ",", "\"\<Real64\>\""}], "]"}], ",", 
      RowBox[{
       SubscriptBox["L", "val"], "-", "1"}]}], "]"}], "-", 
    SuperscriptBox["10", 
     RowBox[{"-", "10"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1626, 920},
WindowMargins->{{Automatic, 233}, {73, Automatic}},
FrontEndVersion->"10.0 for Microsoft Windows (64-bit) (July 1, 2014)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 48, 0, 63, "Section"],
Cell[1537, 37, 123, 3, 31, "Input"],
Cell[1663, 42, 68, 1, 31, "Input"],
Cell[CellGroupData[{
Cell[1756, 47, 41, 0, 43, "Subsection"],
Cell[1800, 49, 297, 9, 31, "Input"],
Cell[2100, 60, 524, 15, 52, "Input"],
Cell[2627, 77, 185, 5, 31, "Input"],
Cell[2815, 84, 330, 11, 46, "Input"],
Cell[3148, 97, 3424, 91, 167, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6609, 193, 43, 0, 43, "Subsection"],
Cell[6655, 195, 228, 7, 52, "Input"],
Cell[6886, 204, 214, 7, 52, "Input"],
Cell[7103, 213, 236, 7, 67, "Input"],
Cell[7342, 222, 233, 7, 52, "Input"],
Cell[7578, 231, 285, 9, 52, "Input"],
Cell[7866, 242, 244, 8, 52, "Input"],
Cell[CellGroupData[{
Cell[8135, 254, 249, 7, 52, "Input"],
Cell[8387, 263, 29, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[8465, 269, 266, 9, 45, "Subsection"],
Cell[8734, 280, 2601, 74, 143, "Input"],
Cell[CellGroupData[{
Cell[11360, 358, 1444, 37, 76, "Input"],
Cell[12807, 397, 28, 0, 31, "Output"]
}, Open  ]],
Cell[12850, 400, 789, 23, 52, "Input"],
Cell[CellGroupData[{
Cell[13664, 427, 1861, 54, 89, "Input"],
Cell[15528, 483, 452, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16017, 500, 1483, 44, 134, "Input"],
Cell[17503, 546, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17590, 551, 514, 14, 52, "Input"],
Cell[18107, 567, 661, 19, 71, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18805, 591, 871, 20, 52, "Input"],
Cell[19679, 613, 118, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19834, 621, 2361, 58, 152, "Input"],
Cell[22198, 681, 452, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22687, 698, 326, 10, 52, "Input"],
Cell[23016, 710, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23104, 715, 709, 20, 69, "Input"],
Cell[23816, 737, 51, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[23916, 743, 39, 0, 43, "Subsection"],
Cell[23958, 745, 1364, 40, 48, "Input"],
Cell[25325, 787, 569, 17, 33, "Input"],
Cell[CellGroupData[{
Cell[25919, 808, 778, 19, 72, "Input"],
Cell[26700, 829, 2736, 45, 72, "Output"],
Cell[29439, 876, 51, 1, 31, "Output"]
}, Open  ]],
Cell[29505, 880, 183, 6, 52, "Input"],
Cell[CellGroupData[{
Cell[29713, 890, 1651, 49, 72, "Input"],
Cell[31367, 941, 2658, 43, 72, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[34062, 989, 254, 7, 52, "Input"],
Cell[34319, 998, 774, 13, 52, "Output"]
}, Open  ]],
Cell[35108, 1014, 1098, 25, 52, "Input"],
Cell[36209, 1041, 329, 10, 31, "Input"],
Cell[CellGroupData[{
Cell[36563, 1055, 1788, 52, 72, "Input"],
Cell[38354, 1109, 19530, 333, 325, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[57933, 1448, 45, 0, 43, "Subsection"],
Cell[57981, 1450, 151, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[58157, 1459, 3428, 90, 137, "Input"],
Cell[61588, 1551, 2259, 65, 72, "Output"],
Cell[63850, 1618, 27779, 592, 336, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[91666, 2215, 3428, 90, 137, "Input"],
Cell[95097, 2307, 2259, 65, 72, "Output"],
Cell[97359, 2374, 27779, 592, 336, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[125187, 2972, 49, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[125261, 2976, 1047, 27, 54, "Input"],
Cell[126311, 3005, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[126378, 3010, 1325, 34, 54, "Input"],
Cell[127706, 3046, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[127773, 3051, 1325, 34, 54, "Input"],
Cell[129101, 3087, 30, 0, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature RxTsootY#wKKKAwO6k#TvEEO *)
