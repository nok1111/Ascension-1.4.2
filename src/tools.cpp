// Copyright 2022 The Forgotten Server Authors. All rights reserved.
// Use of this source code is governed by the GPL-2.0 License that can be found in the LICENSE file.

#include "otpch.h"

#include "tools.h"
#include "configmanager.h"

extern ConfigManager g_config;

void printXMLError(const std::string& where, const std::string& fileName, const pugi::xml_parse_result& result)
{
	std::cout << '[' << where << "] Failed to load " << fileName << ": " << result.description() << std::endl;

	FILE* file = fopen(fileName.c_str(), "rb");
	if (!file) {
		return;
	}

	char buffer[32768];
	uint32_t currentLine = 1;
	std::string line;

	auto offset = static_cast<size_t>(result.offset);
	size_t lineOffsetPosition = 0;
	size_t index = 0;
	size_t bytes;
	do {
		bytes = fread(buffer, 1, 32768, file);
		for (size_t i = 0; i < bytes; ++i) {
			char ch = buffer[i];
			if (ch == '\n') {
				if ((index + i) >= offset) {
					lineOffsetPosition = line.length() - ((index + i) - offset);
					bytes = 0;
					break;
				}
				++currentLine;
				line.clear();
			} else {
				line.push_back(ch);
			}
		}
		index += bytes;
	} while (bytes == 32768);
	fclose(file);

	std::cout << "Line " << currentLine << ':' << std::endl;
	std::cout << line << std::endl;
	for (size_t i = 0; i < lineOffsetPosition; i++) {
		if (line[i] == '\t') {
			std::cout << '\t';
		} else {
			std::cout << ' ';
		}
	}
	std::cout << '^' << std::endl;
}

static uint32_t circularShift(int bits, uint32_t value)
{
	return (value << bits) | (value >> (32 - bits));
}

static void processSHA1MessageBlock(const uint8_t* messageBlock, uint32_t* H)
{
	uint32_t W[80];
	for (int i = 0; i < 16; ++i) {
		const size_t offset = i << 2;
		W[i] = messageBlock[offset] << 24 | messageBlock[offset + 1] << 16 | messageBlock[offset + 2] << 8 | messageBlock[offset + 3];
	}

	for (int i = 16; i < 80; ++i) {
		W[i] = circularShift(1, W[i - 3] ^ W[i - 8] ^ W[i - 14] ^ W[i - 16]);
	}

	uint32_t A = H[0], B = H[1], C = H[2], D = H[3], E = H[4];

	for (int i = 0; i < 20; ++i) {
		const uint32_t tmp = circularShift(5, A) + ((B & C) | ((~B) & D)) + E + W[i] + 0x5A827999;
		E = D; D = C; C = circularShift(30, B); B = A; A = tmp;
	}

	for (int i = 20; i < 40; ++i) {
		const uint32_t tmp = circularShift(5, A) + (B ^ C ^ D) + E + W[i] + 0x6ED9EBA1;
		E = D; D = C; C = circularShift(30, B); B = A; A = tmp;
	}

	for (int i = 40; i < 60; ++i) {
		const uint32_t tmp = circularShift(5, A) + ((B & C) | (B & D) | (C & D)) + E + W[i] + 0x8F1BBCDC;
		E = D; D = C; C = circularShift(30, B); B = A; A = tmp;
	}

	for (int i = 60; i < 80; ++i) {
		const uint32_t tmp = circularShift(5, A) + (B ^ C ^ D) + E + W[i] + 0xCA62C1D6;
		E = D; D = C; C = circularShift(30, B); B = A; A = tmp;
	}

	H[0] += A;
	H[1] += B;
	H[2] += C;
	H[3] += D;
	H[4] += E;
}

std::string transformToSHA1(const std::string& input)
{
	uint32_t H[] = {
		0x67452301,
		0xEFCDAB89,
		0x98BADCFE,
		0x10325476,
		0xC3D2E1F0
	};

	uint8_t messageBlock[64];
	size_t index = 0;

	uint32_t length_low = 0;
	uint32_t length_high = 0;
	for (char ch : input) {
		messageBlock[index++] = ch;

		length_low += 8;
		if (length_low == 0) {
			length_high++;
		}

		if (index == 64) {
			processSHA1MessageBlock(messageBlock, H);
			index = 0;
		}
	}

	messageBlock[index++] = 0x80;

	if (index > 56) {
		while (index < 64) {
			messageBlock[index++] = 0;
		}

		processSHA1MessageBlock(messageBlock, H);
		index = 0;
	}

	while (index < 56) {
		messageBlock[index++] = 0;
	}

	messageBlock[56] = length_high >> 24;
	messageBlock[57] = length_high >> 16;
	messageBlock[58] = length_high >> 8;
	messageBlock[59] = length_high;

	messageBlock[60] = length_low >> 24;
	messageBlock[61] = length_low >> 16;
	messageBlock[62] = length_low >> 8;
	messageBlock[63] = length_low;

	processSHA1MessageBlock(messageBlock, H);

	char hexstring[41];
	static const char hexDigits[] = {"0123456789abcdef"};
	for (int hashByte = 20; --hashByte >= 0;) {
		const uint8_t byte = H[hashByte >> 2] >> (((3 - hashByte) & 3) << 3);
		index = hashByte << 1;
		hexstring[index] = hexDigits[byte >> 4];
		hexstring[index + 1] = hexDigits[byte & 15];
	}
	return std::string(hexstring, 40);
}

std::string generateToken(const std::string& key, uint32_t ticks)
{
	// generate message from ticks
	std::string message(8, 0);
	for (uint8_t i = 8; --i; ticks >>= 8) {
		message[i] = static_cast<char>(ticks & 0xFF);
	}

	// hmac key pad generation
	std::string iKeyPad(64, 0x36), oKeyPad(64, 0x5C);
	for (uint8_t i = 0; i < key.length(); ++i) {
		iKeyPad[i] ^= key[i];
		oKeyPad[i] ^= key[i];
	}

	oKeyPad.reserve(84);

	// hmac concat inner pad with message
	iKeyPad.append(message);

	// hmac first pass
	message.assign(transformToSHA1(iKeyPad));

	// hmac concat outer pad with message, conversion from hex to int needed
	for (uint8_t i = 0; i < message.length(); i += 2) {
		oKeyPad.push_back(static_cast<char>(std::strtoul(message.substr(i, 2).c_str(), nullptr, 16)));
	}

	// hmac second pass
	message.assign(transformToSHA1(oKeyPad));

	// calculate hmac offset
	uint32_t offset = static_cast<uint32_t>(std::strtoul(message.substr(39, 1).c_str(), nullptr, 16) & 0xF);

	// get truncated hash
	uint32_t truncHash = static_cast<uint32_t>(std::strtoul(message.substr(2 * offset, 8).c_str(), nullptr, 16)) & 0x7FFFFFFF;
	message.assign(std::to_string(truncHash));

	// return only last AUTHENTICATOR_DIGITS (default 6) digits, also asserts exactly 6 digits
	uint32_t hashLen = message.length();
	message.assign(message.substr(hashLen - std::min(hashLen, AUTHENTICATOR_DIGITS)));
	message.insert(0, AUTHENTICATOR_DIGITS - std::min(hashLen, AUTHENTICATOR_DIGITS), '0');
	return message;
}

void replaceString(std::string& str, const std::string& sought, const std::string& replacement)
{
	size_t pos = 0;
	size_t start = 0;
	size_t soughtLen = sought.length();
	size_t replaceLen = replacement.length();

	while ((pos = str.find(sought, start)) != std::string::npos) {
		str = str.substr(0, pos) + replacement + str.substr(pos + soughtLen);
		start = pos + replaceLen;
	}
}

void trim_right(std::string& source, char t)
{
	source.erase(source.find_last_not_of(t) + 1);
}

void trim_left(std::string& source, char t)
{
	source.erase(0, source.find_first_not_of(t));
}

void toLowerCaseString(std::string& source)
{
	std::transform(source.begin(), source.end(), source.begin(), tolower);
}

std::string asLowerCaseString(std::string source)
{
	toLowerCaseString(source);
	return source;
}

std::string asUpperCaseString(std::string source)
{
	std::transform(source.begin(), source.end(), source.begin(), toupper);
	return source;
}

StringVector explodeString(const std::string& inString, const std::string& separator, int32_t limit/* = -1*/)
{
	StringVector returnVector;
	std::string::size_type start = 0, end = 0;

	while (--limit != -1 && (end = inString.find(separator, start)) != std::string::npos) {
		returnVector.push_back(inString.substr(start, end - start));
		start = end + separator.size();
	}

	returnVector.push_back(inString.substr(start));
	return returnVector;
}

IntegerVector vectorAtoi(const StringVector& stringVector)
{
	IntegerVector returnVector;
	for (const auto& string : stringVector) {
		returnVector.push_back(std::stoi(string));
	}
	return returnVector;
}

std::mt19937& getRandomGenerator()
{
	static std::random_device rd;
	static std::mt19937 generator(rd());
	return generator;
}

