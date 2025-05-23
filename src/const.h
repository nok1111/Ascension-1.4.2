// Copyright 2022 The Forgotten Server Authors. All rights reserved.
// Use of this source code is governed by the GPL-2.0 License that can be found in the LICENSE file.

#ifndef FS_CONST_H_0A49B5996F074465BF44B90F4F780E8B
#define FS_CONST_H_0A49B5996F074465BF44B90F4F780E8B


static constexpr int32_t NETWORKMESSAGE_MAXSIZE = 65500; //65500 original

enum MagicEffectClasses : uint16_t {
	CONST_ME_NONE,

	CONST_ME_DRAWBLOOD = 1,
	CONST_ME_LOSEENERGY = 2,
	CONST_ME_POFF = 3,
	CONST_ME_BLOCKHIT = 4,
	CONST_ME_EXPLOSIONAREA = 5,
	CONST_ME_EXPLOSIONHIT = 6,
	CONST_ME_FIREAREA = 7,
	CONST_ME_YELLOW_RINGS = 8,
	CONST_ME_GREEN_RINGS = 9,
	CONST_ME_HITAREA = 10,
	CONST_ME_TELEPORT = 11,
	CONST_ME_ENERGYHIT = 12,
	CONST_ME_MAGIC_BLUE = 13,
	CONST_ME_MAGIC_RED = 14,
	CONST_ME_MAGIC_GREEN = 15,
	CONST_ME_HITBYFIRE = 16,
	CONST_ME_HITBYPOISON = 17,
	CONST_ME_MORTAREA = 18,
	CONST_ME_SOUND_GREEN = 19,
	CONST_ME_SOUND_RED = 20,
	CONST_ME_POISONAREA = 21,
	CONST_ME_SOUND_YELLOW = 22,
	CONST_ME_SOUND_PURPLE = 23,
	CONST_ME_SOUND_BLUE = 24,
	CONST_ME_SOUND_WHITE = 25,
	CONST_ME_BUBBLES = 26,
	CONST_ME_CRAPS = 27,
	CONST_ME_GIFT_WRAPS = 28,
	CONST_ME_FIREWORK_YELLOW = 29,
	CONST_ME_FIREWORK_RED = 30,
	CONST_ME_FIREWORK_BLUE = 31,
	CONST_ME_STUN = 32,
	CONST_ME_SLEEP = 33,
	CONST_ME_WATERCREATURE = 34,
	CONST_ME_GROUNDSHAKER = 35,
	CONST_ME_HEARTS = 36,
	CONST_ME_FIREATTACK = 37,
	CONST_ME_ENERGYAREA = 38,
	CONST_ME_SMALLCLOUDS = 39,
	CONST_ME_HOLYDAMAGE = 40,
	CONST_ME_BIGCLOUDS = 41,
	CONST_ME_ICEAREA = 42,
	CONST_ME_ICETORNADO = 43,
	CONST_ME_ICEATTACK = 44,
	CONST_ME_STONES = 45,
	CONST_ME_SMALLPLANTS = 46,
	CONST_ME_CARNIPHILA = 47,
	CONST_ME_PURPLEENERGY = 48,
	CONST_ME_YELLOWENERGY = 49,
	CONST_ME_HOLYAREA = 50,
	CONST_ME_BIGPLANTS = 51,
	CONST_ME_CAKE = 52,
	CONST_ME_GIANTICE = 53,
	CONST_ME_WATERSPLASH = 54,
	CONST_ME_PLANTATTACK = 55,
	CONST_ME_TUTORIALARROW = 56,
	CONST_ME_TUTORIALSQUARE = 57,
	CONST_ME_MIRRORHORIZONTAL = 58,
	CONST_ME_MIRRORVERTICAL = 59,
	CONST_ME_SKULLHORIZONTAL = 60,
	CONST_ME_SKULLVERTICAL = 61,
	CONST_ME_ASSASSIN = 62,
	CONST_ME_STEPSHORIZONTAL = 63,
	CONST_ME_BLOODYSTEPS = 64,
	CONST_ME_STEPSVERTICAL = 65,
	CONST_ME_YALAHARIGHOST = 66,
	CONST_ME_BATS = 67,
	CONST_ME_SMOKE = 68,
	CONST_ME_INSECTS = 69,
	CONST_ME_DRAGONHEAD = 70,
	CONST_ME_ORCSHAMAN = 71,
	CONST_ME_ORCSHAMAN_FIRE = 72,
	CONST_ME_THUNDER = 73,
	CONST_ME_FERUMBRAS = 74,
	CONST_ME_CONFETTI_HORIZONTAL = 75,
	CONST_ME_CONFETTI_VERTICAL = 76,
	// 77-157 are empty
	CONST_ME_BLACKSMOKE = 158,
	// 159-166 are empty
	CONST_ME_REDSMOKE = 167,
	CONST_ME_YELLOWSMOKE = 168,
	CONST_ME_GREENSMOKE = 169,
	CONST_ME_PURPLESMOKE = 170,
	CONST_ME_EARLY_THUNDER = 171,
	CONST_ME_RAGIAZ_BONECAPSULE = 172,
	CONST_ME_CRITICAL_DAMAGE = 173,
	// 174 is empty
	CONST_ME_PLUNGING_FISH = 175,

