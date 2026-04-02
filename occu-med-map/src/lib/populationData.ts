// 2020 US Census population, land area (sq mi), and density (pop/sq mi)
export interface StatePop {
  pop: number;
  area: number;  // land area sq mi
  density: number;  // people per sq mi
}

export const STATE_POP: Record<string, StatePop> = {
  AL: { pop: 5024279,  area: 50645,  density: 99.2  },
  AK: { pop: 733391,   area: 571951, density: 1.3   },
  AZ: { pop: 7151502,  area: 113590, density: 63.0  },
  AR: { pop: 3011524,  area: 52035,  density: 57.9  },
  CA: { pop: 39538223, area: 155779, density: 253.8 },
  CO: { pop: 5773714,  area: 103642, density: 55.7  },
  CT: { pop: 3605944,  area: 4842,   density: 744.9 },
  DE: { pop: 989948,   area: 1954,   density: 506.6 },
  DC: { pop: 689545,   area: 61,     density: 11303 },
  FL: { pop: 21538187, area: 53625,  density: 401.6 },
  GA: { pop: 10711908, area: 57513,  density: 186.2 },
  HI: { pop: 1455271,  area: 6423,   density: 226.7 },
  ID: { pop: 1839106,  area: 82643,  density: 22.3  },
  IL: { pop: 12812508, area: 55519,  density: 230.8 },
  IN: { pop: 6785528,  area: 35826,  density: 189.4 },
  IA: { pop: 3190369,  area: 55857,  density: 57.1  },
  KS: { pop: 2937880,  area: 81759,  density: 35.9  },
  KY: { pop: 4505836,  area: 39486,  density: 114.1 },
  LA: { pop: 4657757,  area: 43203,  density: 107.8 },
  ME: { pop: 1362359,  area: 30843,  density: 44.2  },
  MD: { pop: 6177224,  area: 9707,   density: 636.4 },
  MA: { pop: 7029917,  area: 7801,   density: 901.3 },
  MI: { pop: 10077331, area: 56804,  density: 177.4 },
  MN: { pop: 5706494,  area: 79627,  density: 71.7  },
  MS: { pop: 2961279,  area: 46923,  density: 63.1  },
  MO: { pop: 6154913,  area: 68742,  density: 89.5  },
  MT: { pop: 1084225,  area: 145546, density: 7.4   },
  NE: { pop: 1961504,  area: 76824,  density: 25.5  },
  NV: { pop: 3104614,  area: 109781, density: 28.3  },
  NH: { pop: 1377529,  area: 8953,   density: 153.9 },
  NJ: { pop: 9288994,  area: 7354,   density: 1263.0},
  NM: { pop: 2117522,  area: 121298, density: 17.5  },
  NY: { pop: 20201249, area: 47126,  density: 428.7 },
  NC: { pop: 10439388, area: 48618,  density: 214.7 },
  ND: { pop: 779094,   area: 69001,  density: 11.3  },
  OH: { pop: 11799448, area: 40861,  density: 288.7 },
  OK: { pop: 3959353,  area: 68595,  density: 57.7  },
  OR: { pop: 4237256,  area: 95988,  density: 44.1  },
  PA: { pop: 13002700, area: 44743,  density: 290.6 },
  RI: { pop: 1097379,  area: 1034,   density: 1061.5},
  SC: { pop: 5118425,  area: 30061,  density: 170.3 },
  SD: { pop: 886667,   area: 75811,  density: 11.7  },
  TN: { pop: 6910840,  area: 41235,  density: 167.6 },
  TX: { pop: 29145505, area: 261232, density: 111.6 },
  UT: { pop: 3271616,  area: 82170,  density: 39.8  },
  VT: { pop: 643077,   area: 9217,   density: 69.8  },
  VA: { pop: 8631393,  area: 39490,  density: 218.5 },
  WA: { pop: 7705281,  area: 66456,  density: 115.9 },
  WV: { pop: 1793716,  area: 24038,  density: 74.6  },
  WI: { pop: 5893718,  area: 54158,  density: 108.8 },
  WY: { pop: 576851,   area: 97093,  density: 5.9   },
};

/** Returns a fill color for the given density (people/sq mi) */
export function densityColor(density: number): string {
  if (density >= 1000) return '#1e3a8a'; // very high (RI, NJ, DC)
  if (density >= 400)  return '#1d4ed8'; // high (NY, FL, MD)
  if (density >= 200)  return '#2563eb'; // medium-high
  if (density >= 100)  return '#3b82f6'; // medium
  if (density >= 50)   return '#60a5fa'; // medium-low
  if (density >= 20)   return '#93c5fd'; // low
  if (density >= 5)    return '#bfdbfe'; // very low
  return '#dbeafe';                       // sparse (AK, WY)
}

export function densityLabel(density: number): string {
  if (density >= 1000) return 'Very Dense';
  if (density >= 400)  return 'Dense';
  if (density >= 200)  return 'Moderate-High';
  if (density >= 100)  return 'Moderate';
  if (density >= 50)   return 'Low-Moderate';
  if (density >= 20)   return 'Low';
  if (density >= 5)    return 'Sparse';
  return 'Very Sparse';
}