int32_t uniform_random(int32_t minNumber, int32_t maxNumber)
{
	static std::uniform_int_distribution<int32_t> uniformRand;
	if (minNumber == maxNumber) {
		return minNumber;
	} else if (minNumber > maxNumber) {
		std::swap(minNumber, maxNumber);
	}
	return uniformRand(getRandomGenerator(), std::uniform_int_distribution<int32_t>::param_type(minNumber, maxNumber));
}

int32_t normal_random(int32_t minNumber, int32_t maxNumber)
{
	static std::normal_distribution<float> normalRand(0.5f, 0.25f);
	if (minNumber == maxNumber) {
		return minNumber;
	} else if (minNumber > maxNumber) {
		std::swap(minNumber, maxNumber);
	}

	int32_t increment;
	const int32_t diff = maxNumber - minNumber;
	const float v = normalRand(getRandomGenerator());
	if (v < 0.0) {
		increment = diff / 2;
	} else if (v > 1.0) {
		increment = (diff + 1) / 2;
	} else {
		increment = round(v * diff);
	}
	return minNumber + increment;
}

bool boolean_random(double probability/* = 0.5*/)
{
	static std::bernoulli_distribution booleanRand;
	return booleanRand(getRandomGenerator(), std::bernoulli_distribution::param_type(probability));
}

void trimString(std::string& str)
{
	str.erase(str.find_last_not_of(' ') + 1);
	str.erase(0, str.find_first_not_of(' '));
}

std::string convertIPToString(uint32_t ip)
{
	char buffer[17];

	int res = sprintf(buffer, "%u.%u.%u.%u", ip & 0xFF, (ip >> 8) & 0xFF, (ip >> 16) & 0xFF, (ip >> 24));
	if (res < 0) {
		return {};
	}

	return buffer;
}

std::string formatDate(time_t time)
{
	const tm* tms = localtime(&time);
	if (!tms) {
		return {};
	}

	char buffer[20];
	int res = sprintf(buffer, "%02d/%02d/%04d %02d:%02d:%02d", tms->tm_mday, tms->tm_mon + 1, tms->tm_year + 1900, tms->tm_hour, tms->tm_min, tms->tm_sec);
	if (res < 0) {
		return {};
	}
	return {buffer, 19};
}

std::string formatDateShort(time_t time)
{
	const tm* tms = localtime(&time);
	if (!tms) {
		return {};
	}

	char buffer[12];
	size_t res = strftime(buffer, 12, "%d %b %Y", tms);
	if (res == 0) {
		return {};
	}
	return {buffer, 11};
}

Direction getDirection(const std::string& string)
{
	Direction direction = DIRECTION_NORTH;

	if (string == "north" || string == "n" || string == "0") {
		direction = DIRECTION_NORTH;
	} else if (string == "east" || string == "e" || string == "1") {
		direction = DIRECTION_EAST;
	} else if (string == "south" || string == "s" || string == "2") {
		direction = DIRECTION_SOUTH;
	} else if (string == "west" || string == "w" || string == "3") {
		direction = DIRECTION_WEST;
	} else if (string == "southwest" || string == "south west" || string == "south-west" || string == "sw" || string == "4") {
		direction = DIRECTION_SOUTHWEST;
	} else if (string == "southeast" || string == "south east" || string == "south-east" || string == "se" || string == "5") {
		direction = DIRECTION_SOUTHEAST;
	} else if (string == "northwest" || string == "north west" || string == "north-west" || string == "nw" || string == "6") {
		direction = DIRECTION_NORTHWEST;
	} else if (string == "northeast" || string == "north east" || string == "north-east" || string == "ne" || string == "7") {
		direction = DIRECTION_NORTHEAST;
	}

	return direction;
}

Position getNextPosition(Direction direction, Position pos)
{
	switch (direction) {
		case DIRECTION_NORTH:
			pos.y--;
			break;

		case DIRECTION_SOUTH:
			pos.y++;
			break;

		case DIRECTION_WEST:
			pos.x--;
			break;

		case DIRECTION_EAST:
			pos.x++;
			break;

		case DIRECTION_SOUTHWEST:
			pos.x--;
			pos.y++;
			break;

		case DIRECTION_NORTHWEST:
			pos.x--;
			pos.y--;
			break;

		case DIRECTION_NORTHEAST:
			pos.x++;
			pos.y--;
			break;

		case DIRECTION_SOUTHEAST:
			pos.x++;
			pos.y++;
			break;

		default:
			break;
	}

	return pos;
}

Direction getDirectionTo(const Position& from, const Position& to)
{
	if (from == to) {
		return DIRECTION_NONE;
	}
	
	Direction dir;

	int32_t x_offset = Position::getOffsetX(from, to);
	if (x_offset < 0) {
		dir = DIRECTION_EAST;
		x_offset = std::abs(x_offset);
	} else {
		dir = DIRECTION_WEST;
	}

	int32_t y_offset = Position::getOffsetY(from, to);
	if (y_offset >= 0) {
		if (y_offset > x_offset) {
			dir = DIRECTION_NORTH;
		} else if (y_offset == x_offset) {
			if (dir == DIRECTION_EAST) {
				dir = DIRECTION_NORTHEAST;
			} else {
				dir = DIRECTION_NORTHWEST;
			}
		}
	} else {
		y_offset = std::abs(y_offset);
		if (y_offset > x_offset) {
			dir = DIRECTION_SOUTH;
		} else if (y_offset == x_offset) {
			if (dir == DIRECTION_EAST) {
				dir = DIRECTION_SOUTHEAST;
			} else {
				dir = DIRECTION_SOUTHWEST;
			}
		}
	}
	return dir;
}

using MagicEffectNames = std::unordered_map<std::string, MagicEffectClasses>;
using ShootTypeNames = std::unordered_map<std::string, ShootType_t>;
using CombatTypeNames = std::unordered_map<CombatType_t, std::string, std::hash<int32_t>>;
using AmmoTypeNames = std::unordered_map<std::string, Ammo_t>;
using WeaponActionNames = std::unordered_map<std::string, WeaponAction_t>;
using SkullNames = std::unordered_map<std::string, Skulls_t>;

