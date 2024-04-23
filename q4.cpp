#include<iostream>
using namespace std;

// Lines 1 to 36 are added to eliminate errors appearing in my text editor.
// These are dummy classes and functions which would be replaced in any real implementation.
const uint16_t INDEX_WHEREEVER = 1;
const uint16_t FLAG_NOLIMIT = 1;

Game g_game;

class Game {
   public:
   void display();
   void addItemToPlayer(const std::string& recipient, uint16_t itemId);
   Player* getPlayerByName(const std::string& recipient) {
    return nullptr;
   }
   void internalAddItem(uint16_t inbox, Item item, uint16_t index, uint16_t flag);
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

// The original method which has been edited to remove the memory leak
void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    // std::unique_ptr is a smart point which will dispose of player when it goes out of scope
    std::unique_ptr<Player> player(g_game.getPlayerByName(recipient));
    if (!player) {
        player.reset(new Player(nullptr));
        if (!IOLoginData::loadPlayerByName(player.get(), recipient)) {
            return;
        }
    }

    // std::unique_ptr is a smart point which will dispose of item when it goes out of scope
    std::unique_ptr<Item> item(Item::CreateItem(itemId));
    if (!item) {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item.get(), INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player.get());
    }
}
