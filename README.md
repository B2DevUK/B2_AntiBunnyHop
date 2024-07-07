# B2 Scripts' Anti-Bunny Hop Script for FiveM

This script prevents players from bunny hopping or running while jumping in a FiveM server. It is designed to be standalone and highly customizable.

## Features

- Prevents bunny hopping by enforcing a cooldown between jumps.
- Prevents running while jumping by setting the player to ragdoll state if they exceed a certain speed threshold.
- Easily configurable via `config.lua`.

## Installation

1. **Download the script**:
   - Clone this repository or download the ZIP file and extract it.

2. **Place the script in your resources folder**:
   - Move the extracted folder to your `resources` directory in your FiveM server.

3. **Add the script to your server configuration**:
   - Open your `server.cfg` file and add the following line:
     ```
     ensure b2_antiBunnyHop
     ```
     Replace `b2_antiBunnyHop` with the name of the folder you placed in the `resources` directory.

4. **Start your server**:
   - Restart your FiveM server or start it if it was not running.

## Configuration

The script is highly customizable via the `config.lua` file. Below are the available configuration options:

- **AntiBunnyHopEnabled**: Enable or disable the anti-bunny hop feature.
  ```lua
  Config.AntiBunnyHopEnabled = true