MagicEffectNames magicEffectNames = {
	{"redspark",		CONST_ME_DRAWBLOOD},
	{"bluebubble",		CONST_ME_LOSEENERGY},
	{"poff",		CONST_ME_POFF},
	{"yellowspark",		CONST_ME_BLOCKHIT},
	{"explosionarea",	CONST_ME_EXPLOSIONAREA},
	{"explosion",		CONST_ME_EXPLOSIONHIT},
	{"firearea",		CONST_ME_FIREAREA},
	{"yellowbubble",	CONST_ME_YELLOW_RINGS},
	{"greenbubble",		CONST_ME_GREEN_RINGS},
	{"blackspark",		CONST_ME_HITAREA},
	{"teleport",		CONST_ME_TELEPORT},
	{"energy",		CONST_ME_ENERGYHIT},
	{"blueshimmer",		CONST_ME_MAGIC_BLUE},
	{"redshimmer",		CONST_ME_MAGIC_RED},
	{"greenshimmer",	CONST_ME_MAGIC_GREEN},
	{"fire",		CONST_ME_HITBYFIRE},
	{"greenspark",		CONST_ME_HITBYPOISON},
	{"mortarea",		CONST_ME_MORTAREA},
	{"greennote",		CONST_ME_SOUND_GREEN},
	{"rednote",		CONST_ME_SOUND_RED},
	{"poison",		CONST_ME_POISONAREA},
	{"yellownote",		CONST_ME_SOUND_YELLOW},
	{"purplenote",		CONST_ME_SOUND_PURPLE},
	{"bluenote",		CONST_ME_SOUND_BLUE},
	{"whitenote",		CONST_ME_SOUND_WHITE},
	{"bubbles",		CONST_ME_BUBBLES},
	{"dice",		CONST_ME_CRAPS},
	{"giftwraps",		CONST_ME_GIFT_WRAPS},
	{"yellowfirework",	CONST_ME_FIREWORK_YELLOW},
	{"redfirework",		CONST_ME_FIREWORK_RED},
	{"bluefirework",	CONST_ME_FIREWORK_BLUE},
	{"stun",		CONST_ME_STUN},
	{"sleep",		CONST_ME_SLEEP},
	{"watercreature",	CONST_ME_WATERCREATURE},
	{"groundshaker",	CONST_ME_GROUNDSHAKER},
	{"hearts",		CONST_ME_HEARTS},
	{"fireattack",		CONST_ME_FIREATTACK},
	{"energyarea",		CONST_ME_ENERGYAREA},
	{"smallclouds",		CONST_ME_SMALLCLOUDS},
	{"holydamage",		CONST_ME_HOLYDAMAGE},
	{"bigclouds",		CONST_ME_BIGCLOUDS},
	{"icearea",		CONST_ME_ICEAREA},
	{"icetornado",		CONST_ME_ICETORNADO},
	{"iceattack",		CONST_ME_ICEATTACK},
	{"stones",		CONST_ME_STONES},
	{"smallplants",		CONST_ME_SMALLPLANTS},
	{"carniphila",		CONST_ME_CARNIPHILA},
	{"purpleenergy",	CONST_ME_PURPLEENERGY},
	{"yellowenergy",	CONST_ME_YELLOWENERGY},
	{"holyarea",		CONST_ME_HOLYAREA},
	{"bigplants",		CONST_ME_BIGPLANTS},
	{"cake",		CONST_ME_CAKE},
	{"giantice",		CONST_ME_GIANTICE},
	{"watersplash",		CONST_ME_WATERSPLASH},
	{"plantattack",		CONST_ME_PLANTATTACK},
	{"tutorialarrow",	CONST_ME_TUTORIALARROW},
	{"tutorialsquare",	CONST_ME_TUTORIALSQUARE},
	{"mirrorhorizontal",	CONST_ME_MIRRORHORIZONTAL},
	{"mirrorvertical",	CONST_ME_MIRRORVERTICAL},
	{"skullhorizontal",	CONST_ME_SKULLHORIZONTAL},
	{"skullvertical",	CONST_ME_SKULLVERTICAL},
	{"assassin",		CONST_ME_ASSASSIN},
	{"stepshorizontal",	CONST_ME_STEPSHORIZONTAL},
	{"bloodysteps",		CONST_ME_BLOODYSTEPS},
	{"stepsvertical",	CONST_ME_STEPSVERTICAL},
	{"yalaharighost",	CONST_ME_YALAHARIGHOST},
	{"bats",		CONST_ME_BATS},
	{"smoke",		CONST_ME_SMOKE},
	{"insects",		CONST_ME_INSECTS},
	{"dragonhead",		CONST_ME_DRAGONHEAD},
	{"orcshaman",		CONST_ME_ORCSHAMAN},
	{"orcshamanfire",	CONST_ME_ORCSHAMAN_FIRE},
	{"thunder",		CONST_ME_THUNDER},
	{"ferumbras",		CONST_ME_FERUMBRAS},
	{"confettihorizontal",	CONST_ME_CONFETTI_HORIZONTAL},
	{"confettivertical",	CONST_ME_CONFETTI_VERTICAL},
	{"blacksmoke",		CONST_ME_BLACKSMOKE},
	{"redsmoke",		CONST_ME_REDSMOKE},
	{"yellowsmoke",		CONST_ME_YELLOWSMOKE},
	{"greensmoke",		CONST_ME_GREENSMOKE},
	{"purplesmoke",		CONST_ME_PURPLESMOKE},

	{"effect176", CONST_ME_176},
{"effect177", CONST_ME_177},
{"effect178", CONST_ME_178},
{"effect179", CONST_ME_179},
{"effect180", CONST_ME_180},
{"effect181", CONST_ME_181},
{"effect182", CONST_ME_182},
{"effect183", CONST_ME_183},
{"effect184", CONST_ME_184},
{"effect185", CONST_ME_185},
{"effect186", CONST_ME_186},
{"effect187", CONST_ME_187},
{"effect188", CONST_ME_188},
{"effect189", CONST_ME_189},
{"effect190", CONST_ME_190},
{"effect191", CONST_ME_191},
{"effect192", CONST_ME_192},
{"effect193", CONST_ME_193},
{"effect194", CONST_ME_194},
{"effect195", CONST_ME_195},
{"effect196", CONST_ME_196},
{"effect197", CONST_ME_197},
{"effect198", CONST_ME_198},
{"effect199", CONST_ME_199},
{"effect200", CONST_ME_200},
{"effect201", CONST_ME_201},
{"effect202", CONST_ME_202},
{"effect203", CONST_ME_203},
{"effect204", CONST_ME_204},
{"effect205", CONST_ME_205},
{"effect206", CONST_ME_206},
{"effect207", CONST_ME_207},
{"effect208", CONST_ME_208},
{"effect209", CONST_ME_209},
{"effect210", CONST_ME_210},
{"effect211", CONST_ME_211},
{"effect212", CONST_ME_212},
{"effect213", CONST_ME_213},
{"effect214", CONST_ME_214},
{"effect215", CONST_ME_215},
{"effect216", CONST_ME_216},
{"effect217", CONST_ME_217},
{"effect218", CONST_ME_218},
{"effect219", CONST_ME_219},
{"effect220", CONST_ME_220},
{"effect221", CONST_ME_221},
{"effect222", CONST_ME_222},
{"effect223", CONST_ME_223},
{"effect224", CONST_ME_224},
{"effect225", CONST_ME_225},
{"effect226", CONST_ME_226},
{"effect227", CONST_ME_227},
{"effect228", CONST_ME_228},
{"effect229", CONST_ME_229},
{"effect230", CONST_ME_230},
{"effect231", CONST_ME_231},
{"effect232", CONST_ME_232},
{"effect233", CONST_ME_233},
{"effect234", CONST_ME_234},
{"effect235", CONST_ME_235},
{"effect236", CONST_ME_236},
{"effect237", CONST_ME_237},
{"effect238", CONST_ME_238},
{"effect239", CONST_ME_239},
{"effect240", CONST_ME_240},
{"effect241", CONST_ME_241},
{"effect242", CONST_ME_242},
{"effect243", CONST_ME_243},
{"effect244", CONST_ME_244},
{"effect245", CONST_ME_245},
{"effect246", CONST_ME_246},
{"effect247", CONST_ME_247},
{"effect248", CONST_ME_248},
{"effect249", CONST_ME_249},
{"effect250", CONST_ME_250},
{"effect251", CONST_ME_251},
{"effect252", CONST_ME_252},
{"effect253", CONST_ME_253},
{"effect254", CONST_ME_254},
{"effect255", CONST_ME_255},
{"effect256", CONST_ME_256},
{"effect257", CONST_ME_257},
{"effect258", CONST_ME_258},
{"effect259", CONST_ME_259},
{"effect260", CONST_ME_260},
{"effect261", CONST_ME_261},
{"effect262", CONST_ME_262},
{"effect263", CONST_ME_263},
{"effect264", CONST_ME_264},
{"effect265", CONST_ME_265},
{"effect266", CONST_ME_266},
{"effect267", CONST_ME_267},
{"effect268", CONST_ME_268},
{"effect269", CONST_ME_269},
{"effect270", CONST_ME_270},
{"effect271", CONST_ME_271},
{"effect272", CONST_ME_272},
{"effect273", CONST_ME_273},
{"effect274", CONST_ME_274},
{"effect275", CONST_ME_275},
{"effect276", CONST_ME_276},
{"effect277", CONST_ME_277},
{"effect278", CONST_ME_278},
{"effect279", CONST_ME_279},
{"effect280", CONST_ME_280},
{"effect281", CONST_ME_281},
{"effect282", CONST_ME_282},
{"effect283", CONST_ME_283},
{"effect284", CONST_ME_284},
{"effect285", CONST_ME_285},
{"effect286", CONST_ME_286},
{"effect287", CONST_ME_287},
{"effect288", CONST_ME_288},
{"effect289", CONST_ME_289},
{"effect290", CONST_ME_290},
{"effect291", CONST_ME_291},
{"effect292", CONST_ME_292},
{"effect293", CONST_ME_293},
{"effect294", CONST_ME_294},
{"effect295", CONST_ME_295},
{"effect296", CONST_ME_296},
{"effect297", CONST_ME_297},
{"effect298", CONST_ME_298},
{"effect299", CONST_ME_299},
{"effect300", CONST_ME_300},
{"effect301", CONST_ME_301},
{"effect302", CONST_ME_302},
{"effect303", CONST_ME_303},
{"effect304", CONST_ME_304},
{"effect305", CONST_ME_305},
{"effect306", CONST_ME_306},
{"effect307", CONST_ME_307},
{"effect308", CONST_ME_308},
{"effect309", CONST_ME_309},
{"effect310", CONST_ME_310},
{"effect311", CONST_ME_311},
{"effect312", CONST_ME_312},
{"effect313", CONST_ME_313},
{"effect314", CONST_ME_314},
{"effect315", CONST_ME_315},
{"effect316", CONST_ME_316},
{"effect317", CONST_ME_317},
{"effect318", CONST_ME_318},
{"effect319", CONST_ME_319},
{"effect320", CONST_ME_320},
{"effect321", CONST_ME_321},
{"effect322", CONST_ME_322},
{"effect323", CONST_ME_323},
{"effect324", CONST_ME_324},
{"effect325", CONST_ME_325},
{"effect326", CONST_ME_326},
{"effect327", CONST_ME_327},
{"effect328", CONST_ME_328},
{"effect329", CONST_ME_329},
{"effect330", CONST_ME_330},
{"effect331", CONST_ME_331},
{"effect332", CONST_ME_332},
{"effect333", CONST_ME_333},
{"effect334", CONST_ME_334},
{"effect335", CONST_ME_335},
{"effect336", CONST_ME_336},
{"effect337", CONST_ME_337},
{"effect338", CONST_ME_338},
{"effect339", CONST_ME_339},
{"effect340", CONST_ME_340},
{"effect341", CONST_ME_341},
{"effect342", CONST_ME_342},
{"effect343", CONST_ME_343},
{"effect344", CONST_ME_344},
{"effect345", CONST_ME_345},
{"effect346", CONST_ME_346},
{"effect347", CONST_ME_347},
{"effect348", CONST_ME_348},
{"effect349", CONST_ME_349},
{"effect350", CONST_ME_350},
{"effect351", CONST_ME_351},
{"effect352", CONST_ME_352},
{"effect353", CONST_ME_353},
{"effect354", CONST_ME_354},
{"effect355", CONST_ME_355},
{"effect356", CONST_ME_356},
{"effect357", CONST_ME_357},
{"effect358", CONST_ME_358},
{"effect359", CONST_ME_359},
{"effect360", CONST_ME_360},
{"effect361", CONST_ME_361},
{"effect362", CONST_ME_362},
{"effect363", CONST_ME_363},
{"effect364", CONST_ME_364},
{"effect365", CONST_ME_365},
{"effect366", CONST_ME_366},
{"effect367", CONST_ME_367},
{"effect368", CONST_ME_368},
{"effect369", CONST_ME_369},
{"effect370", CONST_ME_370},
{"effect371", CONST_ME_371},
{"effect372", CONST_ME_372},
{"effect373", CONST_ME_373},
{"effect374", CONST_ME_374},
{"effect375", CONST_ME_375},
{"effect376", CONST_ME_376},
{"effect377", CONST_ME_377},
{"effect378", CONST_ME_378},
{"effect379", CONST_ME_379},
{"effect380", CONST_ME_380},
{"effect381", CONST_ME_381},
{"effect382", CONST_ME_382},
{"effect383", CONST_ME_383},
{"effect384", CONST_ME_384},
{"effect385", CONST_ME_385},
{"effect386", CONST_ME_386},
{"effect387", CONST_ME_387},
{"effect388", CONST_ME_388},
{"effect389", CONST_ME_389},
{"effect390", CONST_ME_390},
{"effect391", CONST_ME_391},
{"effect392", CONST_ME_392},
{"effect393", CONST_ME_393},
{"effect394", CONST_ME_394},
{"effect395", CONST_ME_395},
{"effect396", CONST_ME_396},
{"effect397", CONST_ME_397},
{"effect398", CONST_ME_398},
{"effect399", CONST_ME_399},
{"effect400", CONST_ME_400},
{"effect401", CONST_ME_401},
{"effect402", CONST_ME_402},
{"effect403", CONST_ME_403},
{"effect404", CONST_ME_404},
{"effect405", CONST_ME_405},
{"effect406", CONST_ME_406},
{"effect407", CONST_ME_407},
{"effect408", CONST_ME_408},
{"effect409", CONST_ME_409},
{"effect410", CONST_ME_410},
{"effect411", CONST_ME_411},
{"effect412", CONST_ME_412},
{"effect413", CONST_ME_413},
{"effect414", CONST_ME_414},
{"effect415", CONST_ME_415},
{"effect416", CONST_ME_416},
{"effect417", CONST_ME_417},
{"effect418", CONST_ME_418},
{"effect419", CONST_ME_419},
{"effect420", CONST_ME_420},
{"effect421", CONST_ME_421},
{"effect422", CONST_ME_422},
{"effect423", CONST_ME_423},
{"effect424", CONST_ME_424},
{"effect425", CONST_ME_425},
{"effect426", CONST_ME_426},
{"effect427", CONST_ME_427},
{"effect428", CONST_ME_428},
{"effect429", CONST_ME_429},
{"effect430", CONST_ME_430},
{"effect431", CONST_ME_431},
{"effect432", CONST_ME_432},
{"effect433", CONST_ME_433},
{"effect434", CONST_ME_434},
{"effect435", CONST_ME_435},
{"effect436", CONST_ME_436},
{"effect437", CONST_ME_437},
{"effect438", CONST_ME_438},
{"effect439", CONST_ME_439},
{"effect440", CONST_ME_440},
{"effect441", CONST_ME_441},
{"effect442", CONST_ME_442},
{"effect443", CONST_ME_443},
{"effect444", CONST_ME_444},
{"effect445", CONST_ME_445},
{"effect446", CONST_ME_446},
{"effect447", CONST_ME_447},
{"effect448", CONST_ME_448},
{"effect449", CONST_ME_449},
{"effect450", CONST_ME_450},
{"effect451", CONST_ME_451},
{"effect452", CONST_ME_452},
{"effect453", CONST_ME_453},
{"effect454", CONST_ME_454},
{"effect455", CONST_ME_455},
{"effect456", CONST_ME_456},
{"effect457", CONST_ME_457},
{"effect458", CONST_ME_458},
{"effect459", CONST_ME_459},
{"effect460", CONST_ME_460},
{"effect461", CONST_ME_461},
{"effect462", CONST_ME_462},
{"effect463", CONST_ME_463},
{"effect464", CONST_ME_464},
{"effect465", CONST_ME_465},
{"effect466", CONST_ME_466},
{"effect467", CONST_ME_467},
{"effect468", CONST_ME_468},
{"effect469", CONST_ME_469},
{"effect470", CONST_ME_470},
{"effect471", CONST_ME_471},
{"effect472", CONST_ME_472},
{"effect473", CONST_ME_473},
{"effect474", CONST_ME_474},
{"effect475", CONST_ME_475},
{"effect476", CONST_ME_476},
{"effect477", CONST_ME_477},
{"effect478", CONST_ME_478},
{"effect479", CONST_ME_479},
{"effect480", CONST_ME_480},
{"effect481", CONST_ME_481},
{"effect482", CONST_ME_482},
{"effect483", CONST_ME_483},
{"effect484", CONST_ME_484},
{"effect485", CONST_ME_485},
{"effect486", CONST_ME_486},
{"effect487", CONST_ME_487},
{"effect488", CONST_ME_488},
{"effect489", CONST_ME_489},
{"effect490", CONST_ME_490},
{"effect491", CONST_ME_491},
{"effect492", CONST_ME_492},
{"effect493", CONST_ME_493},
{"effect494", CONST_ME_494},
{"effect495", CONST_ME_495},
{"effect496", CONST_ME_496},
{"effect497", CONST_ME_497},
{"effect498", CONST_ME_498},
{"effect499", CONST_ME_499},
{"effect500", CONST_ME_500},
{"effect501", CONST_ME_501},
{"effect502", CONST_ME_502},
{"effect503", CONST_ME_503},
{"effect504", CONST_ME_504},
{"effect505", CONST_ME_505},
{"effect506", CONST_ME_506},
{"effect507", CONST_ME_507},
{"effect508", CONST_ME_508},
{"effect509", CONST_ME_509},
{"effect510", CONST_ME_510},
{"effect511", CONST_ME_511},
{"effect512", CONST_ME_512},
{"effect513", CONST_ME_513},
{"effect514", CONST_ME_514},
{"effect515", CONST_ME_515},
{"effect516", CONST_ME_516},
{"effect517", CONST_ME_517},
{"effect518", CONST_ME_518},
{"effect519", CONST_ME_519},
{"effect520", CONST_ME_520},
{"effect521", CONST_ME_521},
{"effect522", CONST_ME_522},
{"effect523", CONST_ME_523},
{"effect524", CONST_ME_524},
{"effect525", CONST_ME_525},
{"effect526", CONST_ME_526},
{"effect527", CONST_ME_527},
{"effect528", CONST_ME_528},
{"effect529", CONST_ME_529},
{"effect530", CONST_ME_530},
{"effect531", CONST_ME_531},
{"effect532", CONST_ME_532},
{"effect533", CONST_ME_533},
{"effect534", CONST_ME_534},
{"effect535", CONST_ME_535},
{"effect536", CONST_ME_536},
{"effect537", CONST_ME_537},
{"effect538", CONST_ME_538},
{"effect539", CONST_ME_539},
{"effect540", CONST_ME_540},
{"effect541", CONST_ME_541},
{"effect542", CONST_ME_542},
{"effect543", CONST_ME_543},
{"effect544", CONST_ME_544},
{"effect545", CONST_ME_545},
{"effect546", CONST_ME_546},
{"effect547", CONST_ME_547},
{"effect548", CONST_ME_548},
{"effect549", CONST_ME_549},
{"effect550", CONST_ME_550},
{"effect551", CONST_ME_551},
{"effect552", CONST_ME_552},
{"effect553", CONST_ME_553},
{"effect554", CONST_ME_554},
{"effect555", CONST_ME_555},
{"effect556", CONST_ME_556},
{"effect557", CONST_ME_557},
{"effect558", CONST_ME_558},
{"effect559", CONST_ME_559},
{"effect560", CONST_ME_560},
{"effect561", CONST_ME_561},
{"effect562", CONST_ME_562},
{"effect563", CONST_ME_563},
{"effect564", CONST_ME_564},
{"effect565", CONST_ME_565},
{"effect566", CONST_ME_566},
{"effect567", CONST_ME_567},
{"effect568", CONST_ME_568},
{"effect569", CONST_ME_569},
{"effect570", CONST_ME_570},
{"effect571", CONST_ME_571},
{"effect572", CONST_ME_572},
{"effect573", CONST_ME_573},
{"effect574", CONST_ME_574},
{"effect575", CONST_ME_575},
{"effect576", CONST_ME_576},
{"effect577", CONST_ME_577},
{"effect578", CONST_ME_578},
{"effect579", CONST_ME_579},
{"effect580", CONST_ME_580},
{"effect581", CONST_ME_581},
{"effect582", CONST_ME_582},
{"effect583", CONST_ME_583},
{"effect584", CONST_ME_584},
{"effect585", CONST_ME_585},
{"effect586", CONST_ME_586},
{"effect587", CONST_ME_587},
{"effect588", CONST_ME_588},
{"effect589", CONST_ME_589},
{"effect590", CONST_ME_590},
{"effect591", CONST_ME_591},
{"effect592", CONST_ME_592},
{"effect593", CONST_ME_593},
{"effect594", CONST_ME_594},
{"effect595", CONST_ME_595},
{"effect596", CONST_ME_596},
{"effect597", CONST_ME_597},
{"effect598", CONST_ME_598},
{"effect599", CONST_ME_599},
{"effect600", CONST_ME_600},
{"effect601", CONST_ME_601},
{"effect602", CONST_ME_602},
{"effect603", CONST_ME_603},
{"effect604", CONST_ME_604},
{"effect605", CONST_ME_605},
{"effect606", CONST_ME_606},
{"effect607", CONST_ME_607},
{"effect608", CONST_ME_608},
{"effect609", CONST_ME_609},
{"effect610", CONST_ME_610},
{"effect611", CONST_ME_611},
{"effect612", CONST_ME_612},
{"effect613", CONST_ME_613},
{"effect614", CONST_ME_614},
{"effect615", CONST_ME_615},
{"effect616", CONST_ME_616},
{"effect617", CONST_ME_617},
{"effect618", CONST_ME_618},
{"effect619", CONST_ME_619},
{"effect620", CONST_ME_620},
{"effect621", CONST_ME_621},
{"effect622", CONST_ME_622},
{"effect623", CONST_ME_623},
{"effect624", CONST_ME_624},
{"effect625", CONST_ME_625},
{"effect626", CONST_ME_626},
{"effect627", CONST_ME_627},
{"effect628", CONST_ME_628},
{"effect629", CONST_ME_629},
{"effect630", CONST_ME_630},
{"effect631", CONST_ME_631},
{"effect632", CONST_ME_632},
{"effect633", CONST_ME_633},
{"effect634", CONST_ME_634},
{"effect635", CONST_ME_635},
{"effect636", CONST_ME_636},
{"effect637", CONST_ME_637},
{"effect638", CONST_ME_638},
{"effect639", CONST_ME_639},
{"effect640", CONST_ME_640},
{"effect641", CONST_ME_641},
{"effect642", CONST_ME_642},
{"effect643", CONST_ME_643},
{"effect644", CONST_ME_644},
{"effect645", CONST_ME_645},
{"effect646", CONST_ME_646},
{"effect647", CONST_ME_647},
{"effect648", CONST_ME_648},
{"effect649", CONST_ME_649},
{"effect650", CONST_ME_650},
{"effect651", CONST_ME_651},
{"effect652", CONST_ME_652},
{"effect653", CONST_ME_653},
{"effect654", CONST_ME_654},
{"effect655", CONST_ME_655},
{"effect656", CONST_ME_656},
{"effect657", CONST_ME_657},
{"effect658", CONST_ME_658},
{"effect659", CONST_ME_659},
{"effect660", CONST_ME_660},
{"effect661", CONST_ME_661},
{"effect662", CONST_ME_662},
{"effect663", CONST_ME_663},
{"effect664", CONST_ME_664},
{"effect665", CONST_ME_665},
{"effect666", CONST_ME_666},
{"effect667", CONST_ME_667},
{"effect668", CONST_ME_668},
{"effect669", CONST_ME_669},
{"effect670", CONST_ME_670},
{"effect671", CONST_ME_671},
{"effect672", CONST_ME_672},
{"effect673", CONST_ME_673},
{"effect674", CONST_ME_674},
{"effect675", CONST_ME_675},
{"effect676", CONST_ME_676},
{"effect677", CONST_ME_677},
{"effect678", CONST_ME_678},
{"effect679", CONST_ME_679},
{"effect680", CONST_ME_680},
{"effect681", CONST_ME_681},
{"effect682", CONST_ME_682},
{"effect683", CONST_ME_683},
{"effect684", CONST_ME_684},
{"effect685", CONST_ME_685},
{"effect686", CONST_ME_686},
{"effect687", CONST_ME_687},
{"effect688", CONST_ME_688},
{"effect689", CONST_ME_689},
{"effect690", CONST_ME_690},
{"effect691", CONST_ME_691},
{"effect692", CONST_ME_692},
{"effect693", CONST_ME_693},
{"effect694", CONST_ME_694},
{"effect695", CONST_ME_695},
{"effect696", CONST_ME_696},
{"effect697", CONST_ME_697},
{"effect698", CONST_ME_698},
{"effect699", CONST_ME_699},
{"effect700", CONST_ME_700},
{"effect701", CONST_ME_701},
{"effect702", CONST_ME_702},
{"effect703", CONST_ME_703},
{"effect704", CONST_ME_704},
{"effect705", CONST_ME_705},
{"effect706", CONST_ME_706},
{"effect707", CONST_ME_707},
{"effect708", CONST_ME_708},
{"effect709", CONST_ME_709},
{"effect710", CONST_ME_710},
{"effect711", CONST_ME_711},
{"effect712", CONST_ME_712},
{"effect713", CONST_ME_713},
{"effect714", CONST_ME_714},
{"effect715", CONST_ME_715},
{"effect716", CONST_ME_716},
{"effect717", CONST_ME_717},
{"effect718", CONST_ME_718},
{"effect719", CONST_ME_719},
{"effect720", CONST_ME_720},
{"effect721", CONST_ME_721},
{"effect722", CONST_ME_722},
{"effect723", CONST_ME_723},
{"effect724", CONST_ME_724},
{"effect725", CONST_ME_725},
{"effect726", CONST_ME_726},
{"effect727", CONST_ME_727},
{"effect728", CONST_ME_728},
{"effect729", CONST_ME_729},
{"effect730", CONST_ME_730},
{"effect731", CONST_ME_731},
{"effect732", CONST_ME_732},
{"effect733", CONST_ME_733},
{"effect734", CONST_ME_734},
{"effect735", CONST_ME_735},
{"effect736", CONST_ME_736},
{"effect737", CONST_ME_737},
{"effect738", CONST_ME_738}
};

