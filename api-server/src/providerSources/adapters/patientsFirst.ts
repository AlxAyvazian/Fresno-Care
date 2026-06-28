import type { ProviderCandidate, CoordinateStatus, TrustTier } from "../types";

const RAW = `
Patients First Urgent Care|705 N. Battlefield Boulevard|Chesapeake|VA|23322-4901|(757)547-0688|(757)547-2902
Patients First Urgent Care|1239 Cedar Road|Chesapeake|VA|23322-7103|(757)549-9955|(757)312-0617
Patients First Urgent Care|611 Denbigh Boulevard|Newport News|VA|23608-4411|(757)283-8300|(757)283-0161
Patients First Urgent Care|1035 Independence Boulevard|Virginia Beach|VA|23455-6909|(757)721-0912|(757)721-6984
Patients First Urgent Care|2304 West Mercury Boulevard|Hampton|VA|23666-3115|(757)951-1579|(757)951-1580
Patients First Urgent Care|3432 Holland Road|Virginia Beach|VA|23452-4846|(757)468-1855|(757)468-4411
Patients First Urgent Care|5486 Indian River Road|Virginia Beach|VA|23464-5365|(757)424-2490|(757)423-0508
Patients First Urgent Care|332 Newtown Road|Virginia Beach|VA|23462-1793|(757)473-8400|(757)473-0712
Patients First Urgent Care|2425 Taylor Road|Chesapeake|VA|23321-2201|(757)215-1800|(757)215-1621
Patients First Urgent Care|938 Old York Road|Abington|PA|19001-4703|(267)620-0237|(267)620-0236
Patients First Urgent Care|3178 Tilghman Street|Allentown|PA|18104-4222|(610)844-9150|(610)844-9151
Patients First Urgent Care|2310 Schwenksville Road|Bethlehem|PA|18017-3602|(484)403-7560|(484)403-7561
Patients First Urgent Care|1411 S. Collegeville Road|Collegeville|PA|19426-2957|(484)902-1893|(484)902-1894
Patients First Urgent Care|1333 Olden Avenue|Ewing|PA|19333-1500|(484)582-8900|(484)582-8901
Patients First Urgent Care|967 East Lancaster Avenue|Downingtown|PA|19335-3328|(484)593-5160|(484)593-5161
Patients First Urgent Care|400 East Germantown Pike|East Norriton|PA|19401-6506|(610)994-0063|(610)994-0064
Patients First Urgent Care|2450 Butler Street|Easton|PA|18042-5303|(610)991-3136|(610)991-3137
Patients First Urgent Care|75 E Street Road|Feasterville-Trevose|PA|19053-6047|(267)684-1047|(267)684-1048
Patients First Urgent Care|100 Lincoln Highway|Fairless Hills|PA|19030-1008|(267)587-0775|(267)587-0776
Patients First Urgent Care|713 Bethlehem Pike|Montgomeryville|PA|18936-9602|(267)695-3944|(267)695-3945
Patients First Urgent Care|119 Shoemaker Road|Pottstown|PA|19464-6249|(610)427-4919|(610)427-4920
Patients First Urgent Care|417 Baltimore Pike|Springfield|PA|19064-3810|(484)470-2600|(484)470-2601
Patients First Urgent Care|2600 Paper Mill Road|Wyomissing|PA|19610-3362|(484)220-0051|(484)220-0052
Patients First Urgent Care|7855 Vervain Road|Hampstead|MD|21001-1175|(443)874-8800|(443)874-8801
Patients First Urgent Care|5100 Eastern Avenue|Baltimore|MD|21224-2772|(410)814-4500|(410)400-8600
Patients First Urgent Care|560 W. MacPhail Road|Bel Air|MD|21014-4320|(410)638-6480|(410)638-6481
Patients First Urgent Care|6333 Baltimore National Pike|Catonsville|MD|21228-3910|(443)514-1361|(443)514-1362
Patients First Urgent Care|5900 Cedar Lane|Columbia|MD|21044-3635|(443)718-4067|(443)718-4068
Patients First Urgent Care|7116 Ritchie Highway|Glen Burnie|MD|21061-2794|(443)577-0277|(443)577-0278
Patients First Urgent Care|3358 B Corridor Marketplace|Laurel|MD|20724-2381|(301)497-1820|(301)497-5489
Patients First Urgent Care|10755 Falls Road, Suite 160|Lutherville|MD|21093-4588|(410)583-2777|(410)583-2782
Patients First Urgent Care|1110 Annapolis Road|Odenton|MD|21113-1602|(443)351-3917|(443)351-3918
Patients First Urgent Care|10210 Restertown Road|Owings Mills|MD|21117-3606|(410)302-6776|(410)302-6936
Patients First Urgent Care|8101 Ritchie Highway|Pasadena|MD|21122-3305|(443)517-0564|(443)517-0565
Patients First Urgent Care|8830 Belair Road|Nottingham|MD|21236-2401|(410)529-9200|(410)529-9778
Patients First Urgent Care|9550 York Road|Towson|MD|21204-2513|(410)372-6373|(410)372-6374
Patients First Urgent Care|4924 Campbell Boulevard, Suite 125|Baltimore|MD|21236-5921|(443)461-1997|(443)461-1998
Patients First Urgent Care|2171 Route 70 West|Cherry Hill|NJ|08002-2733|(856)406-0023|(856)406-0024
Patients First Urgent Care|4000 Route 130 N., Building C|Delran|NJ|08075-2414|(856)705-0685|(856)705-0686
Patients First Urgent Care|641 US Highway Route 130|Hamilton|NJ|08691-2101|(609)245-2970|(609)245-2971
Patients First Urgent Care|606 Cross Keys Road|Sicklerville|NJ|08081-9513|(856)237-1016|(856)237-1017
Patients First Urgent Care|705 Haddonfield-Berlin Road|Voorhees|NJ|08043-3714|(856)679-0537|(856)679-0538
Patients First Urgent Care|630 Mantua Pike|Woodbury|NJ|08096-3233|(856)812-2220|(856)812-2221
Patients First Urgent Care|6311 Richmond Highway|Alexandria|VA|22306-6410|(703)647-6007|(703)647-6008
Patients First Urgent Care|12101 Lee-Jackson Memorial Turnpike|Annandale|VA|22003|(703)348-7125|(703)348-7126
Patients First Urgent Care|2051 West Street|Annapolis|MD|21401-3006|(443)603-0758|(443)603-0759
Patients First Urgent Care|13671 Georgia Avenue|Aspen Hill|MD|20906|(240)514-0000|(240)514-0001
Patients First Urgent Care|10424 Baltimore Avenue|Beltsville|MD|20705-2321|(240)542-5987|(240)542-5988
Patients First Urgent Care|15459 Annapolis Road|Bowie|MD|20715-1847|(240)544-0676|(240)544-0677
Patients First Urgent Care|1670 Ritchie Station Court|Capitol Heights|MD|20743|(240)765-1406|(240)765-1407
Patients First Urgent Care|3031 Plank Road|Fredericksburg|VA|22401-4951|(540)736-5043|(540)736-5044
Patients First Urgent Care|3918 Centreville Road|Chantilly|VA|20151-3224|(703)657-6925|(703)657-6926
Patients First Urgent Care|9000 Woodyard Road|Clinton|MD|20735-4206|(240)546-3428|(240)546-3429
Patients First Urgent Care|10100 Fairfax Boulevard|Fairfax|VA|22030-2000|(703)679-1876|(703)679-1877
Patients First Urgent Care|8503 Richmond Highway #2|Falls Church|VA|22046-2310|(703)771-8431|(703)771-8432
Patients First Urgent Care|14800 Lee Highway|Gainesville|VA|20155-1842|(703)743-7017|(703)743-7018
Patients First Urgent Care|60 Prosperity Lane|Stafford|VA|22556-4605|(540)658-2811|(540)658-2812
Patients First Urgent Care|21044 Frederick Lane|Germantown|MD|20876|(240)235-5433|(240)235-5434
Patients First Urgent Care|2199 Old Bridge Road|Lake Ridge|VA|22192-2911|(703)357-9707|(703)357-9708
Patients First Urgent Care|6201 Annapolis Road|Landover Hills|MD|20784-1307|(301)276-3777|(301)276-3778
Patients First Urgent Care|601 Potomac Station Drive|Leesburg|VA|20176-1816|(703)840-1396|(703)840-1397
Patients First Urgent Care|9715 Liberia Avenue|Manassas|VA|20110-5837|(571)229-1797|(571)229-1798
Patients First Urgent Care|7206 Rockville Pike|Rockville|MD|20852-1133|(240)238-0411|(240)238-0412
Patients First Urgent Care|8206 Georgia Ave|Silver Spring|MD|20910-4519|(301)960-4683|(301)960-4684
Patients First Urgent Care|7422 Centreville Road|Manassas|VA|20111-5606|(703)968-1121|(703)968-1122
Patients First Urgent Care|2655 Crain Highway|Waldorf|MD|20601-2840|(240)427-1926|(240)427-1927
Patients First Urgent Care|12 N. Thompson Street|Richmond|VA|23221-2718|(804)359-1937|(804)359-1938
Patients First Urgent Care|12101 S. Chalkley Avenue|Chester|VA|23831-3755|(804)796-3636|(804)796-3657
Patients First Urgent Care|1260 Temple Avenue|Colonial Heights|VA|23834-2984|(804)518-2597|(804)518-2598
Patients First Urgent Care|11020 Hull Street Road|Midlothian|VA|23112-3200|(804)744-6310|(804)744-6319
Patients First Urgent Care|7238 Mechanicsville Turnpike|Mechanicsville|VA|23111-3502|(804)559-9900|(804)559-6530
Patients First Urgent Care|8110 Midlothian Road|Richmond|VA|23235-5116|(804)320-8160|(804)320-2189
Patients First Urgent Care|2205 N. Parham Road|Richmond|VA|23229-3161|(804)270-2150|(804)346-3191
Patients First Urgent Care|3370 Pump Road|Richmond|VA|23233-1130|(804)360-8061|(804)360-5494
Patients First Urgent Care|7037 Forest Hill Avenue|Richmond|VA|23225-3114|(804)362-8812|(804)362-8813
Patients First Urgent Care|5125 Commonwealth Avenue, Suite 105|Fredericksburg|VA|22407-3985|(571)943-1566|(571)943-1567
Patients First Urgent Care|2960 East Market Street|York|PA|17402-2414|(717)751-2483|(717)751-2496
Patients First Urgent Care|1525 Oregon Pike|Lancaster|PA|17601-4335|(717)925-2995|(717)925-2996
Patients First Urgent Care|107 South Sporting Hill Road|Mechanicsburg|PA|17050-3058|(717)943-1781|(717)943-1782
`;

function parse(): ProviderCandidate[] {
  return RAW.trim().split("\n").map((line, i) => {
    const [name, address, city, state, postalCode, phone, fax] = line.split("|");
    return {
      id: `pf-${i + 1}`,
      name: name || "",
      address: address || "",
      city: city || "",
      state: state || "",
      postalCode: postalCode || "",
      phone: phone || "",
      fax: fax || "",
      website: "",
      coordinateStatus: "unverified" as CoordinateStatus,
      source: "Patients First",
      sourceDetail: "Patients First Urgent Care — Manual Import",
      sourceUrl: "",
      confidence: "high" as const,
      trustTier: "verified" as TrustTier,
      score: 100,
      badges: ["Occu-Med Confirmed", "Patients First"],
      evidence: [{
        serviceDetected: "urgent care",
        evidenceUrl: "",
        evidenceTextSnippet: "Patients First Urgent Care location confirmed via internal clinic list",
        confidence: 95,
        source: "Manual Import",
      }],
      _rawSources: ["Patients First"],
    };
  });
}

export function searchPatientsFirst(_city: string, _state: string): ProviderCandidate[] {
  // Returns all clinics regardless of city/state filter.
  // The orchestrator geocodes and distance-sorts later.
  return parse();
}
