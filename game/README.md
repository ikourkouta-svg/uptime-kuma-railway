# Star Catcher Duel

A tiny 2-player game for a grown-up and a kid on one phone. No install, no ads, no network.

## How to play

1. Hold the phone **sideways** (landscape).
2. Player 1 uses the **left half**, Player 2 the **right half**.
3. **Drag your finger** on your side to move your basket.
4. Catch:
   - ⭐ Star — +1
   - 💖 Heart — +2
   - 🌈 Rainbow — +3
5. Avoid:
   - 💣 Bomb — −2
6. You have **60 seconds**. Highest score wins.

## How to open it on your phone

Pick any one of these — whichever is easiest for you:

**Easiest — GitHub Pages (free, shareable link):**
1. In your GitHub repo, go to **Settings → Pages**.
2. Under *Build and deployment*, choose **Deploy from a branch**.
3. Pick branch `claude/create-mobile-game-2tt7B` and folder `/ (root)`. Save.
4. After a minute, GitHub gives you a URL ending in `/game/`. Open it on your phone.

**Quick — serve locally from a laptop on the same Wi-Fi:**
```bash
cd game
python3 -m http.server 8000
```
Then on your phone's browser, visit `http://<your-laptop-ip>:8000/`.

**Offline — copy the file to the phone:**
Email / AirDrop / message `game/index.html` to yourself and tap to open it.

## Tip

After opening in the browser, tap the browser menu → **Add to Home Screen** so it
launches like an app.