ShootTypeNames shootTypeNames = {
	{"spear",		CONST_ANI_SPEAR},
	{"bolt",		CONST_ANI_BOLT},
	{"arrow",		CONST_ANI_ARROW},
	{"fire",		CONST_ANI_FIRE},
	{"energy",		CONST_ANI_ENERGY},
	{"poisonarrow",		CONST_ANI_POISONARROW},
	{"burstarrow",		CONST_ANI_BURSTARROW},
	{"throwingstar",	CONST_ANI_THROWINGSTAR},
	{"throwingknife",	CONST_ANI_THROWINGKNIFE},
	{"smallstone",		CONST_ANI_SMALLSTONE},
	{"death",		CONST_ANI_DEATH},
	{"largerock",		CONST_ANI_LARGEROCK},
	{"snowball",		CONST_ANI_SNOWBALL},
	{"powerbolt",		CONST_ANI_POWERBOLT},
	{"poison",		CONST_ANI_POISON},
	{"infernalbolt",	CONST_ANI_INFERNALBOLT},
	{"huntingspear",	CONST_ANI_HUNTINGSPEAR},
	{"enchantedspear",	CONST_ANI_ENCHANTEDSPEAR},
	{"redstar",		CONST_ANI_REDSTAR},
	{"greenstar",		CONST_ANI_GREENSTAR},
	{"royalspear",		CONST_ANI_ROYALSPEAR},
	{"sniperarrow",		CONST_ANI_SNIPERARROW},
	{"onyxarrow",		CONST_ANI_ONYXARROW},
	{"piercingbolt",	CONST_ANI_PIERCINGBOLT},
	{"whirlwindsword",	CONST_ANI_WHIRLWINDSWORD},
	{"whirlwindaxe",	CONST_ANI_WHIRLWINDAXE},
	{"whirlwindclub",	CONST_ANI_WHIRLWINDCLUB},
	{"etherealspear",	CONST_ANI_ETHEREALSPEAR},
	{"ice",			CONST_ANI_ICE},
	{"earth",		CONST_ANI_EARTH},
	{"holy",		CONST_ANI_HOLY},
	{"suddendeath",		CONST_ANI_SUDDENDEATH},
	{"flasharrow",		CONST_ANI_FLASHARROW},
	{"flammingarrow",	CONST_ANI_FLAMMINGARROW},
	{"shiverarrow",		CONST_ANI_SHIVERARROW},
	{"energyball",		CONST_ANI_ENERGYBALL},
	{"smallice",		CONST_ANI_SMALLICE},
	{"smallholy",		CONST_ANI_SMALLHOLY},
	{"smallearth",		CONST_ANI_SMALLEARTH},
	{"eartharrow",		CONST_ANI_EARTHARROW},
	{"explosion",		CONST_ANI_EXPLOSION},
	{"cake",		CONST_ANI_CAKE},
	{"tarsalarrow",		CONST_ANI_TARSALARROW},
	{"vortexbolt",		CONST_ANI_VORTEXBOLT},
	{"prismaticbolt",	CONST_ANI_PRISMATICBOLT},
	{"crystallinearrow",	CONST_ANI_CRYSTALLINEARROW},
	{"drillbolt",		CONST_ANI_DRILLBOLT},
	{"envenomedarrow",	CONST_ANI_ENVENOMEDARROW},
	{"gloothspear",		CONST_ANI_GLOOTHSPEAR},
	{"simplearrow",		CONST_ANI_SIMPLEARROW},
	{"distance56", CONST_ANI_56},
{"distance57", CONST_ANI_57},
{"distance58", CONST_ANI_58},
{"distance59", CONST_ANI_59},
{"distance60", CONST_ANI_60},
{"distance61", CONST_ANI_61},
{"distance62", CONST_ANI_62},
{"distance63", CONST_ANI_63},
{"distance64", CONST_ANI_64},
{"distance65", CONST_ANI_65},
{"distance66", CONST_ANI_66},
{"distance67", CONST_ANI_67},
{"distance68", CONST_ANI_68},
{"distance69", CONST_ANI_69},
{"distance70", CONST_ANI_70},
{"distance71", CONST_ANI_71},
{"distance72", CONST_ANI_72},
{"distance73", CONST_ANI_73},
{"distance74", CONST_ANI_74},
{"distance75", CONST_ANI_75},
{"distance76", CONST_ANI_76},
{"distance77", CONST_ANI_77},
{"distance78", CONST_ANI_78},
{"distance79", CONST_ANI_79},
{"distance80", CONST_ANI_80},
{"distance81", CONST_ANI_81},
{"distance82", CONST_ANI_82},
{"distance83", CONST_ANI_83},
{"distance84", CONST_ANI_84},
{"distance85", CONST_ANI_85},
{"distance86", CONST_ANI_86},
{"distance87", CONST_ANI_87},
{"distance88", CONST_ANI_88},
{"distance89", CONST_ANI_89},
{"distance90", CONST_ANI_90},
{"distance91", CONST_ANI_91},
{"distance92", CONST_ANI_92},
{"distance93", CONST_ANI_93},
{"distance94", CONST_ANI_94},
{"distance95", CONST_ANI_95},
{"distance96", CONST_ANI_96},
{"distance97", CONST_ANI_97},
{"distance98", CONST_ANI_98},
{"distance99", CONST_ANI_99},
{"distance100", CONST_ANI_100},
{"distance101", CONST_ANI_101},
{"distance102", CONST_ANI_102},
{"distance103", CONST_ANI_103},
{"distance104", CONST_ANI_104},
{"distance105", CONST_ANI_105},
{"distance106", CONST_ANI_106},
{"distance107", CONST_ANI_107},
{"distance108", CONST_ANI_108},
{"distance109", CONST_ANI_109},
{"distance110", CONST_ANI_110},
{"distance111", CONST_ANI_111},
{"distance112", CONST_ANI_112},
{"distance113", CONST_ANI_113},
{"distance114", CONST_ANI_114},
{"distance115", CONST_ANI_115},
{"distance116", CONST_ANI_116},
{"distance117", CONST_ANI_117},
{"distance118", CONST_ANI_118},
{"distance119", CONST_ANI_119},
{"distance120", CONST_ANI_120},
{"distance121", CONST_ANI_121},
{"distance122", CONST_ANI_122},
{"distance123", CONST_ANI_123},
{"distance124", CONST_ANI_124},
{"distance125", CONST_ANI_125},
{"distance126", CONST_ANI_126},
{"distance127", CONST_ANI_127},
{"distance128", CONST_ANI_128},
{"distance129", CONST_ANI_129},
{"distance130", CONST_ANI_130},
{"distance131", CONST_ANI_131},
{"distance132", CONST_ANI_132},
{"distance133", CONST_ANI_133},
{"distance134", CONST_ANI_134},
{"distance135", CONST_ANI_135},
{"distance136", CONST_ANI_136},
{"distance137", CONST_ANI_137},
{"distance138", CONST_ANI_138},
{"distance139", CONST_ANI_139},
{"distance140", CONST_ANI_140},
{"distance141", CONST_ANI_141},
{"distance142", CONST_ANI_142},
{"distance143", CONST_ANI_143},
{"distance144", CONST_ANI_144},
{"distance145", CONST_ANI_145},
{"distance146", CONST_ANI_146},
{"distance147", CONST_ANI_147},
{"distance148", CONST_ANI_148},
{"distance149", CONST_ANI_149},
{"distance150", CONST_ANI_150},
{"distance151", CONST_ANI_151},
{"distance152", CONST_ANI_152},
{"distance153", CONST_ANI_153},
{"distance154", CONST_ANI_154},
{"distance155", CONST_ANI_155},
{"distance156", CONST_ANI_156},
{"distance157", CONST_ANI_157},
{"distance158", CONST_ANI_158},
{"distance159", CONST_ANI_159},
{"distance160", CONST_ANI_160},
{"distance161", CONST_ANI_161},
{"distance162", CONST_ANI_162},
{"distance163", CONST_ANI_163},
{"distance164", CONST_ANI_164},
{"distance165", CONST_ANI_165},
{"distance166", CONST_ANI_166},
{"distance167", CONST_ANI_167},
{"distance168", CONST_ANI_168},
{"distance169", CONST_ANI_169},
{"distance170", CONST_ANI_170},
{"distance171", CONST_ANI_171},
{"distance172", CONST_ANI_172},
{"distance173", CONST_ANI_173},
{"distance174", CONST_ANI_174},
{"distance175", CONST_ANI_175},
{"distance176", CONST_ANI_176},
{"distance177", CONST_ANI_177},
{"distance178", CONST_ANI_178},
{"distance179", CONST_ANI_179},
{"distance180", CONST_ANI_180},
{"distance181", CONST_ANI_181},
{"distance182", CONST_ANI_182},
{"distance183", CONST_ANI_183},
{"distance184", CONST_ANI_184}
};

