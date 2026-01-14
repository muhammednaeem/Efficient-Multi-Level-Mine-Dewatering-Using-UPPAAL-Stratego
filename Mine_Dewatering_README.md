# Efficient Multi-Level Mine Dewatering Using UPPAAL Stratego

This repository contains UPPAAL Stratego models and scripts for **energy- and cost-aware control** of a **multi-level mine dewatering** system.  
The main objective is to keep reservoir levels within safe limits while reducing pumping cost under **time-varying (day-ahead) electricity prices**.

The work accompanies the paper **“Efficient Multi-Level Mine Dewatering Using Uppaal Stratego”** (included in this project). It presents:
- A formal timed model of a multi-level dewatering system in **UPPAAL Stratego**
- Two baselines: **Bang-Bang (threshold)** and **Price-Aware** control
- A **Q-learning** controller synthesized in Stratego
- A **pre-shield** that blocks unsafe actions during learning and execution while keeping the optimization objective intact

---

# Repository structure

- **Data/**  
  Input data for experiments (e.g., price signals, inflow traces/forecasts, scenario files).

- **Figures/**  
  Figures/plots generated from experiments and evaluation.

- **Libraries/**  
  Any extra libraries used by the models/scripts (if applicable).

- **UPPAAL Model/**  
  UPPAAL XML models for each controller (examples):
  - `Pump_Control(BB).xml` — Bang-Bang (threshold) controller
  - `Pump_Control(Efficient).xml` — Price-Aware controller
  - `Pump_Control(Learning).xml` — Learning-based (Q-learning) controller with pre-shield

- **Scripts (.sh)**  
  Helper scripts to execute experiments from the command line (names may include):
  - `BandBang_Contoller_Execution.sh`
  - `PriceAware_Controller_Execution.sh`
  - `Uppaal_Learning_Controller_Execution.sh` (or similar)

- **Readme.txt**  
  Additional notes (optional).

---

# Requirements

- **UPPAAL Stratego / UPPAAL** installed locally  
  Download: https://uppaal.org/downloads/
- macOS/Linux (or Windows with WSL) if you want to run the `.sh` scripts

> Tip: Avoid committing the UPPAAL application bundle itself (e.g., `UPPAAL-5.0.0.app`) to GitHub.  
> It is large and not needed for reproducibility.

---

# How to use

## Option 1: Run via UPPAAL (GUI)
1. Open UPPAAL Stratego.
2. Load a model from `UPPAAL Model/` (Bang-Bang, Price-Aware, or Learning).
3. Open the **Queries** tab and run the included queries (if present in the model).
4. Inspect traces, reservoir levels, pump actions, and cost/energy statistics.

## Option 2: Run via scripts
From the repository root:
```bash
chmod +x *.sh
./BandBang_Contoller_Execution.sh
./PriceAware_Controller_Execution.sh
./Uppaal_Learning_Controller_Execution.sh
```

If a script fails to find UPPAAL/Stratego binaries, open the script and update the path to match your local installation.

---

# Controllers (short description)

- **Bang-Bang controller**  
  A simple threshold policy: turns pumps fully ON/OFF based on reservoir bounds.

- **Price-Aware controller**  
  Extends threshold logic by incorporating electricity price information to shift pumping away from expensive hours when possible.

- **Learning-based controller (Q-learning in Stratego)**  
  Learns a policy over a 24-hour horizon using state information such as reservoir levels, inflow rates, and electricity price.
  A **pre-shield** prevents unsafe transitions during learning and execution.

---

# Citation

If you use or build on this work, please cite the accompanying paper included in this repository:
**Efficient Multi-Level Mine Dewatering Using Uppaal Stratego**.

---

# Authors

Muhammad Naeem (and collaborators listed in the paper)

---

# License

Add a license if you plan to release this publicly (e.g., MIT or Apache-2.0).  
If this repository is for internal/research use only, you can keep it without a license or mark it as proprietary.
