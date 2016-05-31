**Opowiedz proszê krótko, czym siê na co dzieñ zajmujesz?**

W mojej codziennej praktyce zawodowej ³¹czê obowi¹zki biostatystyka, projektanta oprogramowania i programisty.

Biostatystyk zajmuje siê statystyczn¹ analiz¹ danych p³yn¹cych z medycznych badañ naukowych w ramach tzw. "medycyny opartej na dowodach". Obecnie poruszam siê w dziedzinie badawczych eksperymentów medycznych zwanych "badaniami klinicznymi", poszukuj¹c odpowiedzi na pytanie czy dana terapia jest skuteczna i bezpieczna. Podpis biostatystyka wieñczy zarówno statystyczn¹ czêœæ protoko³u ("Biblii") badania jak równie¿ koñcowy raport statystyczny, bez którego proces dopuszczenia terapii do stosowania nie mo¿e zostaæ zakoñczony. Biostatystyk wspiera równie¿ dzia³ Zarz¹dzania Danymi oraz klinicystów w procesie monitorowania poprawnoœci i kompletnoœci wprowadzonych danych. Czasem wciela siê tak¿e w rolê detektywa pomagaj¹c badaczom zrozumieæ przyczyny zaistnia³ych nieprawid³owoœci.

Oprócz analizy danych zajmujê siê tak¿e projektowaniem i tworzeniem specjalistycznego oprogramowania "bran¿owego". S¹ to zarówno proste narzêdzia wspieraj¹ce proces monitorowania jakoœci danych jak równie¿ bardziej z³o¿one systemy wstêpnej ich analizy i raportowania. Warto nadmieniæ, ¿e praktycznie ka¿dy biostatystyk jest równie¿ programist¹: analizy wymagaj¹ znacznej bieg³oœci w jêzykach programowania zwi¹zanych z u¿ytym oprogramowaniem analitycznym (R, SAS, SPSS, itd.). Kluczowa jest tak¿e dobra znajomoœæ SQL.

**Co w kontekœcie analizy danych wyró¿nia bran¿ê, w której pracujesz?**

Analizê danych w ramach badañ klinicznych scharakteryzowa³bym dwoma s³owami: "rygoryzm" i "odpowiedzialnoœæ". Jeœli nie ograniczymy siê do badañ eksperymentalnych, doda³bym tak¿e "pogoñ za moc¹".

***Rygoryzm***, poniewa¿ badania kliniczne charakteryzuj¹ siê d¹¿eniem do uregulowania wszystkiego, co tylko mo¿e zostaæ uregulowane. Wszystko odbywa siê wedle wytycznych (np. wytyczne ICH), Standardowych Procedur Operacyjnych (SOP), szablonów (TFL) z uwzglêdnieniem tzw. "Dobrej praktyki klinicznej" (GCP). Ka¿dy krok jest sprawdzany pod k¹tem zgodnoœci z SOP. A wszystko to pod rygorem uniewa¿nienia ca³ego badania. Przypominaj¹ mi siê w tym momencie sceny z filmów katastroficznych, gdzie w obliczu zagro¿enia, pilot siêga najpierw po ksiêgê procedur.

***Odpowiedzialnoœæ***, poniewa¿ pomy³ka i niefrasobliwoœæ mog¹ kosztowaæ czyjeœ zdrowie - tu za ka¿d¹ analizowan¹ liczb¹ stoi ¿ywy cz³owiek. "Walidacja" - s³owo-klucz, które pojawia siê co chwilê, na ka¿dym kroku. Krytyczne fragmenty programów  sprawdzane s¹ przez niezale¿nego analityka, a nierzadko tak¿e zewnêtrznych ekspertów.

***Pogoñ za moc¹*** - chocia¿ termin ten nie dotyczy badañ stricte klinicznych (s¹ dok³adnie zaplanowane "na najgorszy mo¿liwy wariant"), to jest on nieod³¹czn¹ zmor¹ wielu badañ dotycz¹cych rzadkich chorób i zjawisk. Nierzadko zdarzaj¹ siê retrospektywne badania o donios³ym znaczeniu, generuj¹ce próby o liczebnoœci "nastu" obserwacji, z których trzeba uzyskaæ maksymalnie du¿o informacji. W sytuacji, gdy œwiat zach³ysn¹³ siê terminem "Big data", w medycynie nadal króluje niepodzielnie "Small data" przez du¿e "S".

**Opowiedz kilka zdañ o tym o czym bêdziesz opowiada³ podczas najbli¿szego spotkania**

¯ycie pisze najlepsze scenariusze. W firmie, w której pracujê, pojawi³o siê zapotrzebowanie na mechanizm generuj¹cy bardzo wa¿ne raporty. Rêczne przygotowanie takiego raportu to droga przez mêkê. Zachodzi³o ryzyko, ¿e raport bêdzie nieaktualny ju¿ w momencie jego tworzenia.

