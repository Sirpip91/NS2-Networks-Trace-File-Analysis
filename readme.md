# 🌐 Networks Trace File Analysis

**This project was created for studying CSMA/CD and 802.11 (CSMA/CD) Protocols**

## 🗂 Project Structure

The project is organized into two main folders, each corresponding to a type of network:

### 1. 🌐 Wired LAN
This folder contains files related to wired LAN using CSMA/CD protocols.

- **Files:**
  - `wiredlan.tcl`: The original TCL script.
  - `wiredlanincreased7.tcl` and `wiredlanincreased.tcl`: Scripts with additional network load.
  
- **AWK Scripts:**
  - `📄 packetdeliveryratiowired.awk` and `📄 throughputwired.awk`: These scripts generate data outputs and formatted text for graphs.

- **Outputs:**
  - `📄 test.txt`: Output used for creating graphs.
  - 📊 Various `.png` files generated from the outputs using `makegraph.sh`.

### 2. 📡 Wireless LAN
This folder contains files related to wireless LAN in Ad Hoc mode using 802.11 protocols.

- **Files:**
  - `wirelessLan.tcl`: The original NS2 script.
  - `wirelessLan5nodes.tcl`: Script showcasing additional load with 5 nodes.
  - `10node.tcl`: Script showcasing 10 nodes.

- **AWK Scripts:**
  - `📄 packetdeliveryratio.awk`, `📄 throughput.awk`, and `📄 throughputavg.awk`: These scripts output necessary information for wireless networks.

- **Outputs:**
  - 📊 Various `.txt` files created to be used by `makegraph.sh` to generate `.png` graphs.

Each script is located in the appropriate folder for its specific network setting (wireless/wired).

I hope you find this project and the experiments conducted to observe network behavior informative and useful.

Thank you.

## 🛠 How to Run

1. **Create and run your .tcl script:**
    ```sh
    ns filename.tcl
    ```

2. **Two files will be created:**
   - 📄 `.nam` (GUI)
   - 📄 `.tr` (trace)

3. **Run the .awk scripts on the .tr file:**
    ```sh
    gawk -f throughputavg.awk wirelessLan.tr
    ```

    ![Graph Example](https://github.com/Sirpip91/NS2-Networks-Trace-File-Analysis/blob/main/wirelesslan/Picture2.png)

4. **Create graphs:**
   - Edit `makegraph.sh` with the correct files, then run:
    ```sh
    gnuplot makegraph.sh
    ```

**🔔 Note:** Before running the .sh and gnuplot to create graphs, ensure the AWK scripts format the information into a .txt file.

## 🖥 NAM View in NS

![NAM View](https://github.com/Sirpip91/NS2-Networks-Trace-File-Analysis/blob/main/wirelesslan/nam.png)
