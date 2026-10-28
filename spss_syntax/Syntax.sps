* Encoding: UTF-8.

DATASET ACTIVATE DataSet2.
RELIABILITY
  /VARIABLES=OM_1 OM_2 OM_3_R OM_4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

DATASET ACTIVATE DataSet1.
RELIABILITY
  /VARIABLES=Moderator_1 Moderator_2 Moderator_3 Moderator_4 Moderator_5 Moderator_6 Moderator_7 
    Moderator_8
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

DATASET ACTIVATE DataSet2.
COMPUTE Nutrition_Literacy=MEAN(Moderator_1,Moderator_2,Moderator_3,Moderator_4,Moderator_5,
    Moderator_6,Moderator_7,Moderator_8).
EXECUTE.

COMPUTE Purchase_Int=MEAN(OM_1,OM_2,OM_3_R,OM_4).
EXECUTE.

FREQUENCIES VARIABLES=Nutrition_Literacy
  /STATISTICS=MEDIAN
  /ORDER=ANALYSIS.

RECODE Nutrition_Literacy (Lowest thru 3.50=0) (3.50 thru Highest=1) INTO NL_Group.
EXECUTE.

FREQUENCIES VARIABLES=Label_Condition
  /ORDER=ANALYSIS.

T-TEST GROUPS=Label_Condition(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=MC1
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).


CROSSTABS
  /TABLES=Message_Presence BY MC2_Correct
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.



CROSSTABS
  /TABLES=Label_Condition BY Message_Presence
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT SRESID 
  /COUNT ROUND CELL.

DESCRIPTIVES VARIABLES=Age
  /STATISTICS=MEAN STDDEV MIN MAX.

FREQUENCIES VARIABLES=Gender
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Education
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=Frequency
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=Nutrition_Literacy
  /STATISTICS=MEAN STDDEV MIN MAX.


MEANS TABLES=Purchase_Int BY Label_Condition BY Message_Presence
  /CELLS=MEAN COUNT STDDEV.

UNIANOVA Purchase_Int BY Label_Condition NL_Group Message_Presence
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(Label_Condition*NL_Group*Message_Presence) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO 
    YAXIS=AUTO
  /PRINT ETASQ DESCRIPTIVE HOMOGENEITY
  /CRITERIA=ALPHA(.05)
  /DESIGN=Label_Condition NL_Group Message_Presence Label_Condition*NL_Group 
    Label_Condition*Message_Presence NL_Group*Message_Presence 
    Label_Condition*NL_Group*Message_Presence.

DATASET ACTIVATE DataSet1.
CROSSTABS
  /TABLES=Label_Condition BY Message_Presence BY NL_Group
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT 
  /COUNT ROUND CELL.

UNIANOVA Age BY Label_Condition Message_Presence NL_Group
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PRINT DESCRIPTIVE HOMOGENEITY
  /CRITERIA=ALPHA(.05)
  /DESIGN=Label_Condition Message_Presence NL_Group Label_Condition*Message_Presence 
    Label_Condition*NL_Group Message_Presence*NL_Group Label_Condition*Message_Presence*NL_Group.

UNIANOVA Frequency BY Label_Condition Message_Presence NL_Group
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PRINT DESCRIPTIVE HOMOGENEITY
  /CRITERIA=ALPHA(.05)
  /DESIGN=Label_Condition Message_Presence NL_Group Label_Condition*Message_Presence 
    Label_Condition*NL_Group Message_Presence*NL_Group Label_Condition*Message_Presence*NL_Group.

CROSSTABS
  /TABLES=Gender BY Message_Presence
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Education BY Message_Presence
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

DESCRIPTIVES VARIABLES=Nutrition_Literacy
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=Purchase_Int
  /STATISTICS=MEAN STDDEV MIN MAX.

DATASET ACTIVATE DataSet1.
UNIANOVA Purchase_Int BY Label_Condition NL_Group Message_Presence
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(Label_Condition*NL_Group) COMPARE(Label_Condition) ADJ(LSD)
  /EMMEANS=TABLES(Label_Condition*NL_Group) COMPARE(NL_Group) ADJ(LSD)
  /CRITERIA=ALPHA(0.05)
  /DESIGN=Label_Condition NL_Group Message_Presence Label_Condition*NL_Group 
    Label_Condition*Message_Presence NL_Group*Message_Presence 
    Label_Condition*NL_Group*Message_Presence.

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Condition
  /ORDER=ANALYSIS.

ONEWAY Age BY Condition
  /ES=OVERALL
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /CRITERIA=CILEVEL(0.95).

ONEWAY Frequency BY Condition
  /ES=OVERALL
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /CRITERIA=CILEVEL(0.95).

CROSSTABS
  /TABLES=Gender BY Condition
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Education BY Condition
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

GRAPH
  /BAR(GROUPED)=MEAN(Purchase_Int) BY Label_Condition BY NL_Group.

T-TEST GROUPS=Label_Condition(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=Purchase_Int
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).

GRAPH
  /BAR(GROUPED)=MEAN(Purchase_Int) BY Label_Condition BY NL_Group.

GRAPH
  /BAR(GROUPED)=MEAN(Purchase_Int) BY Label_Condition BY NL_Group
  /PANEL ROWVAR=Message_Presence ROWOP=CROSS
  /INTERVAL CI(95.0).
