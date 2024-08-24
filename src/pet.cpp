#include "otpch.h"

#include "pet.h"
#include "monster.h"
#include "game.h"

extern Game g_game;

uint32_t Pet::mPetUniqueId = 0x00FF0000;

Pet::Pet(uint32_t aPetId) {
    mLevel = 1;
    mName = "Pet";
    mExp = 1;
    mType = 0;
    mMonsterId = 0;
    if (aPetId == 0x0) {
        mPetId = mPetUniqueId++;
    } else {
        mPetId = aPetId;
        if (aPetId >= mPetUniqueId) {
            mPetUniqueId = aPetId + 1;
        }
    }
}

Pet* Pet::createPet(std::string aName, unsigned char aLvl, short aExp, char aType,  uint32_t aMonsterId, uint32_t aPetId) {
    Pet *vRetPet = new Pet(aPetId);
    vRetPet->setName(aName);
    vRetPet->setLevel(aLvl);
    vRetPet->setExp(aExp);
    vRetPet->setType(aType);
    vRetPet->setMonsterId(aMonsterId);
    return vRetPet;
}

Pet* Pet::createPet(PropStream& propStream) {
    uint8_t attr;
    if (!propStream.read<uint8_t>(attr) || attr != PET_NAME) {
        return nullptr;
    }
    std::string vName;
    if (!propStream.readString(vName)) {
        return nullptr;
    }

    if (!propStream.read<uint8_t>(attr) || attr != PET_TYPE) {
        return nullptr;
    }
    char vType;
    if (!propStream.read<char>(vType)) {
        return nullptr;
    }

    if (!propStream.read<uint8_t>(attr) || attr != PET_LEVEL) {
        return nullptr;
    }
    unsigned char vLvl;
    if (!propStream.read<uint8_t>(vLvl)) {
        return nullptr;
    }


    if (!propStream.read<uint8_t>(attr) || attr != PET_EXP) {
        return nullptr;
    }
    short vExp;
    if (!propStream.read<short>(vExp)) {
        return nullptr;
    }

    if (!propStream.read<uint8_t>(attr) || attr != PET_ID) {
        return nullptr;
    }
    uint32_t vPetId;
    if (!propStream.read<uint32_t>(vPetId)) {
        return nullptr;
    }

    if (!propStream.read<uint8_t>(attr) || attr != PET_END) {
        return nullptr;
    }

    return Pet::createPet(vName, vLvl, vExp, vType, 0, vPetId);
}


bool Pet::unserialize(PropStream& propStream) {
    uint8_t attr;
    if (!propStream.read<uint8_t>(attr) || attr != PET_NAME) {
        return false;
    }
    std::string vName;
    if (!propStream.readString(vName)) {
        return false;
    }
    mName = vName;

    if (!propStream.read<uint8_t>(attr) || attr != PET_TYPE) {
        return false;
    }
    char vType;
    if (!propStream.read<char>(vType)) {
        return false;
    }
    mType = vType;

    if (!propStream.read<uint8_t>(attr) || attr != PET_LEVEL) {
        return false;
    }
    unsigned char vLvl;
    if (!propStream.read<uint8_t>(vLvl)) {
        return false;
    }
    mLevel = vLvl;

    if (!propStream.read<uint8_t>(attr) || attr != PET_EXP) {
        return false;
    }
    short vExp;
    if (!propStream.read<short>(vExp)) {
        return false;
    }
    mExp = vExp;

    if (!propStream.read<uint8_t>(attr) || attr != PET_ID) {
        return false;
    }
    uint32_t vPetId;
    if (!propStream.read<uint32_t>(vPetId)) {
        return false;
    }
    mPetId = vPetId;
    mMonsterId = 0;

    if (!propStream.read<uint8_t>(attr) || attr == PET_END) {
        std::cout << "PET_END" << std::endl;
        return true;
    }
    return true;
}

void Pet::serialize(PropWriteStream& propWriteStream) {
    propWriteStream.write<uint8_t>(PET_NAME);
    propWriteStream.writeString(mName);

    propWriteStream.write<uint8_t>(PET_TYPE);
    propWriteStream.write<uint8_t>(mType);

    propWriteStream.write<uint8_t>(PET_LEVEL);
    propWriteStream.write<uint8_t>(mLevel);

    propWriteStream.write<uint8_t>(PET_EXP);
    propWriteStream.write<short>(mExp);

    propWriteStream.write<uint8_t>(PET_ID);
    propWriteStream.write<uint32_t>(mPetId);
}

void Pet::setName(std::string aName) {
    mName = aName;
    if (mMonsterId > 0) {
        Monster *monster = g_game.getMonsterByID(mMonsterId);
        if (monster) {
            monster->setExtraName(mName);
            g_game.updateCreatureName(monster);
        } else {
            std::cout << "Can't find monster" << std::endl;
        }
    }
}

void Pet::setLevel(unsigned char aLvl) {
    mLevel = aLvl;
}

void Pet::setExp(short aExp) {
    mExp = aExp;
}

void Pet::setType(char aType) {
    mType = aType;
}

void Pet::setPetId(uint32_t aId) {
    mPetId = aId;
}

void Pet::setMonsterId(uint32_t aId) {
    mMonsterId = aId;
}

uint32_t Pet::getPetId() const {
    return mPetId;
}

uint32_t Pet::getMonsterId() const {
    return mMonsterId;
}

std::string Pet::getName() const {
    return mName;
}

unsigned char Pet::getLevel() const {
    return mLevel;
}
short Pet::getExp() const {
    return mExp;
}
char Pet::getType() const {
    return mType;
}