CombatTypeNames combatTypeNames = {
	{COMBAT_PHYSICALDAMAGE, 	"physical"},
	{COMBAT_ENERGYDAMAGE, 		"energy"},
	{COMBAT_EARTHDAMAGE, 		"earth"},
	{COMBAT_FIREDAMAGE, 		"fire"},
	{COMBAT_UNDEFINEDDAMAGE, 	"undefined"},
	{COMBAT_LIFEDRAIN, 		"lifedrain"},
	{COMBAT_MANADRAIN, 		"manadrain"},
	{COMBAT_HEALING, 		"healing"},
	{COMBAT_DROWNDAMAGE, 		"drown"},
	{COMBAT_ICEDAMAGE, 		"ice"},
	{COMBAT_HOLYDAMAGE, 		"holy"},
	{COMBAT_DEATHDAMAGE, 		"death"},
};

AmmoTypeNames ammoTypeNames = {
	{"spear",		AMMO_SPEAR},
	{"bolt",		AMMO_BOLT},
	{"arrow",		AMMO_ARROW},
	{"poisonarrow",		AMMO_ARROW},
	{"burstarrow",		AMMO_ARROW},
	{"throwingstar",	AMMO_THROWINGSTAR},
	{"throwingknife",	AMMO_THROWINGKNIFE},
	{"smallstone",		AMMO_STONE},
	{"largerock",		AMMO_STONE},
	{"snowball",		AMMO_SNOWBALL},
	{"powerbolt",		AMMO_BOLT},
	{"infernalbolt",	AMMO_BOLT},
	{"huntingspear",	AMMO_SPEAR},
	{"enchantedspear",	AMMO_SPEAR},
	{"royalspear",		AMMO_SPEAR},
	{"sniperarrow",		AMMO_ARROW},
	{"onyxarrow",		AMMO_ARROW},
	{"piercingbolt",	AMMO_BOLT},
	{"etherealspear",	AMMO_SPEAR},
	{"flasharrow",		AMMO_ARROW},
	{"flammingarrow",	AMMO_ARROW},
	{"shiverarrow",		AMMO_ARROW},
	{"eartharrow",		AMMO_ARROW},
};