	CONST_ME_176 = 176,
	CONST_ME_177 = 177,
	CONST_ME_178 = 178,
	CONST_ME_179 = 179,
	CONST_ME_180 = 180,
	CONST_ME_181 = 181,
	CONST_ME_182 = 182,
	CONST_ME_183 = 183,
	CONST_ME_184 = 184,
	CONST_ME_185 = 185,
	CONST_ME_186 = 186,
	CONST_ME_187 = 187,
	CONST_ME_188 = 188,
	CONST_ME_189 = 189,
	CONST_ME_190 = 190,
	CONST_ME_191 = 191,
	CONST_ME_192 = 192,
	CONST_ME_193 = 193,
	CONST_ME_194 = 194,
	CONST_ME_195 = 195,
	CONST_ME_196 = 196,
	CONST_ME_197 = 197,
	CONST_ME_198 = 198,
	CONST_ME_199 = 199,
	CONST_ME_200 = 200,
	CONST_ME_201 = 201,
	CONST_ME_202 = 202,
	CONST_ME_203 = 203,
	CONST_ME_204 = 204,
	CONST_ME_205 = 205,
	CONST_ME_206 = 206,
	CONST_ME_207 = 207,
	CONST_ME_208 = 208,
	CONST_ME_209 = 209,
	CONST_ME_210 = 210,
	CONST_ME_211 = 211,
	CONST_ME_212 = 212,
	CONST_ME_213 = 213,
	CONST_ME_214 = 214,
	CONST_ME_215 = 215,
	CONST_ME_216 = 216,
	CONST_ME_217 = 217,
	CONST_ME_218 = 218,
	CONST_ME_219 = 219,
	CONST_ME_220 = 220,
	CONST_ME_221 = 221,
	CONST_ME_222 = 222,
	CONST_ME_223 = 223,
	CONST_ME_224 = 224,
	CONST_ME_225 = 225,
	CONST_ME_226 = 226,
	CONST_ME_227 = 227,
	CONST_ME_228 = 228,
	CONST_ME_229 = 229,
	CONST_ME_230 = 230,
	CONST_ME_231 = 231,
	CONST_ME_232 = 232,
	CONST_ME_233 = 233,
	CONST_ME_234 = 234,
	CONST_ME_235 = 235,
	CONST_ME_236 = 236,
	CONST_ME_237 = 237,
	CONST_ME_238 = 238,
	CONST_ME_239 = 239,
	CONST_ME_240 = 240,
	CONST_ME_241 = 241,
	CONST_ME_242 = 242,
	CONST_ME_243 = 243,
	CONST_ME_244 = 244,
	CONST_ME_245 = 245,
	CONST_ME_246 = 246,
	CONST_ME_247 = 247,
	CONST_ME_248 = 248,
	CONST_ME_249 = 249,
	CONST_ME_250 = 250,
	CONST_ME_251 = 251,
	CONST_ME_252 = 252,
	CONST_ME_253 = 253,
	CONST_ME_254 = 254,
	CONST_ME_255 = 255,
	CONST_ME_256 = 256,
	CONST_ME_257 = 257,
	CONST_ME_258 = 258,
	CONST_ME_259 = 259,
	CONST_ME_260 = 260,
	CONST_ME_261 = 261,
	CONST_ME_262 = 262,
	CONST_ME_263 = 263,
	CONST_ME_264 = 264,
	CONST_ME_265 = 265,
	CONST_ME_266 = 266,
	CONST_ME_267 = 267,
	CONST_ME_268 = 268,
	CONST_ME_269 = 269,
	CONST_ME_270 = 270,
	CONST_ME_271 = 271,
	CONST_ME_272 = 272,
	CONST_ME_273 = 273,
	CONST_ME_274 = 274,
	CONST_ME_275 = 275,
	CONST_ME_276 = 276,
	CONST_ME_277 = 277,
	CONST_ME_278 = 278,
	CONST_ME_279 = 279,
	CONST_ME_280 = 280,
	CONST_ME_281 = 281,
	CONST_ME_282 = 282,
	CONST_ME_283 = 283,
	CONST_ME_284 = 284,
	CONST_ME_285 = 285,
	CONST_ME_286 = 286,
	CONST_ME_287 = 287,
	CONST_ME_288 = 288,
	CONST_ME_289 = 289,
	CONST_ME_290 = 290,
	CONST_ME_291 = 291,
	CONST_ME_292 = 292,
	CONST_ME_293 = 293,
	CONST_ME_294 = 294,
	CONST_ME_295 = 295,
	CONST_ME_296 = 296,
	CONST_ME_297 = 297,
	CONST_ME_298 = 298,
	CONST_ME_299 = 299,
	CONST_ME_300 = 300,
	CONST_ME_301 = 301,
	CONST_ME_302 = 302,
	CONST_ME_303 = 303,
	CONST_ME_304 = 304,
	CONST_ME_305 = 305,
	CONST_ME_306 = 306,
	CONST_ME_307 = 307,
	CONST_ME_308 = 308,
	CONST_ME_309 = 309,
	CONST_ME_310 = 310,
	CONST_ME_311 = 311,
	CONST_ME_312 = 312,
	CONST_ME_313 = 313,
	CONST_ME_314 = 314,
	CONST_ME_315 = 315,
	CONST_ME_316 = 316,
	CONST_ME_317 = 317,
	CONST_ME_318 = 318,
	CONST_ME_319 = 319,
	CONST_ME_320 = 320,
	CONST_ME_321 = 321,
	CONST_ME_322 = 322,
	CONST_ME_323 = 323,
	CONST_ME_324 = 324,
	CONST_ME_325 = 325,
	CONST_ME_326 = 326,
	CONST_ME_327 = 327,
	CONST_ME_328 = 328,
	CONST_ME_329 = 329,
	CONST_ME_330 = 330,
	CONST_ME_331 = 331,
	CONST_ME_332 = 332,
	CONST_ME_333 = 333,
	CONST_ME_334 = 334,
	CONST_ME_335 = 335,
	CONST_ME_336 = 336,
	CONST_ME_337 = 337,
	CONST_ME_338 = 338,
	CONST_ME_339 = 339,
	CONST_ME_340 = 340,
	CONST_ME_341 = 341,
	CONST_ME_342 = 342,
	CONST_ME_343 = 343,
	CONST_ME_344 = 344,
	CONST_ME_345 = 345,
	CONST_ME_346 = 346,
	CONST_ME_347 = 347,
	CONST_ME_348 = 348,
	CONST_ME_349 = 349,
	CONST_ME_350 = 350,
	CONST_ME_351 = 351,
	CONST_ME_352 = 352,
	CONST_ME_353 = 353,
	CONST_ME_354 = 354,
	CONST_ME_355 = 355,
	CONST_ME_356 = 356,
	CONST_ME_357 = 357,
	CONST_ME_358 = 358,
	CONST_ME_359 = 359,
	CONST_ME_360 = 360,
	CONST_ME_361 = 361,
	CONST_ME_362 = 362,
	CONST_ME_363 = 363,
	CONST_ME_364 = 364,
	CONST_ME_365 = 365,
	CONST_ME_366 = 366,
	CONST_ME_367 = 367,
	CONST_ME_368 = 368,
	CONST_ME_369 = 369,
	CONST_ME_370 = 370,
	CONST_ME_371 = 371,
	CONST_ME_372 = 372,
	CONST_ME_373 = 373,
	CONST_ME_374 = 374,
	CONST_ME_375 = 375,
	CONST_ME_376 = 376,
	CONST_ME_377 = 377,
	CONST_ME_378 = 378,
	CONST_ME_379 = 379,
	CONST_ME_380 = 380,
	CONST_ME_381 = 381,
	CONST_ME_382 = 382,
	CONST_ME_383 = 383,
	CONST_ME_384 = 384,
	CONST_ME_385 = 385,
	CONST_ME_386 = 386,
	CONST_ME_387 = 387,
	CONST_ME_388 = 388,
	CONST_ME_389 = 389,
	CONST_ME_390 = 390,
	CONST_ME_391 = 391,
	CONST_ME_392 = 392,
	CONST_ME_393 = 393,
	CONST_ME_394 = 394,
	CONST_ME_395 = 395,
	CONST_ME_396 = 396,
	CONST_ME_397 = 397,
	CONST_ME_398 = 398,
	CONST_ME_399 = 399,
	CONST_ME_400 = 400,
	CONST_ME_401 = 401,
	CONST_ME_402 = 402,
	CONST_ME_403 = 403,
	CONST_ME_404 = 404,
	CONST_ME_405 = 405,
	CONST_ME_406 = 406,
	CONST_ME_407 = 407,
	CONST_ME_408 = 408,
	CONST_ME_409 = 409,
	CONST_ME_410 = 410,
	CONST_ME_411 = 411,
	CONST_ME_412 = 412,
	CONST_ME_413 = 413,
	CONST_ME_414 = 414,
	CONST_ME_415 = 415,
	CONST_ME_416 = 416,
	CONST_ME_417 = 417,
	CONST_ME_418 = 418,
	CONST_ME_419 = 419,
	CONST_ME_420 = 420,
	CONST_ME_421 = 421,
	CONST_ME_422 = 422,
	CONST_ME_423 = 423,
	CONST_ME_424 = 424,
	CONST_ME_425 = 425,
	CONST_ME_426 = 426,
	CONST_ME_427 = 427,
	CONST_ME_428 = 428,
	CONST_ME_429 = 429,
	CONST_ME_430 = 430,
	CONST_ME_431 = 431,
	CONST_ME_432 = 432,
	CONST_ME_433 = 433,
	CONST_ME_434 = 434,
	CONST_ME_435 = 435,
	CONST_ME_436 = 436,
	CONST_ME_437 = 437,
	CONST_ME_438 = 438,
	CONST_ME_439 = 439,
	CONST_ME_440 = 440,
	CONST_ME_441 = 441,
	CONST_ME_442 = 442,
	CONST_ME_443 = 443,
	CONST_ME_444 = 444,
	CONST_ME_445 = 445,
	CONST_ME_446 = 446,
	CONST_ME_447 = 447,
	CONST_ME_448 = 448,
	CONST_ME_449 = 449,
	CONST_ME_450 = 450,
	CONST_ME_451 = 451,
	CONST_ME_452 = 452,
	CONST_ME_453 = 453,
	CONST_ME_454 = 454,
	CONST_ME_455 = 455,
	CONST_ME_456 = 456,
	CONST_ME_457 = 457,
	CONST_ME_458 = 458,
	CONST_ME_459 = 459,
	CONST_ME_460 = 460,
	CONST_ME_461 = 461,
	CONST_ME_462 = 462,
	CONST_ME_463 = 463,
	CONST_ME_464 = 464,
	CONST_ME_465 = 465,
	CONST_ME_466 = 466,
	CONST_ME_467 = 467,
	CONST_ME_468 = 468,
	CONST_ME_469 = 469,
	CONST_ME_470 = 470,
	CONST_ME_471 = 471,
	CONST_ME_472 = 472,
	CONST_ME_473 = 473,
	CONST_ME_474 = 474,
	CONST_ME_475 = 475,
	CONST_ME_476 = 476,
	CONST_ME_477 = 477,
	CONST_ME_478 = 478,
	CONST_ME_479 = 479,
	CONST_ME_480 = 480,
	CONST_ME_481 = 481,
	CONST_ME_482 = 482,
	CONST_ME_483 = 483,
	CONST_ME_484 = 484,
	CONST_ME_485 = 485,
	CONST_ME_486 = 486,
	CONST_ME_487 = 487,
	CONST_ME_488 = 488,
	CONST_ME_489 = 489,
	CONST_ME_490 = 490,
	CONST_ME_491 = 491,
	CONST_ME_492 = 492,
	CONST_ME_493 = 493,
	CONST_ME_494 = 494,
	CONST_ME_495 = 495,
	CONST_ME_496 = 496,
	CONST_ME_497 = 497,
	CONST_ME_498 = 498,
	CONST_ME_499 = 499,
	CONST_ME_500 = 500,
	CONST_ME_501 = 501,
	CONST_ME_502 = 502,
	CONST_ME_503 = 503,
	CONST_ME_504 = 504,
	CONST_ME_505 = 505,
	CONST_ME_506 = 506,
	CONST_ME_507 = 507,
	CONST_ME_508 = 508,
	CONST_ME_509 = 509,
	CONST_ME_510 = 510,
	CONST_ME_511 = 511,
	CONST_ME_512 = 512,
	CONST_ME_513 = 513,
	CONST_ME_514 = 514,
	CONST_ME_515 = 515,
	CONST_ME_516 = 516,
	CONST_ME_517 = 517,
	CONST_ME_518 = 518,
	CONST_ME_519 = 519,
	CONST_ME_520 = 520,
	CONST_ME_521 = 521,
	CONST_ME_522 = 522,
	CONST_ME_523 = 523,
	CONST_ME_524 = 524,
	CONST_ME_525 = 525,
	CONST_ME_526 = 526,
	CONST_ME_527 = 527,
	CONST_ME_528 = 528,
	CONST_ME_529 = 529,
	CONST_ME_530 = 530,
	CONST_ME_531 = 531,
	CONST_ME_532 = 532,
	CONST_ME_533 = 533,
	CONST_ME_534 = 534,
	CONST_ME_535 = 535,
	CONST_ME_536 = 536,
	CONST_ME_537 = 537,
	CONST_ME_538 = 538,
	CONST_ME_539 = 539,
	CONST_ME_540 = 540,
	CONST_ME_541 = 541,
	CONST_ME_542 = 542,
	CONST_ME_543 = 543,
	CONST_ME_544 = 544,
	CONST_ME_545 = 545,
	CONST_ME_546 = 546,
	CONST_ME_547 = 547,
	CONST_ME_548 = 548,
	CONST_ME_549 = 549,
	CONST_ME_550 = 550,
	CONST_ME_551 = 551,
	CONST_ME_552 = 552,
	CONST_ME_553 = 553,
	CONST_ME_554 = 554,
	CONST_ME_555 = 555,
	CONST_ME_556 = 556,
	CONST_ME_557 = 557,
	CONST_ME_558 = 558,
	CONST_ME_559 = 559,
	CONST_ME_560 = 560,
	CONST_ME_561 = 561,
	CONST_ME_562 = 562,
	CONST_ME_563 = 563,
	CONST_ME_564 = 564,
	CONST_ME_565 = 565,
	CONST_ME_566 = 566,
	CONST_ME_567 = 567,
	CONST_ME_568 = 568,
	CONST_ME_569 = 569,
	CONST_ME_570 = 570,
	CONST_ME_571 = 571,
	CONST_ME_572 = 572,
	CONST_ME_573 = 573,
	CONST_ME_574 = 574,
	CONST_ME_575 = 575,
	CONST_ME_576 = 576,
	CONST_ME_577 = 577,
	CONST_ME_578 = 578,
	CONST_ME_579 = 579,
	CONST_ME_580 = 580,
	CONST_ME_581 = 581,
	CONST_ME_582 = 582,
	CONST_ME_583 = 583,
	CONST_ME_584 = 584,
	CONST_ME_585 = 585,
	CONST_ME_586 = 586,
	CONST_ME_587 = 587,
	CONST_ME_588 = 588,
	CONST_ME_589 = 589,
	CONST_ME_590 = 590,
	CONST_ME_591 = 591,
	CONST_ME_592 = 592,
	CONST_ME_593 = 593,
	CONST_ME_594 = 594,
	CONST_ME_595 = 595,
	CONST_ME_596 = 596,
	CONST_ME_597 = 597,
	CONST_ME_598 = 598,
	CONST_ME_599 = 599,
	CONST_ME_600 = 600,
	CONST_ME_601 = 601,
	CONST_ME_602 = 602,
	CONST_ME_603 = 603,
	CONST_ME_604 = 604,
	CONST_ME_605 = 605,
	CONST_ME_606 = 606,
	CONST_ME_607 = 607,
	CONST_ME_608 = 608,
	CONST_ME_609 = 609,
	CONST_ME_610 = 610,
	CONST_ME_611 = 611,
	CONST_ME_612 = 612,
	CONST_ME_613 = 613,
	CONST_ME_614 = 614,
	CONST_ME_615 = 615,
	CONST_ME_616 = 616,
	CONST_ME_617 = 617,
	CONST_ME_618 = 618,
	CONST_ME_619 = 619,
	CONST_ME_620 = 620,
	CONST_ME_621 = 621,
	CONST_ME_622 = 622,
	CONST_ME_623 = 623,
	CONST_ME_624 = 624,
	CONST_ME_625 = 625,
	CONST_ME_626 = 626,
	CONST_ME_627 = 627,
	CONST_ME_628 = 628,
	CONST_ME_629 = 629,
	CONST_ME_630 = 630,
	CONST_ME_631 = 631,
	CONST_ME_632 = 632,
	CONST_ME_633 = 633,
	CONST_ME_634 = 634,
	CONST_ME_635 = 635,
	CONST_ME_636 = 636,
	CONST_ME_637 = 637,
	CONST_ME_638 = 638,
	CONST_ME_639 = 639,
	CONST_ME_640 = 640,
	CONST_ME_641 = 641,
	CONST_ME_642 = 642,
	CONST_ME_643 = 643,
	CONST_ME_644 = 644,
	CONST_ME_645 = 645,
	CONST_ME_646 = 646,
	CONST_ME_647 = 647,
	CONST_ME_648 = 648,
	CONST_ME_649 = 649,
	CONST_ME_650 = 650,
	CONST_ME_651 = 651,
	CONST_ME_652 = 652,
	CONST_ME_653 = 653,
	CONST_ME_654 = 654,
	CONST_ME_655 = 655,
	CONST_ME_656 = 656,
	CONST_ME_657 = 657,
	CONST_ME_658 = 658,
	CONST_ME_659 = 659,
	CONST_ME_660 = 660,
	CONST_ME_661 = 661,
	CONST_ME_662 = 662,
	CONST_ME_663 = 663,
	CONST_ME_664 = 664,
	CONST_ME_665 = 665,
	CONST_ME_666 = 666,
	CONST_ME_667 = 667,
	CONST_ME_668 = 668,
	CONST_ME_669 = 669,
	CONST_ME_670 = 670,
	CONST_ME_671 = 671,
	CONST_ME_672 = 672,
	CONST_ME_673 = 673,
	CONST_ME_674 = 674,
	CONST_ME_675 = 675,
	CONST_ME_676 = 676,
	CONST_ME_677 = 677,
	CONST_ME_678 = 678,
	CONST_ME_679 = 679,
	CONST_ME_680 = 680,
	CONST_ME_681 = 681,
	CONST_ME_682 = 682,
	CONST_ME_683 = 683,
	CONST_ME_684 = 684,
	CONST_ME_685 = 685,
	CONST_ME_686 = 686,
	CONST_ME_687 = 687,
	CONST_ME_688 = 688,
	CONST_ME_689 = 689,
	CONST_ME_690 = 690,
	CONST_ME_691 = 691,
	CONST_ME_692 = 692,
	CONST_ME_693 = 693,
	CONST_ME_694 = 694,
	CONST_ME_695 = 695,
	CONST_ME_696 = 696,
	CONST_ME_697 = 697,
	CONST_ME_698 = 698,
	CONST_ME_699 = 699,
	CONST_ME_700 = 700,
	CONST_ME_701 = 701,
	CONST_ME_702 = 702,
	CONST_ME_703 = 703,
	CONST_ME_704 = 704,
	CONST_ME_705 = 705,
	CONST_ME_706 = 706,
	CONST_ME_707 = 707,
	CONST_ME_708 = 708,
	CONST_ME_709 = 709,
	CONST_ME_710 = 710,
	CONST_ME_711 = 711,
	CONST_ME_712 = 712,
	CONST_ME_713 = 713,
	CONST_ME_714 = 714,
	CONST_ME_715 = 715,
	CONST_ME_716 = 716,
	CONST_ME_717 = 717,
	CONST_ME_718 = 718,
	CONST_ME_719 = 719,
	CONST_ME_720 = 720,
	CONST_ME_721 = 721,
	CONST_ME_722 = 722,
	CONST_ME_723 = 723,
	CONST_ME_724 = 724,
	CONST_ME_725 = 725,
	CONST_ME_726 = 726,
	CONST_ME_727 = 727,
	CONST_ME_728 = 728,
	CONST_ME_729 = 729,
	CONST_ME_730 = 730,
	CONST_ME_731 = 731,
	CONST_ME_732 = 732,
	CONST_ME_733 = 733,
	CONST_ME_734 = 734,
	CONST_ME_735 = 735,
	CONST_ME_736 = 736,
	CONST_ME_737 = 737,
	CONST_ME_738 = 738

};