Zasugerowa³em wykonanie systemu dostarczaj¹cego takie raporty w ci¹gu sekund. Musia³em podj¹æ decyzjê z jakiej technologii skorzystaæ. Jako programista .NET pocz¹tkowo myœla³em nad webserwisem pod³¹czonym konektorem do R. W efekcie analizy moich doœwiadczeñ stwierdzi³em, ¿e wprowadzanie dodatkowych warstw poœrednicz¹cych i ciê¿kiego b¹dŸ co b¹dŸ frameworka to stosowanie armaty na muchê. Za du¿o konfiguracji, za du¿o zachodu, koniecznoœæ zatrudnienia dodatkowego programisty C#. Praca serwerowa R pod Windows te¿ nie napawa³a optymizmem. Zdecydowa³em siê „pójœæ na ca³oœæ” i wykona³em taki system ca³kowicie w R.

Na spotkaniu chcia³bym omówiæ ró¿ne aspekty wykorzystania R i platformy OpenCPU do zbudowania niewielkiego (50-100 u¿ytkowników) systemu raportuj¹cego dla firmy. Do osi¹gniêcia prostych celów wystarcz¹ proste rozwi¹zania. Niestety, jest to okupione pewnymi niedogodnoœciami i haczykami, o których chcia³bym opowiedzieæ.

**Dlaczego w³aœnie taki temat?**

Trochê z przewrotnoœci - "patrzcie, oto kolejna rzecz, jak¹ mo¿na zrobiæ w R". Trochê z zadowolenia, ¿e to naprawdê dobrze dzia³a i chcia³bym podzieliæ siê tym z innymi. A wreszcie - poniewa¿ to moja ma³a cegie³ka w promowanie zastosowañ R w firmach.

**Jakie s¹ wed³ug Ciebie najwiêksze zalety R?**

Takie pytanie grozi wielogodzinnym wyk³adem :)

A powa¿nie - potêg¹ R jest to:

- jakie posiada mo¿liwoœci - dostêpne s¹ biblioteki praktycznie do wszystkiego, tak w zakresie statystyki (praktycznie ka¿dy rodzaj modelu) jak i regularnego programowania
- ¿e jest darmowy, jednak¿e w razie potrzeby mamy do dyspozycji tak¿e komercyjne wersje firm trzecich (np. RStudio, TIBCO)
- ¿e jego u¿ytecznoœæ zosta³a dostrze¿ona i doceniona przez tak wielkich graczy, jak Oracle czy Microsoft. MS R Server, MS Power BI, Oracle Enterprise - to brzmi dumnie!
- ¿e ma otwarty kod, który mo¿na przejrzeæ, nauczyæ siê czegoœ i ³atwiej wy³apaæ potencjalne b³êdy
- ¿e nad jego rozwojem pracuj¹ têgie profesorskie g³owy z solidnym doœwiadczeniem w zakresie (bio) statystyki
- ¿e mo¿na go uruchomiæ na Raspberry PI, Androidzie, a byæ mo¿e i jakiejœ lodówce... Otwiera to szerokie mo¿liwoœci w zakresie tworzenia dedykowanych rozwi¹zañ analityczno-kontrolno-pomiarowych
- ¿e "rozmawia" z SAS pozwalaj¹c zaoszczêdziæ sporo pieniêdzy!
- ¿e ma potê¿n¹, aktywn¹ spo³ecznoœæ gotow¹ do pomocy czêsto szybciej i sprawniej ni¿ najlepszy komercyjny helpdesk
- ¿e pozwala tworzyæ zarówno z³o¿one oprogramowanie analityczne, jak równie¿ sprytne "kieszonkowe" narzêdzia
- ¿e wiele rzeczy mogê wykonaæ na N sposobów, niemal ka¿dy programista R ma swoje ulubione konstrukcje
- ¿e potrafi odczytaæ i zapisaæ dane w tak wielu formatach
- ¿e posiada bibliotekê do operowania SQLa na poziomie ramek danych. I ¿e mogê korzystaæ z R w PostgreSQL lub MS SQL
- ¿e nawet jego najwiêksi konkurenci (SAS, SPSS, Statistica) dostarczaj¹ konektory do R
- ¿e stanowi mix paradygmatów: tablicowy, obiektowy, imperatywny, funkcjonalny, proceduralny, refleksyjny. W efekcie dostajemy do r¹k potê¿ne narzêdzie programistyczne
- ¿e posiada najwiêcej bibliotek do tworzenia profesjonalnych tabel i grafik do publikacji "klinicznych"

Po wiêcej (znacznie!) zapraszam do prezentacji www.r-clinical-research.com

**Z drugiej strony, jakie s¹ najwiêksze wady tego jêzyka?**