WeaponActionNames weaponActionNames = {
	{"move",		WEAPONACTION_MOVE},
	{"removecharge",	WEAPONACTION_REMOVECHARGE},
	{"removecount",		WEAPONACTION_REMOVECOUNT},
};

SkullNames skullNames = {
	{"none",	SKULL_NONE},
	{"yellow",	SKULL_YELLOW},
	{"green",	SKULL_GREEN},
	{"white",	SKULL_WHITE},
	{"red",		SKULL_RED},
	{"black",	SKULL_BLACK},
	{"orange",	SKULL_ORANGE},
};

MagicEffectClasses getMagicEffect(const std::string& strValue)
{
	auto magicEffect = magicEffectNames.find(strValue);
	if (magicEffect != magicEffectNames.end()) {
		return magicEffect->second;
	}
	return CONST_ME_NONE;
}

ShootType_t getShootType(const std::string& strValue)
{
	auto shootType = shootTypeNames.find(strValue);
	if (shootType != shootTypeNames.end()) {
		return shootType->second;
	}
	return CONST_ANI_NONE;
}

std::string getCombatName(CombatType_t combatType)
{
	auto combatName = combatTypeNames.find(combatType);
	if (combatName != combatTypeNames.end()) {
		return combatName->second;
	}
	return "unknown";
}

