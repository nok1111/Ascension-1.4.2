#ifndef PET_H
#define PET_H

#include "fileloader.h"

enum PetAttr_t {
    PET_NAME = 1,
    PET_TYPE,
    PET_LEVEL,
    PET_EXP,
    PET_ID,
    //for serialization
    PET_END = 254
};

class Pet {
public:
    Pet(uint32_t aPetId);

    static Pet* createPet(std::string aName, unsigned char aLvl, short aExp, char aType, uint32_t aMonsterId, uint32_t aPetId);
    static Pet* createPet(PropStream& propStream);

    //serialization
    bool unserialize(PropStream& propStream);
    void serialize(PropWriteStream& propWriteStream);

    void setName(std::string aName);
    void setLevel(unsigned char aLvl);
    void setExp(short aExp);
    void setType(char aType);
    void setPetId(uint32_t aId);
    void setMonsterId(uint32_t aId);

	std::string getName() const;
	uint32_t getPetId() const;
	uint32_t getMonsterId() const;
	unsigned char getLevel() const;
	short getExp() const;
	char getType() const;

protected:
    unsigned char mLevel;
    std::string mName; //name max length is 10 chars
    short mExp;
    char mType;
    uint32_t mPetId;
    uint32_t mMonsterId;

private:
    static uint32_t mPetUniqueId;
};

#endif // PET_H