enum ShootType_t : uint8_t {
	CONST_ANI_NONE,

	CONST_ANI_SPEAR = 1,
	CONST_ANI_BOLT = 2,
	CONST_ANI_ARROW = 3,
	CONST_ANI_FIRE = 4,
	CONST_ANI_ENERGY = 5,
	CONST_ANI_POISONARROW = 6,
	CONST_ANI_BURSTARROW = 7,
	CONST_ANI_THROWINGSTAR = 8,
	CONST_ANI_THROWINGKNIFE = 9,
	CONST_ANI_SMALLSTONE = 10,
	CONST_ANI_DEATH = 11,
	CONST_ANI_LARGEROCK = 12,
	CONST_ANI_SNOWBALL = 13,
	CONST_ANI_POWERBOLT = 14,
	CONST_ANI_POISON = 15,
	CONST_ANI_INFERNALBOLT = 16,
	CONST_ANI_HUNTINGSPEAR = 17,
	CONST_ANI_ENCHANTEDSPEAR = 18,
	CONST_ANI_REDSTAR = 19,
	CONST_ANI_GREENSTAR = 20,
	CONST_ANI_ROYALSPEAR = 21,
	CONST_ANI_SNIPERARROW = 22,
	CONST_ANI_ONYXARROW = 23,
	CONST_ANI_PIERCINGBOLT = 24,
	CONST_ANI_WHIRLWINDSWORD = 25,
	CONST_ANI_WHIRLWINDAXE = 26,
	CONST_ANI_WHIRLWINDCLUB = 27,
	CONST_ANI_ETHEREALSPEAR = 28,
	CONST_ANI_ICE = 29,
	CONST_ANI_EARTH = 30,
	CONST_ANI_HOLY = 31,
	CONST_ANI_SUDDENDEATH = 32,
	CONST_ANI_FLASHARROW = 33,
	CONST_ANI_FLAMMINGARROW = 34,
	CONST_ANI_SHIVERARROW = 35,
	CONST_ANI_ENERGYBALL = 36,
	CONST_ANI_SMALLICE = 37,
	CONST_ANI_SMALLHOLY = 38,
	CONST_ANI_SMALLEARTH = 39,
	CONST_ANI_EARTHARROW = 40,
	CONST_ANI_EXPLOSION = 41,
	CONST_ANI_CAKE = 42,