Ammo_t getAmmoType(const std::string& strValue)
{
	auto ammoType = ammoTypeNames.find(strValue);
	if (ammoType != ammoTypeNames.end()) {
		return ammoType->second;
	}
	return AMMO_NONE;
}

WeaponAction_t getWeaponAction(const std::string& strValue)
{
	auto weaponAction = weaponActionNames.find(strValue);
	if (weaponAction != weaponActionNames.end()) {
		return weaponAction->second;
	}
	return WEAPONACTION_NONE;
}

Skulls_t getSkullType(const std::string& strValue)
{
	auto skullType = skullNames.find(strValue);
	if (skullType != skullNames.end()) {
		return skullType->second;
	}
	return SKULL_NONE;
}

std::string getSpecialSkillName(uint8_t skillid)
{
	switch (skillid) {
		case SPECIALSKILL_CRITICALHITCHANCE:
			return "critical hit chance";

		case SPECIALSKILL_CRITICALHITAMOUNT:
			return "critical extra damage";

		case SPECIALSKILL_LIFELEECHCHANCE:
			return "hitpoints leech chance";

		case SPECIALSKILL_LIFELEECHAMOUNT:
			return "hitpoints leech amount";

		case SPECIALSKILL_MANALEECHCHANCE:
			return "manapoints leech chance";

		case SPECIALSKILL_MANALEECHAMOUNT:
			return "mana points leech amount";

		case SPECIALSKILL_ATTACKSPEED:
			return "attack speed";

		case SPECIALSKILL_WEAKEN:
			return "damage dealt reduction";

		case SPECIALSKILL_EXTRAHEALING:
			return "extra healing";

		default:
			return "unknown";
	}
}

std::string getSkillName(uint8_t skillid)
{
	switch (skillid) {
		case SKILL_FIST:
			return "fist fighting";

		case SKILL_CLUB:
			return "focus";

		case SKILL_SWORD:
			return "strenght";

		case SKILL_AXE:
			return "arcana";

		case SKILL_DISTANCE:
			return "distance";

		case SKILL_SHIELD:
			return "defence";

		case SKILL_FISHING:
			return "fishing";

		case SKILL_MAGLEVEL:
			return "magic level";

		case SKILL_LEVEL:
			return "level";

		default:
			return "unknown";
	}
}

uint32_t adlerChecksum(const uint8_t* data, size_t length)
{
	if (length > NETWORKMESSAGE_MAXSIZE) {
		return 0;
	}

	const uint16_t adler = 65521;

	uint32_t a = 1, b = 0;

	while (length > 0) {
		size_t tmp = length > 5552 ? 5552 : length;
		length -= tmp;

		do {
			a += *data++;
			b += a;
		} while (--tmp);

		a %= adler;
		b %= adler;
	}

	return (b << 16) | a;
}

std::string ucfirst(std::string str)
{
	for (char& i : str) {
		if (i != ' ') {
			i = toupper(i);
			break;
		}
	}
	return str;
}

std::string ucwords(std::string str)
{
	size_t strLength = str.length();
	if (strLength == 0) {
		return str;
	}

	str[0] = toupper(str.front());
	for (size_t i = 1; i < strLength; ++i) {
		if (str[i - 1] == ' ') {
			str[i] = toupper(str[i]);
		}
	}

	return str;
}

bool booleanString(const std::string& str)
{
	if (str.empty()) {
		return false;
	}

	char ch = tolower(str.front());
	return ch != 'f' && ch != 'n' && ch != '0';
}

std::string getWeaponName(WeaponType_t weaponType)
{
	switch (weaponType) {
		case WEAPON_SWORD: return "sword";
		case WEAPON_CLUB: return "club";
		case WEAPON_AXE: return "axe";
		case WEAPON_DISTANCE: return "distance";
		case WEAPON_WAND: return "wand";
		case WEAPON_AMMO: return "ammunition";
		default: return std::string();
	}
}

size_t combatTypeToIndex(CombatType_t combatType)
{
	switch (combatType) {
		case COMBAT_PHYSICALDAMAGE:
			return 0;
		case COMBAT_ENERGYDAMAGE:
			return 1;
		case COMBAT_EARTHDAMAGE:
			return 2;
		case COMBAT_FIREDAMAGE:
			return 3;
		case COMBAT_UNDEFINEDDAMAGE:
			return 4;
		case COMBAT_LIFEDRAIN:
			return 5;
		case COMBAT_MANADRAIN:
			return 6;
		case COMBAT_HEALING:
			return 7;
		case COMBAT_DROWNDAMAGE:
			return 8;
		case COMBAT_ICEDAMAGE:
			return 9;
		case COMBAT_HOLYDAMAGE:
			return 10;
		case COMBAT_DEATHDAMAGE:
			return 11;
		default:
			return 0;
	}
}

CombatType_t indexToCombatType(size_t v)
{
	return static_cast<CombatType_t>(1 << v);
}

uint8_t serverFluidToClient(uint8_t serverFluid)
{
	uint8_t size = sizeof(clientToServerFluidMap) / sizeof(uint8_t);
	for (uint8_t i = 0; i < size; ++i) {
		if (clientToServerFluidMap[i] == serverFluid) {
			return i;
		}
	}
	return 0;
}

uint8_t clientFluidToServer(uint8_t clientFluid)
{
	uint8_t size = sizeof(clientToServerFluidMap) / sizeof(uint8_t);
	if (clientFluid >= size) {
		return 0;
	}
	return clientToServerFluidMap[clientFluid];
}

itemAttrTypes stringToItemAttribute(const std::string& str)
{
	if (str == "aid") {
		return ITEM_ATTRIBUTE_ACTIONID;
	} else if (str == "uid") {
		return ITEM_ATTRIBUTE_UNIQUEID;
	} else if (str == "description") {
		return ITEM_ATTRIBUTE_DESCRIPTION;
	} else if (str == "text") {
		return ITEM_ATTRIBUTE_TEXT;
	} else if (str == "date") {
		return ITEM_ATTRIBUTE_DATE;
	} else if (str == "writer") {
		return ITEM_ATTRIBUTE_WRITER;
	} else if (str == "name") {
		return ITEM_ATTRIBUTE_NAME;
	} else if (str == "article") {
		return ITEM_ATTRIBUTE_ARTICLE;
	} else if (str == "pluralname") {
		return ITEM_ATTRIBUTE_PLURALNAME;
	} else if (str == "weight") {
		return ITEM_ATTRIBUTE_WEIGHT;
	} else if (str == "attack") {
		return ITEM_ATTRIBUTE_ATTACK;
	} else if (str == "defense") {
		return ITEM_ATTRIBUTE_DEFENSE;
	} else if (str == "extradefense") {
		return ITEM_ATTRIBUTE_EXTRADEFENSE;
	} else if (str == "armor") {
		return ITEM_ATTRIBUTE_ARMOR;
	} else if (str == "hitchance") {
		return ITEM_ATTRIBUTE_HITCHANCE;
	} else if (str == "shootrange") {
		return ITEM_ATTRIBUTE_SHOOTRANGE;
	} else if (str == "owner") {
		return ITEM_ATTRIBUTE_OWNER;
	} else if (str == "duration") {
		return ITEM_ATTRIBUTE_DURATION;
	} else if (str == "decaystate") {
		return ITEM_ATTRIBUTE_DECAYSTATE;
	} else if (str == "corpseowner") {
		return ITEM_ATTRIBUTE_CORPSEOWNER;
	} else if (str == "charges") {
		return ITEM_ATTRIBUTE_CHARGES;
	} else if (str == "fluidtype") {
		return ITEM_ATTRIBUTE_FLUIDTYPE;
	} else if (str == "doorid") {
		return ITEM_ATTRIBUTE_DOORID;
	} else if (str == "decayto") {
		return ITEM_ATTRIBUTE_DECAYTO;
	} else if (str == "wrapid") {
		return ITEM_ATTRIBUTE_WRAPID;
	} else if (str == "storeitem") {
		return ITEM_ATTRIBUTE_STOREITEM;
	}
	return ITEM_ATTRIBUTE_NONE;
}

std::string getFirstLine(const std::string& str)
{
	std::string firstLine;
	firstLine.reserve(str.length());
	for (const char c : str) {
		if (c == '\n') {
			break;
		}
		firstLine.push_back(c);
	}
	return firstLine;
}