- R zosta³ stworzony przez statystyków dla statystyków, a nie przez zawodowych projektantów i programistów. Nie k³adziono specjalnego nacisku na dopracowanie, ujednolicenie jêzyka, optymalizacjê. Konstrukcje w rodzaju try-catch, obiektowoœæ - wygl¹daj¹ tam nieco sztucznie, jakby "doczepione" trochê na si³ê.
- Brak centralnego "zarz¹dzania jakoœci¹". Pakiety s¹ tworzone w bardzo dowolny sposób, ich zachowanie nie podlega standardom. Istniej¹ oczywiœcie "zalecenia" i "dobre praktyki", ale trzeba siê do nich jeszcze stosowaæ. Brak centralnej walidacji pakietów (choæ autorzy czêsto dostarczaj¹ testy jednostkowe) sprawia, ¿e u¿ywamy ich na w³asne ryzyko. W przypadku popularnych pakietów rekompensuje to silna, aktywna i œwiadoma spo³ecznoœæ, która b³yskawicznie wy³apuje i raportuje b³êdy. Jest to bardzo powa¿ny zarzut w bran¿y badañ klinicznych!
- Wspomniany mix paradygmatów sprawia, ¿e programy w R mog¹ byæ pisane w sposób bardzo zró¿nicowany. Z moich doœwiadczeñ trenera wynika, ¿e sprawia to powa¿ny problem pocz¹tkuj¹cym, którzy dopiero poszukuj¹ swojego stylu i czêsto nie potrafi¹ sprawnie odczytaæ programów napisanych przez innych. Problem ten jest w R widoczny daleko bardziej ni¿ w innych jêzykach programowania
- Typowa dokumentacja przeciêtnego pakietu jest zaledwie spisem funkcji wraz z pobie¿nym opisem ich u¿ycia. Daleko jej do dokumentacji znanej np. z SAS. Na szczêœcie dla naju¿yteczniejszych pakietów istniej¹ rozbudowane strony instrukta¿owe (dplyr, ggplot2, ReporteRs, sqldf)
- R wymaga pewnych zdolnoœci programistycznych - bo to po prostu jêzyk programowania. Odstrêcza to wielu pocz¹tkuj¹cych. To nie Statistica, w której wszystko mo¿na "wyklikaæ". Sytuacjê ratuje odrobinê np. RCommander lub Rattle

**Bior¹c pod uwagê twoje doœwiadczenie, jakie s¹ najwiêksze trudnoœci z wdra¿aniem jêzyka R (lub ogólnie oprogramowania open-source) w medycynie i farmacji?**

S¹ tutaj dwa zasadnicze problemy, bardzo istotne i trudne do „przeskoczenia”.

Wspomniany brak centralnej instytucji kontroli i zapewnienia jakoœci. Najczêstszy i najpowa¿niejszy zarzut w mojej bran¿y to "R nie podlega walidacji". Kto jest odpowiedzialny za ca³okszta³t R (= core + biblioteki)? Czêœciowo The R Core Team, czêœciowo autorzy bibliotek. SAS posiada oficjalny dzia³ testów, helpdesk, bierze odpowiedzialnoœæ za swój produkt. Do kogo zwróciæ siê z proœb¹ o pomoc albo... odszkodowanie? Licencja mówi jasno - "na twoje w³asne ryzyko". W tak sformalizowanym œrodowisku jak Clinical Research jest to argument najciê¿szego mo¿liwego kalibru. I dotyczy to ka¿dego niekomercyjnego oprogramowania.

Dobrze zorganizowany, œwiadomy problemu dzia³ biostatystyki rozwi¹zuje te zagadnienia wprowadzaj¹c wieloetapow¹ walidacjê wyników analiz przeprowadzanych w danym narzêdziu, zamra¿aj¹c wersjê u¿ytych bibliotek i wprowadzaj¹c repozytorium przetestowanych bloków kodu (makr, procedur). Jest to bardzo szerokie i trudne zagadnienie. Ma³o kto chce je podj¹æ, dlatego wygodniej wydaæ kilkaset tysiêcy z³otych na SAS i spaæ spokojnie.

Drugi problem to brak informacji. "Wszyscy u¿ywaj¹ SAS, bo nie ma nic lepszego, wiêc my te¿ go u¿yjemy". Informacja, ¿e istnieje darmowe oprogramowanie o nie tylko porównywalnych, ale miejscami du¿o wiêkszych mo¿liwoœciach powoduje niek³amane zdziwienie mened¿erów. Najlepiej przemawiaj¹ do nich liczby. Koszt licencji SAS potrzebnych do stworzenia trzech solidnych stanowisk to wydatek rzêdu kilkuset tysiêcy z³otych na rok. W tej bran¿y "darmowy = niebezpieczny".

**Co robisz, kiedy nie analizujesz danych?**

W wolnych chwilach ratujê od zapomnienia zabytkow¹ elektronikê, bez której nie by³oby tej dzisiejszej. Odkrywam na nowo rozwi¹zania pionierów elektrotechniki sprzed niemal wieku, przywracam do ¿ycia star¹ aparaturê kontrolno-pomiarow¹, kolekcjonujê zabytkowe i rzadkie podzespo³y i eksperymentujê z lampami elektronowymi.

**I na zakoñczenie, dla kogo jest to spotkanie i dlaczego warto przyjœæ?**

Spotkanie adresowane jest do osób wdra¿aj¹cych rozwi¹zania OpenSource w firmach, pracowników i mened¿erów dzia³ów analitycznych pragn¹cych poszerzyæ horyzonty i wreszcie - dla pasjonatów R.