	CONST_ANI_TARSALARROW = 44,
	CONST_ANI_VORTEXBOLT = 45,

	CONST_ANI_PRISMATICBOLT = 48,
	CONST_ANI_CRYSTALLINEARROW = 49,
	CONST_ANI_DRILLBOLT = 50,
	CONST_ANI_ENVENOMEDARROW = 51,

	CONST_ANI_GLOOTHSPEAR = 53,
	CONST_ANI_SIMPLEARROW = 54,

	CONST_ANI_56 = 56,
	CONST_ANI_57 = 57,
	CONST_ANI_58 = 58,
	CONST_ANI_59 = 59,
	CONST_ANI_60 = 60,
	CONST_ANI_61 = 61,
	CONST_ANI_62 = 62,
	CONST_ANI_63 = 63,
	CONST_ANI_64 = 64,
	CONST_ANI_65 = 65,
	CONST_ANI_66 = 66,
	CONST_ANI_67 = 67,
	CONST_ANI_68 = 68,
	CONST_ANI_69 = 69,
	CONST_ANI_70 = 70,
	CONST_ANI_71 = 71,
	CONST_ANI_72 = 72,
	CONST_ANI_73 = 73,
	CONST_ANI_74 = 74,
	CONST_ANI_75 = 75,
	CONST_ANI_76 = 76,
	CONST_ANI_77 = 77,
	CONST_ANI_78 = 78,
	CONST_ANI_79 = 79,
	CONST_ANI_80 = 80,
	CONST_ANI_81 = 81,
	CONST_ANI_82 = 82,
	CONST_ANI_83 = 83,
	CONST_ANI_84 = 84,
	CONST_ANI_85 = 85,
	CONST_ANI_86 = 86,
	CONST_ANI_87 = 87,
	CONST_ANI_88 = 88,
	CONST_ANI_89 = 89,
	CONST_ANI_90 = 90,
	CONST_ANI_91 = 91,
	CONST_ANI_92 = 92,
	CONST_ANI_93 = 93,
	CONST_ANI_94 = 94,
	CONST_ANI_95 = 95,
	CONST_ANI_96 = 96,
	CONST_ANI_97 = 97,
	CONST_ANI_98 = 98,
	CONST_ANI_99 = 99,
	CONST_ANI_100 = 100,
	CONST_ANI_101 = 101,
	CONST_ANI_102 = 102,
	CONST_ANI_103 = 103,
	CONST_ANI_104 = 104,
	CONST_ANI_105 = 105,
	CONST_ANI_106 = 106,
	CONST_ANI_107 = 107,
	CONST_ANI_108 = 108,
	CONST_ANI_109 = 109,
	CONST_ANI_110 = 110,
	CONST_ANI_111 = 111,
	CONST_ANI_112 = 112,
	CONST_ANI_113 = 113,
	CONST_ANI_114 = 114,
	CONST_ANI_115 = 115,
	CONST_ANI_116 = 116,
	CONST_ANI_117 = 117,
	CONST_ANI_118 = 118,
	CONST_ANI_119 = 119,
	CONST_ANI_120 = 120,
	CONST_ANI_121 = 121,
	CONST_ANI_122 = 122,
	CONST_ANI_123 = 123,
	CONST_ANI_124 = 124,
	CONST_ANI_125 = 125,
	CONST_ANI_126 = 126,
	CONST_ANI_127 = 127,
	CONST_ANI_128 = 128,
	CONST_ANI_129 = 129,
	CONST_ANI_130 = 130,
	CONST_ANI_131 = 131,
	CONST_ANI_132 = 132,
	CONST_ANI_133 = 133,
	CONST_ANI_134 = 134,
	CONST_ANI_135 = 135,
	CONST_ANI_136 = 136,
	CONST_ANI_137 = 137,
	CONST_ANI_138 = 138,
	CONST_ANI_139 = 139,
	CONST_ANI_140 = 140,
	CONST_ANI_141 = 141,
	CONST_ANI_142 = 142,
	CONST_ANI_143 = 143,
	CONST_ANI_144 = 144,
	CONST_ANI_145 = 145,
	CONST_ANI_146 = 146,
	CONST_ANI_147 = 147,
	CONST_ANI_148 = 148,
	CONST_ANI_149 = 149,
	CONST_ANI_150 = 150,
	CONST_ANI_151 = 151,
	CONST_ANI_152 = 152,
	CONST_ANI_153 = 153,
	CONST_ANI_154 = 154,
	CONST_ANI_155 = 155,
	CONST_ANI_156 = 156,
	CONST_ANI_157 = 157,
	CONST_ANI_158 = 158,
	CONST_ANI_159 = 159,
	CONST_ANI_160 = 160,
	CONST_ANI_161 = 161,
	CONST_ANI_162 = 162,
	CONST_ANI_163 = 163,
	CONST_ANI_164 = 164,
	CONST_ANI_165 = 165,
	CONST_ANI_166 = 166,
	CONST_ANI_167 = 167,
	CONST_ANI_168 = 168,
	CONST_ANI_169 = 169,
	CONST_ANI_170 = 170,
	CONST_ANI_171 = 171,
	CONST_ANI_172 = 172,
	CONST_ANI_173 = 173,
	CONST_ANI_174 = 174,
	CONST_ANI_175 = 175,
	CONST_ANI_176 = 176,
	CONST_ANI_177 = 177,
	CONST_ANI_178 = 178,
	CONST_ANI_179 = 179,
	CONST_ANI_180 = 180,
	CONST_ANI_181 = 181,
	CONST_ANI_182 = 182,
	CONST_ANI_183 = 183,
	CONST_ANI_184 = 184,