const char* getReturnMessage(ReturnValue value)
{
	switch (value) {
		case RETURNVALUE_DESTINATIONOUTOFREACH:
			return "Destination is out of range.";

		case RETURNVALUE_NOTMOVEABLE:
			return "You cannot move this object.";

		case RETURNVALUE_DROPTWOHANDEDITEM:
			return "Drop the double-handed object first.";

		case RETURNVALUE_BOTHHANDSNEEDTOBEFREE:
			return "Both hands need to be free.";

		case RETURNVALUE_CANNOTBEDRESSED:
			return "You cannot dress this object there.";

		case RETURNVALUE_PUTTHISOBJECTINYOURHAND:
			return "Put this object in your hand.";

		case RETURNVALUE_PUTTHISOBJECTINBOTHHANDS:
			return "Put this object in both hands.";

			/*	case RETURNVALUE_CANONLYUSEONEWEAPON:
				return "You may only use one weapon.";
		*/

		case RETURNVALUE_TOOFARAWAY:
			return "You are too far away.";

		case RETURNVALUE_FIRSTGODOWNSTAIRS:
			return "First go downstairs.";

		case RETURNVALUE_FIRSTGOUPSTAIRS:
			return "First go upstairs.";

		case RETURNVALUE_NOTENOUGHCAPACITY:
			return "This object is too heavy for you to carry.";

		case RETURNVALUE_CONTAINERNOTENOUGHROOM:
			return "You cannot put more objects in this container.";

		case RETURNVALUE_NEEDEXCHANGE:
		case RETURNVALUE_NOTENOUGHROOM:
			return "There is not enough room.";

		case RETURNVALUE_CANNOTPICKUP:
			return "You cannot take this object.";

		case RETURNVALUE_CANNOTTHROW:
			return "You cannot throw there.";

		case RETURNVALUE_THEREISNOWAY:
			return "There is no way.";

		case RETURNVALUE_THISISIMPOSSIBLE:
			return "This is impossible.";

		case RETURNVALUE_PLAYERISPZLOCKED:
			return "You can not enter a protection zone after attacking another player.";

		case RETURNVALUE_PLAYERISNOTINVITED:
			return "You are not invited.";

		case RETURNVALUE_CREATUREDOESNOTEXIST:
			return "Creature does not exist.";

		case RETURNVALUE_DEPOTISFULL:
			return "You cannot put more items in this depot.";

		case RETURNVALUE_CANNOTUSETHISOBJECT:
			return "You cannot use this object.";

		case RETURNVALUE_PLAYERWITHTHISNAMEISNOTONLINE:
			return "A player with this name is not online.";

		case RETURNVALUE_NOTREQUIREDLEVELTOUSERUNE:
			return "You do not have the required magic level to use this rune.";

		case RETURNVALUE_YOUAREALREADYTRADING:
			return "You are already trading. Finish this trade first.";

		case RETURNVALUE_THISPLAYERISALREADYTRADING:
			return "This player is already trading.";

		case RETURNVALUE_YOUMAYNOTLOGOUTDURINGAFIGHT:
			return "You may not logout during or immediately after a fight!";

		case RETURNVALUE_DIRECTPLAYERSHOOT:
			return "You are not allowed to shoot directly on players.";

		case RETURNVALUE_NOTENOUGHLEVEL:
			return "Your level is too low.";

		case RETURNVALUE_NOTENOUGHMAGICLEVEL:
			return "You do not have enough magic level.";

		case RETURNVALUE_NOTENOUGHMANA:
			return "You do not have enough mana.";

		case RETURNVALUE_NOTENOUGHSOUL:
			return "You do not have enough soul.";

		case RETURNVALUE_YOUAREEXHAUSTED:
			return "You are exhausted.";

		case RETURNVALUE_YOUCANNOTUSEOBJECTSTHATFAST:
			return "You cannot use objects that fast.";

		case RETURNVALUE_CANONLYUSETHISRUNEONCREATURES:
			return "You can only use it on creatures.";

		case RETURNVALUE_PLAYERISNOTREACHABLE:
			return "Player is not reachable.";

		case RETURNVALUE_CREATUREISNOTREACHABLE:
			return "Creature is not reachable.";

		case RETURNVALUE_ACTIONNOTPERMITTEDINPROTECTIONZONE:
			return "This action is not permitted in a protection zone.";

		case RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER:
			return "You may not attack this person.";

		case RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE:
			return "You may not attack this creature.";

		case RETURNVALUE_YOUMAYNOTATTACKAPERSONINPROTECTIONZONE:
			return "You may not attack a person in a protection zone.";

		case RETURNVALUE_YOUMAYNOTATTACKAPERSONWHILEINPROTECTIONZONE:
			return "You may not attack a person while you are in a protection zone.";

		case RETURNVALUE_YOUCANONLYUSEITONCREATURES:
			return "You can only use it on creatures.";

		case RETURNVALUE_TURNSECUREMODETOATTACKUNMARKEDPLAYERS:
			return "Turn secure mode off if you really want to attack unmarked players.";

		case RETURNVALUE_YOUNEEDPREMIUMACCOUNT:
			return "You need a premium account.";

		case RETURNVALUE_YOUNEEDTOLEARNTHISSPELL:
			return "You must learn this spell first.";

		case RETURNVALUE_YOURVOCATIONCANNOTUSETHISSPELL:
			return "You have the wrong vocation to cast this spell.";

		case RETURNVALUE_YOUNEEDAWEAPONTOUSETHISSPELL:
			return "You need to equip a weapon to use this spell.";

		case RETURNVALUE_PLAYERISPZLOCKEDLEAVEPVPZONE:
			return "You can not leave a pvp zone after attacking another player.";

		case RETURNVALUE_PLAYERISPZLOCKEDENTERPVPZONE:
			return "You can not enter a pvp zone after attacking another player.";

		case RETURNVALUE_ACTIONNOTPERMITTEDINANOPVPZONE:
			return "This action is not permitted in a non pvp zone.";

		case RETURNVALUE_YOUCANNOTLOGOUTHERE:
			return "You can not logout here.";

		case RETURNVALUE_YOUNEEDAMAGICITEMTOCASTSPELL:
			return "You need a magic item to cast this spell.";

		case RETURNVALUE_CANNOTCONJUREITEMHERE:
			return "You cannot conjure items here.";

		case RETURNVALUE_YOUNEEDTOSPLITYOURSPEARS:
			return "You need to split your spears first.";

		case RETURNVALUE_NAMEISTOOAMBIGUOUS:
			return "Player name is ambiguous.";

		case RETURNVALUE_CANONLYUSEONESHIELD:
			return "You may use only one shield.";

		case RETURNVALUE_NOPARTYMEMBERSINRANGE:
			return "No party members in range.";

		case RETURNVALUE_YOUARENOTTHEOWNER:
			return "You are not the owner.";

		case RETURNVALUE_NOSUCHRAIDEXISTS:
			return "No such raid exists.";

		case RETURNVALUE_ANOTHERRAIDISALREADYEXECUTING:
			return "Another raid is already executing.";

		case RETURNVALUE_TRADEPLAYERFARAWAY:
			return "Trade player is too far away.";

		case RETURNVALUE_YOUDONTOWNTHISHOUSE:
			return "You don't own this house.";

		case RETURNVALUE_TRADEPLAYERALREADYOWNSAHOUSE:
			return "Trade player already owns a house.";

		case RETURNVALUE_TRADEPLAYERHIGHESTBIDDER:
			return "Trade player is currently the highest bidder of an auctioned house.";

		case RETURNVALUE_YOUCANNOTTRADETHISHOUSE:
			return "You can not trade this house.";

		case RETURNVALUE_YOUDONTHAVEREQUIREDPROFESSION:
			return "You don't have the required profession.";

		case RETURNVALUE_CANNOTMOVEITEMISNOTSTOREITEM:
			return "You cannot move this item into your spell Bag.";

		case RETURNVALUE_ITEMCANNOTBEMOVEDTHERE:
			return "This item cannot be moved there.";

		case RETURNVALUE_YOUCANNOTUSETHISBED:
			return "This bed can't be used, but Premium Account players can rent houses and sleep in beds there to regain health and mana.";

		default: // RETURNVALUE_NOTPOSSIBLE, etc
			return "Sorry, not possible.";
	}
}

int64_t OTSYS_TIME()
{
	return std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch()).count();
}

SpellGroup_t stringToSpellGroup(const std::string& value)
{
	std::string tmpStr = asLowerCaseString(value);
	if (tmpStr == "attack" || tmpStr == "1") {
		return SPELLGROUP_ATTACK;
	} else if (tmpStr == "healing" || tmpStr == "2") {
		return SPELLGROUP_HEALING;
	} else if (tmpStr == "support" || tmpStr == "3") {
		return SPELLGROUP_SUPPORT;
	} else if (tmpStr == "special" || tmpStr == "4") {
		return SPELLGROUP_SPECIAL;
	}

	return SPELLGROUP_NONE;
}

std::string timeFromSeconds(uint64_t time)
{
	uint64_t days, hours, minutes, seconds;
	seconds = time % 60;
	minutes = time % 3600 / 60;
	hours = time % 86400 / 3600;
	days = time / 86400;

	std::ostringstream ss;
	if (days > 0) {
		ss << days << " days ";
	}
	if (hours > 0) {
		ss << hours << " hours ";
	}
	if (minutes > 0) {
		ss << minutes << " minutes ";
	}
	if (seconds > 0) {
		ss << seconds << " seconds ";
	}
	return ss.str();
}
