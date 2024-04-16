#include<iostream>
using namespace std;

// My additional code:
const uint16_t INDEX_WHEREEVER = 1;
const uint16_t FLAG_NOLIMIT = 1;

Game g_game;

class Game {
   public:
   void display();
   void addItemToPlayer(const std::string& recipient, uint16_t itemId);
   Player* getPlayerByName() {
    return nullptr;
   }
};
class IOLoginData{
    public:
    static Player* loadPlayerByName(Player* player, const std::string& recipient);
    static Item* savePlayer(Player* player);
};
class Player {
    public:
    Player(nullptr_t value) {}
    uint16_t getInbox();
    bool isOffline();
};
class Item {
    public:
    static Item* CreateItem(uint16_t itemId) {
        return nullptr;
    }
};

// Original code:
void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
}