	// for internal use, don't send to client
	CONST_ANI_WEAPONTYPE = 0xFE, // 254
};

enum SpeakClasses : uint8_t {
	TALKTYPE_SAY = 1,
	TALKTYPE_WHISPER = 2,
	TALKTYPE_YELL = 3,
	TALKTYPE_PRIVATE_FROM = 4,
	TALKTYPE_PRIVATE_TO = 5,
	TALKTYPE_CHANNEL_Y = 7,
	TALKTYPE_CHANNEL_O = 8,
	TALKTYPE_PRIVATE_NP = 10,
	TALKTYPE_PRIVATE_PN = 12,
	TALKTYPE_BROADCAST = 13,
	TALKTYPE_CHANNEL_R1 = 14, //red - #c text
	TALKTYPE_PRIVATE_RED_FROM = 15, //@name@text
	TALKTYPE_PRIVATE_RED_TO = 16, //@name@text
	TALKTYPE_MONSTER_SAY = 36,
	TALKTYPE_MONSTER_YELL = 37,
};

enum MessageClasses : uint8_t {
	MESSAGE_STATUS_CONSOLE_BLUE = 4, /*FIXME Blue message in the console*/

	MESSAGE_STATUS_CONSOLE_RED = 13, /*Red message in the console*/

	MESSAGE_STATUS_DEFAULT = 17, /*White message at the bottom of the game window and in the console*/
	MESSAGE_STATUS_WARNING = 18, /*Red message in game window and in the console*/
	MESSAGE_EVENT_ADVANCE = 19, /*White message in game window and in the console*/

