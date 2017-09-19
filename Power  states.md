**Power  states**

**Global states**

The ACPI specification defines the following four(4) global "Gx" states and six(6) sleep "Sx" states for an ACPI-compliant computer system:

    1.G0 (S0), Working: The computer is running and the CPU executes instructions. "Awaymode" is a subset of S0, where monitor is off but background tasks are running.
    
    2.G1, Sleeping: Divided into four states, S1 through S4:
        S1, Power on Suspend (POS): Processor caches are flushed, and the CPU(s) stops executing instructions. The power to the CPU(s) and RAM is maintained. Devices that do not indicate they must remain on may be powered off.
        S2: CPU powered off. Dirty cache is flushed to RAM.
        S3, commonly referred to as Standby, Sleep, or Suspend to RAM (STR): RAM remains powered.
        S4, Hibernation or Suspend to Disk: All content of the main memory is saved to non-volatile memory such as a hard drive, and the system is powered down.
        
    3.G2 (S5), Soft Off: G2/S5 is almost the same as G3 Mechanical Off, except that the power supply unit (PSU) still supplies power, at a minimum, to the power button to allow return to S0. A full reboot is required. No previous content is retained. Other components may remain powered so the computer can "wake" on input from the keyboard, clock, modem, LAN, or USB device.
    
    4.G3, Mechanical Off: The computer's power has been totally removed via a mechanical switch (as on the rear of a PSU). The power cord can be removed and the system is safe for disassembly (typically, only the real-time clock continues to run using its own small battery).

The specification also defines a Legacy state: the state on an operating system which does not support ACPI. In this state, the hardware and power are not managed via ACPI, effectively disabling ACPI.



**Device states**

The device states D0–D3 are device dependent:

    D0 or Fully On is the operating state.
    D1 and D2 are intermediate power-states whose definition varies by device.
    D3: The D3 state is further divided into D3 Hot (has aux power), and D3 Cold (no power provided):
        Hot: A device can assert power management requests to transition to higher power states.
        Cold or Off has the device powered off and unresponsive to its bus.


**Processor states**

The CPU power states C0–C3 are defined as follows:

    C0 is the operating state.
    
    C1 (often known as Halt) is a state where the processor is not executing instructions, but can return to an executing state essentially instantaneously. All ACPI-conformant processors must support this power state. Some processors, such as the Pentium 4, also support an Enhanced C1 state (C1E or Enhanced Halt State) for lower power consumption.
    
    C2 (often known as Stop-Clock) is a state where the processor maintains all software-visible state, but may take longer to wake up. This processor state is optional.
    
    C3 (often known as Sleep) is a state where the processor does not need to keep its cache coherent, but maintains other state. Some processors have variations on the C3 state (Deep Sleep, Deeper Sleep, etc.) that differ in how long it takes to wake the processor. This processor state is optional.
    Additional states are defined by manufacturers for some processors. For example, Intel's Haswell platform has states up to C10, where it distinguishes core states and package states.
**Performance states**

While a device or processor operates (D0 and C0, respectively), it can be in one of several power-performance states. These states are implementation-dependent. Though, P0 is always the highest-performance state; with P1 to Pn being successively lower-performance states, up to an implementation-specific limit of n no greater than 16.[27]

P-states have become known as SpeedStep in Intel processors, as PowerNow! or Cool'n'Quiet in AMD processors, and as PowerSaver in VIA processors.

    P0 max power and frequency
    P1 less than P0, voltage and frequency scaled
    P2 less than P1, voltage and frequency scaled
    ...
    Pn less than P(n-1), voltage and frequency scaled