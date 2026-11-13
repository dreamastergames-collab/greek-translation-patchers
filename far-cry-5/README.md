# Far Cry 5 – Ελληνική Μετάφραση (patcher)

## Εγκατάσταση
1. Κατέβασε τη μετάφραση από το Nexus Mods και βάλε τον φάκελο `FC5_Greek_Translation` μέσα στον φάκελο του παιχνιδιού (εκεί που είναι ο φάκελος `data_final`).
2. Κατέβασε το `FC5_Greek_Patcher_v1.0.zip` από το [Release fc5-v1.0](https://github.com/dreamastergames-collab/greek-translation-patchers/releases/tag/fc5-v1.0) (στα **Assets**).
3. Αποσυμπίεσέ το **μέσα** στον φάκελο `FC5_Greek_Translation`.
4. Τρέξε το `INSTALL.bat`. Αν βγει μήνυμα SmartScreen: «Περισσότερες πληροφορίες» → «Εκτέλεση οπωσδήποτε».
5. Στο παιχνίδι βάλε γλώσσα κειμένων **English**.

## Απεγκατάσταση
Τρέξε το `UNINSTALL.bat` (ή κάνε Verify files από Steam / Ubisoft Connect).

## Τι κάνει ο patcher
- Ελέγχει την έκδοση του παιχνιδιού (μέγεθος `patch.dat`). Αν δεν ταιριάζει, **δεν αλλάζει τίποτα**.
- Προσθέτει το `greek_data.bin` (~4 MB) στο τέλος του `data_final\pc\patch.dat`.
- Αντικαθιστά το `data_final\pc\patch.fat` με το `patch.fat.greek`.
- Δεν σβήνει και δεν αλλάζει κανένα άλλο αρχείο. Ο κώδικας είναι ανοιχτός: δες τα `INSTALL.bat` / `UNINSTALL.bat`.

Ευχαριστίες: ArmanIII για το FCBConverter.