	MESSAGE_STATUS_SMALL = 21, /*White message at the bottom of the game window"*/
	MESSAGE_INFO_DESCR = 22, /*Green message in game window and in the console*/
	MESSAGE_DAMAGE_DEALT = 23,
	MESSAGE_DAMAGE_RECEIVED = 24,
	MESSAGE_HEALED = 25,
	MESSAGE_EXPERIENCE = 26,
	MESSAGE_DAMAGE_OTHERS = 27,
	MESSAGE_HEALED_OTHERS = 28,
	MESSAGE_EXPERIENCE_OTHERS = 29,
	MESSAGE_EVENT_DEFAULT = 30, /*White message at the bottom of the game window and in the console*/
	MESSAGE_LOOT = 31,

	MESSAGE_GUILD = 33, /*White message in channel (+ channelId)*/
	MESSAGE_PARTY_MANAGEMENT = 34, /*White message in channel (+ channelId)*/
	MESSAGE_PARTY = 35, /*White message in channel (+ channelId)*/
	MESSAGE_EVENT_ORANGE = 36, /*Orange message in the console*/
	MESSAGE_STATUS_CONSOLE_ORANGE = 37,  /*Orange message in the console*/
};

enum FluidColors_t : uint8_t {
	FLUID_EMPTY,
	FLUID_BLUE,
	FLUID_RED,
	FLUID_BROWN,
	FLUID_GREEN,
	FLUID_YELLOW,
	FLUID_WHITE,
	FLUID_PURPLE,
};

enum FluidTypes_t : uint8_t {
	FLUID_NONE = FLUID_EMPTY,
	FLUID_WATER = FLUID_BLUE,
	FLUID_BLOOD = FLUID_RED,
	FLUID_BEER = FLUID_BROWN,
	FLUID_SLIME = FLUID_GREEN,
	FLUID_LEMONADE = FLUID_YELLOW,
	FLUID_MILK = FLUID_WHITE,
	FLUID_MANA = FLUID_PURPLE,

	FLUID_LIFE = FLUID_RED + 8,
	FLUID_OIL = FLUID_BROWN + 8,
	FLUID_URINE = FLUID_YELLOW + 8,
	FLUID_COCONUTMILK = FLUID_WHITE + 8,
	FLUID_WINE = FLUID_PURPLE + 8,

	FLUID_MUD = FLUID_BROWN + 16,
	FLUID_FRUITJUICE = FLUID_YELLOW + 16,

	FLUID_LAVA = FLUID_RED + 24,
	FLUID_RUM = FLUID_BROWN + 24,
	FLUID_SWAMP = FLUID_GREEN + 24,

	FLUID_TEA = FLUID_BROWN + 32,

	FLUID_MEAD = FLUID_BROWN + 40,
};

const uint8_t reverseFluidMap[] = {
	FLUID_EMPTY,
	FLUID_WATER,
	FLUID_MANA,
	FLUID_BEER,
	FLUID_EMPTY,
	FLUID_BLOOD,
	FLUID_SLIME,
	FLUID_EMPTY,
	FLUID_LEMONADE,
	FLUID_MILK,
};

const uint8_t clientToServerFluidMap[] = {
	FLUID_EMPTY,
	FLUID_WATER,
	FLUID_MANA,
	FLUID_BEER,
	FLUID_MUD,
	FLUID_BLOOD,
	FLUID_SLIME,
	FLUID_RUM,
	FLUID_LEMONADE,
	FLUID_MILK,
	FLUID_WINE,
	FLUID_LIFE,
	FLUID_URINE,
	FLUID_OIL,
	FLUID_FRUITJUICE,
	FLUID_COCONUTMILK,
	FLUID_TEA,
	FLUID_MEAD,
};

enum ClientFluidTypes_t : uint8_t {
	CLIENTFLUID_EMPTY = 0,
	CLIENTFLUID_BLUE = 1,
	CLIENTFLUID_PURPLE = 2,
	CLIENTFLUID_BROWN_1 = 3,
	CLIENTFLUID_BROWN_2 = 4,
	CLIENTFLUID_RED = 5,
	CLIENTFLUID_GREEN = 6,
	CLIENTFLUID_BROWN = 7,
	CLIENTFLUID_YELLOW = 8,
	CLIENTFLUID_WHITE = 9,
};

const uint8_t fluidMap[] = {
	CLIENTFLUID_EMPTY,
	CLIENTFLUID_BLUE,
	CLIENTFLUID_RED,
	CLIENTFLUID_BROWN_1,
	CLIENTFLUID_GREEN,
	CLIENTFLUID_YELLOW,
	CLIENTFLUID_WHITE,
	CLIENTFLUID_PURPLE,
};

enum SquareColor_t : uint8_t {
	SQ_COLOR_BLACK = 0,
};

enum TextColor_t : uint8_t {
	TEXTCOLOR_BLUE = 5,
	TEXTCOLOR_LIGHTGREEN = 30,
	TEXTCOLOR_LIGHTBLUE = 35,
	TEXTCOLOR_MAYABLUE = 95,
	TEXTCOLOR_DARKRED = 108,
	TEXTCOLOR_LIGHTGREY = 129,
	TEXTCOLOR_SKYBLUE = 143,
	TEXTCOLOR_PURPLE = 154,
	TEXTCOLOR_ELECTRICPURPLE = 155,
	TEXTCOLOR_RED = 180,
	TEXTCOLOR_PASTELRED = 194,
	TEXTCOLOR_ORANGE = 198,
	TEXTCOLOR_YELLOW = 210,
	TEXTCOLOR_WHITE_EXP = 215,
	TEXTCOLOR_NONE = 255,
};

enum Icons_t {
	ICON_POISON = 1 << 0,
	ICON_BURN = 1 << 1,
	ICON_ENERGY =  1 << 2,
	ICON_DRUNK = 1 << 3,
	ICON_MANASHIELD = 1 << 4,
	ICON_PARALYZE = 1 << 5,
	ICON_HASTE = 1 << 6,
	ICON_SWORDS = 1 << 7,
	ICON_DROWNING = 1 << 8,
	ICON_FREEZING = 1 << 9,
	ICON_DAZZLED = 1 << 10,
	ICON_CURSED = 1 << 11,
	ICON_PARTY_BUFF = 1 << 12,
	ICON_REDSWORDS = 1 << 13,
	ICON_PIGEON = 1 << 14,
	ICON_BLEEDING = 1 << 15,
};

enum WeaponType_t : uint8_t {
	WEAPON_NONE,
	WEAPON_SWORD,
	WEAPON_CLUB,
	WEAPON_AXE,
	WEAPON_SHIELD,
	WEAPON_DISTANCE,
	WEAPON_WAND,
	WEAPON_AMMO,
};

enum Ammo_t : uint8_t {
	AMMO_NONE,
	AMMO_BOLT,
	AMMO_ARROW,
	AMMO_SPEAR,
	AMMO_THROWINGSTAR,
	AMMO_THROWINGKNIFE,
	AMMO_STONE,
	AMMO_SNOWBALL,
};

enum WeaponAction_t : uint8_t {
	WEAPONACTION_NONE,
	WEAPONACTION_REMOVECOUNT,
	WEAPONACTION_REMOVECHARGE,
	WEAPONACTION_MOVE,
};

enum WieldInfo_t {
	WIELDINFO_NONE = 0 << 0,
	WIELDINFO_LEVEL = 1 << 0,
	WIELDINFO_MAGLV = 1 << 1,
	WIELDINFO_VOCREQ = 1 << 2,
	WIELDINFO_PREMIUM = 1 << 3,
};

enum Skulls_t : uint8_t {
	SKULL_NONE = 0,
	SKULL_YELLOW = 1,
	SKULL_GREEN = 2,
	SKULL_WHITE = 3,
	SKULL_RED = 4,
	SKULL_BLACK = 5,
	SKULL_ORANGE = 6,
};

enum PartyShields_t : uint8_t {
	SHIELD_NONE = 0,
	SHIELD_WHITEYELLOW = 1,
	SHIELD_WHITEBLUE = 2,
	SHIELD_BLUE = 3,
	SHIELD_YELLOW = 4,
	SHIELD_BLUE_SHAREDEXP = 5,
	SHIELD_YELLOW_SHAREDEXP = 6,
	SHIELD_BLUE_NOSHAREDEXP_BLINK = 7,
	SHIELD_YELLOW_NOSHAREDEXP_BLINK = 8,
	SHIELD_BLUE_NOSHAREDEXP = 9,
	SHIELD_YELLOW_NOSHAREDEXP = 10,
	SHIELD_GRAY = 11,
};

enum GuildEmblems_t : uint8_t {
	GUILDEMBLEM_NONE = 0,
	GUILDEMBLEM_ALLY = 1,
	GUILDEMBLEM_ENEMY = 2,
	GUILDEMBLEM_NEUTRAL = 3,
	GUILDEMBLEM_MEMBER = 4,
	GUILDEMBLEM_OTHER = 5,
};

enum item_t : uint16_t {
	ITEM_BROWSEFIELD = 460, // for internal use

	ITEM_FIREFIELD_PVP_FULL = 1487,
	ITEM_FIREFIELD_PVP_MEDIUM = 1488,
	ITEM_FIREFIELD_PVP_SMALL = 1489,
	ITEM_FIREFIELD_PERSISTENT_FULL = 1492,
	ITEM_FIREFIELD_PERSISTENT_MEDIUM = 1493,
	ITEM_FIREFIELD_PERSISTENT_SMALL = 1494,
	ITEM_FIREFIELD_NOPVP = 1500,

	ITEM_POISONFIELD_PVP = 1490,
	ITEM_POISONFIELD_PERSISTENT = 1496,
	ITEM_POISONFIELD_NOPVP = 1503,

	ITEM_ENERGYFIELD_PVP = 1491,
	ITEM_ENERGYFIELD_PERSISTENT = 1495,
	ITEM_ENERGYFIELD_NOPVP = 1504,

	ITEM_MAGICWALL = 1497,
	ITEM_MAGICWALL_PERSISTENT = 1498,
	ITEM_MAGICWALL_SAFE = 11098,
	ITEM_MAGICWALL_NOPVP = 20669,

	ITEM_WILDGROWTH = 1499,
	ITEM_WILDGROWTH_PERSISTENT = 2721,
	ITEM_WILDGROWTH_SAFE = 11099,
	ITEM_WILDGROWTH_NOPVP = 20670,

	ITEM_BAG = 1987,
	ITEM_SHOPPING_BAG = 23782,

	ITEM_GOLD_COIN = 2148,
	ITEM_PLATINUM_COIN = 2152,
	ITEM_CRYSTAL_COIN = 2160,
	ITEM_STORE_COIN = 24774, // in-game store currency

	ITEM_DEPOT = 2594,
	ITEM_LOCKER1 = 2589,
	ITEM_INBOX = 14404,
	ITEM_MARKET = 14405,
	ITEM_STORE_INBOX = 26052,
	ITEM_DEPOT_BOX_I = 25453,
	ITEM_DEPOT_BOX_II = 25454,
	ITEM_DEPOT_BOX_III = 25455,
	ITEM_DEPOT_BOX_IV = 25456,
	ITEM_DEPOT_BOX_V = 25457,
	ITEM_DEPOT_BOX_VI = 25458,
	ITEM_DEPOT_BOX_VII = 25459,
	ITEM_DEPOT_BOX_VIII = 25460,
	ITEM_DEPOT_BOX_IX = 25461,
	ITEM_DEPOT_BOX_X = 25462,
	ITEM_DEPOT_BOX_XI = 25463,
	ITEM_DEPOT_BOX_XII = 25464,
	ITEM_DEPOT_BOX_XIII = 25465,
	ITEM_DEPOT_BOX_XIV = 25466,
	ITEM_DEPOT_BOX_XV = 25467,
	ITEM_DEPOT_BOX_XVI = 25468,
	ITEM_DEPOT_BOX_XVII = 25469,

	ITEM_MALE_CORPSE = 3058,
	ITEM_FEMALE_CORPSE = 3065,

	ITEM_FULLSPLASH = 2016,
	ITEM_SMALLSPLASH = 2019,

	ITEM_PARCEL = 2595,
	ITEM_LETTER = 2597,
	ITEM_LETTER_STAMPED = 2598,
	ITEM_LABEL = 2599,

	ITEM_AMULETOFLOSS = 2173,

	ITEM_DOCUMENT_RO = 1968, //read-only
};

enum PlayerFlags : uint64_t {
	PlayerFlag_CannotUseCombat = 1 << 0,
	PlayerFlag_CannotAttackPlayer = 1 << 1,
	PlayerFlag_CannotAttackMonster = 1 << 2,
	PlayerFlag_CannotBeAttacked = 1 << 3,
	PlayerFlag_CanConvinceAll = 1 << 4,
	PlayerFlag_CanSummonAll = 1 << 5,
	PlayerFlag_CanIllusionAll = 1 << 6,
	PlayerFlag_CanSenseInvisibility = 1 << 7,
	PlayerFlag_IgnoredByMonsters = 1 << 8,
	PlayerFlag_NotGainInFight = 1 << 9,
	PlayerFlag_HasInfiniteMana = 1 << 10,
	PlayerFlag_HasInfiniteSoul = 1 << 11,
	PlayerFlag_HasNoExhaustion = 1 << 12,
	PlayerFlag_CannotUseSpells = 1 << 13,
	PlayerFlag_CannotPickupItem = 1 << 14,
	PlayerFlag_CanAlwaysLogin = 1 << 15,
	PlayerFlag_CanBroadcast = 1 << 16,
	PlayerFlag_CanEditHouses = 1 << 17,
	PlayerFlag_CannotBeBanned = 1 << 18,
	PlayerFlag_CannotBePushed = 1 << 19,
	PlayerFlag_HasInfiniteCapacity = 1 << 20,
	PlayerFlag_CanPushAllCreatures = 1 << 21,
	PlayerFlag_CanTalkRedPrivate = 1 << 22,
	PlayerFlag_CanTalkRedChannel = 1 << 23,
	PlayerFlag_TalkOrangeHelpChannel = 1 << 24,
	PlayerFlag_NotGainExperience = 1 << 25,
	PlayerFlag_NotGainMana = 1 << 26,
	PlayerFlag_NotGainHealth = 1 << 27,
	PlayerFlag_NotGainSkill = 1 << 28,
	PlayerFlag_SetMaxSpeed = 1 << 29,
	PlayerFlag_SpecialVIP = 1 << 30,
	PlayerFlag_NotGenerateLoot = static_cast<uint64_t>(1) << 31,
	// PlayerFlag with exponent 32 existed but was deprecated (feature dropped from client).
	PlayerFlag_IgnoreProtectionZone = static_cast<uint64_t>(1) << 33,
	PlayerFlag_IgnoreSpellCheck = static_cast<uint64_t>(1) << 34,
	PlayerFlag_IgnoreWeaponCheck = static_cast<uint64_t>(1) << 35,
	PlayerFlag_CannotBeMuted = static_cast<uint64_t>(1) << 36,
	PlayerFlag_IsAlwaysPremium = static_cast<uint64_t>(1) << 37,
};

enum ReloadTypes_t : uint8_t  {
	RELOAD_TYPE_ALL,
	RELOAD_TYPE_ACTIONS,
	RELOAD_TYPE_CHAT,
	RELOAD_TYPE_CONFIG,
	RELOAD_TYPE_CREATURESCRIPTS,
	RELOAD_TYPE_EVENTS,
	RELOAD_TYPE_GLOBAL,
	RELOAD_TYPE_GLOBALEVENTS,
	RELOAD_TYPE_ITEMS,
	RELOAD_TYPE_MONSTERS,
	RELOAD_TYPE_MOUNTS,
	RELOAD_TYPE_WINGS,
	RELOAD_TYPE_AURAS,
	RELOAD_TYPE_EFFECTS,
	RELOAD_TYPE_SHADERS,
	RELOAD_TYPE_MOVEMENTS,
	RELOAD_TYPE_NPCS,
	RELOAD_TYPE_QUESTS,
	RELOAD_TYPE_RAIDS,
	RELOAD_TYPE_SCRIPTS,
	RELOAD_TYPE_SPELLS,
	RELOAD_TYPE_TALKACTIONS,
	RELOAD_TYPE_WEAPONS,
};

static constexpr int32_t CHANNEL_GUILD = 0x00;
static constexpr int32_t CHANNEL_PARTY = 0x01;
static constexpr int32_t CHANNEL_PRIVATE = 0xFFFF;

//Reserved player storage key ranges;
//[10000000 - 20000000];
static constexpr int32_t PSTRG_RESERVED_RANGE_START = 10000000;
static constexpr int32_t PSTRG_RESERVED_RANGE_SIZE = 10000000;
//[1000 - 1500];
static constexpr int32_t PSTRG_OUTFITS_RANGE_START = (PSTRG_RESERVED_RANGE_START + 1000);
static constexpr int32_t PSTRG_OUTFITS_RANGE_SIZE = 500;
//[2001 - 2011];
static constexpr int32_t PSTRG_MOUNTS_RANGE_START = (PSTRG_RESERVED_RANGE_START + 2001);
static constexpr int32_t PSTRG_MOUNTS_RANGE_SIZE = 10;
static constexpr int32_t PSTRG_MOUNTS_CURRENTMOUNT = (PSTRG_MOUNTS_RANGE_START + 10);

#define IS_IN_KEYRANGE(key, range) (key >= PSTRG_##range##_START && ((key - PSTRG_##range##_START) <= PSTRG_##range##_SIZE))
static const std::vector<double> DifficultyLife = {1.0, 1.0, 2.0, 3.2, 5.0, 8.0, 13.0};
static const std::vector<double> DifficultyDamage = {1.0, 1.0, 1.3, 1.9, 2.8, 4.0, 6.0};
static const std::vector<double> DifficultyXP = {1.0, 1.0, 1.75, 2.0, 3.0, 4.0, 5.0};

#endif
