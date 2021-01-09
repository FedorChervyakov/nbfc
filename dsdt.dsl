/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180105 (64-bit version)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of dsdt.dat, Fri May 11 16:21:24 2018
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000F9FC (63996)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0xA0
 *     OEM ID           "ATI"
 *     OEM Table ID     "SB800"
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x03000001 (50331649)
 */
DefinitionBlock ("", "DSDT", 1, "ATI", "SB800", 0x06040000)
{
    External (_PR_.C000._PPC, UnknownObj)
    External (_PR_.C001, UnknownObj)
    External (_PR_.C001._PPC, UnknownObj)
    External (_PR_.C002, UnknownObj)
    External (_PR_.C002._PPC, UnknownObj)
    External (_PR_.C003, UnknownObj)
    External (_PR_.C003._PPC, UnknownObj)

    Name (Z000, 0x01)
    Name (Z001, 0x02)
    Name (Z002, 0x04)
    Name (Z003, 0x08)
    Name (Z004, 0x00)
    Name (Z005, 0x0F)
    Name (Z006, 0x0D)
    Name (Z007, 0x0B)
    Name (Z008, 0x09)
    Scope (\_PR)
    {
        Processor (C000, 0x00, 0x00008010, 0x06){}
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
        Zero
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x04)  // _S3_: S3 System State
    {
        0x03, 
        0x03, 
        0x00, 
        0x00
    })
    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x04, 
        0x04, 
        0x00, 
        0x00
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        0x05, 
        0x00, 
        0x00
    })
    OperationRegion (\DEB2, SystemIO, 0x80, 0x02)
    Field (\DEB2, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }

    OperationRegion (\PMIO, SystemIO, 0x0CD6, 0x02)
    Field (\PMIO, ByteAcc, NoLock, Preserve)
    {
        PIDX,   8, 
        PDAT,   8
    }

    OperationRegion (\P01, SystemIO, 0x8001, 0x01)
    Field (\P01, ByteAcc, NoLock, Preserve)
    {
        PST1,   8
    }

    Scope (\_SB)
    {
        Name (LINX, 0x00)
        Name (OSSP, 0x00)
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0x6FEAED9C, 0x00000001)
        Field (OSTY, AnyAcc, NoLock, Preserve)
        {
            TPOS,   8
        }

        Method (OSTP, 0, NotSerialized)
        {
            If ((^OSTB == Ones))
            {
                If (CondRefOf (\_OSI, Local0))
                {
                    ^OSTB = 0x00
                    ^TPOS = 0x00
                    If (\_OSI ("Windows 2001"))
                    {
                        ^OSTB = 0x08
                        ^TPOS = 0x08
                    }

                    If (\_OSI ("Windows 2001.1"))
                    {
                        ^OSTB = 0x20
                        ^TPOS = 0x20
                    }

                    If (\_OSI ("Windows 2001 SP1"))
                    {
                        ^OSTB = 0x10
                        ^TPOS = 0x10
                    }

                    If (\_OSI ("Windows 2001 SP2"))
                    {
                        ^OSTB = 0x11
                        ^TPOS = 0x11
                    }

                    If (\_OSI ("Windows 2001 SP3"))
                    {
                        ^OSTB = 0x12
                        ^TPOS = 0x12
                    }

                    If (\_OSI ("Windows 2006"))
                    {
                        ^OSTB = 0x40
                        ^TPOS = 0x40
                    }

                    If (\_OSI ("Windows 2006 SP1"))
                    {
                        OSSP = 0x01
                        ^OSTB = 0x40
                        ^TPOS = 0x40
                    }

                    If (\_OSI ("Windows 2009"))
                    {
                        OSSP = 0x01
                        ^OSTB = 0x50
                        ^TPOS = 0x50
                    }

                    If (\_OSI ("Linux"))
                    {
                        LINX = 0x01
                        ^OSTB = 0x80
                        ^TPOS = 0x80
                    }
                }
                ElseIf (CondRefOf (\_OS, Local0))
                {
                    If (^SEQL (\_OS, "Microsoft Windows"))
                    {
                        ^OSTB = 0x01
                        ^TPOS = 0x01
                    }
                    ElseIf (^SEQL (\_OS, "Microsoft WindowsME: Millennium Edition"))
                    {
                        ^OSTB = 0x02
                        ^TPOS = 0x02
                    }
                    ElseIf (^SEQL (\_OS, "Microsoft Windows NT"))
                    {
                        ^OSTB = 0x04
                        ^TPOS = 0x04
                    }
                    Else
                    {
                        ^OSTB = 0x00
                        ^TPOS = 0x00
                    }
                }
                Else
                {
                    ^OSTB = 0x00
                    ^TPOS = 0x00
                }

                \_SB.PCI0.LPC0.BCMD = 0xB0
                \_SB.PCI0.LPC0.SMIC = Zero
                If ((TPOS == 0x80)){}
            }

            Return (^OSTB) /* \_SB_.OSTB */
        }

        Method (SEQL, 2, Serialized)
        {
            Local0 = SizeOf (Arg0)
            Local1 = SizeOf (Arg1)
            If ((Local0 != Local1))
            {
                Return (Zero)
            }

            Name (BUF0, Buffer (Local0){})
            BUF0 = Arg0
            Name (BUF1, Buffer (Local0){})
            BUF1 = Arg1
            Local2 = Zero
            While ((Local2 < Local0))
            {
                Local3 = DerefOf (BUF0 [Local2])
                Local4 = DerefOf (BUF1 [Local2])
                If ((Local3 != Local4))
                {
                    Return (Zero)
                }

                Local2++
            }

            Return (One)
        }
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        \_SB.PCI0.LPC0.EC0.ECPS (Arg0)
        If ((Arg0 == 0x05))
        {
            PHSR (0x9A, 0x00)
            \_SB.PCI0.SMB.SLPS = One
        }

        If ((Arg0 == 0x04))
        {
            \_SB.PCI0.SMB.SLPS = One
        }

        If ((Arg0 == 0x03))
        {
            \_SB.PCI0.SMB.RSTU = Zero
            \_SB.PCI0.SMB.SLPS = One
            \_SB.PCI0.SMB.BLNK = 0x01
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        \_SB.PCI0.LPC0.EC0.ECWK (Arg0)
        If ((\_SB.TPOS >= 0x40)){}
        If ((\_SB.TPOS == 0x80)){}
        \_SB.PCI0.LPC0.BCMD = 0x81
        \_SB.PCI0.LPC0.SMIC = Zero
        If ((Arg0 == 0x03))
        {
            \_SB.PCI0.SMB.RSTU = One
            PIDX = 0x80
            Local0 = PDAT /* \PDAT */
            Local0 &= 0x40
            If ((Local0 == 0x00))
            {
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }
        }

        If ((Arg0 == 0x04))
        {
            If (GPIC)
            {
                \_SB.PCI0.LPC0.DSPI ()
            }

            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Notify (\_SB.PCI0, 0x00) // Bus Check
    }

    Scope (\_SI)
    {
        Method (_SST, 1, NotSerialized)  // _SST: System Status
        {
            If ((Arg0 == 0x01))
            {
                Debug = "===== SST Working ====="
            }

            If ((Arg0 == 0x02))
            {
                Debug = "===== SST Waking ====="
            }

            If ((Arg0 == 0x03))
            {
                Debug = "===== SST Sleeping ====="
            }

            If ((Arg0 == 0x04))
            {
                Debug = "===== SST Sleeping S4 ====="
            }
        }
    }

    Name (\GPIC, 0x00)
    Method (\_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        GPIC = Arg0
        If (Arg0)
        {
            \_SB.PCI0.LPC0.DSPI ()
        }
    }

    Scope (\_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
        }

        Device (PCI0)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Name (_UID, 0x01)  // _UID: Unique ID
            Name (_BBN, 0x00)  // _BBN: BIOS Bus Number
            Name (AMHP, 0x00000000)
            Name (VGPU, 0x00010000)
            Scope (\_SB.PCI0)
            {
                Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
                Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
                Name (SUPP, 0x00)
                Name (CTRL, 0x00)
                Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
                {
                    CreateDWordField (Arg3, 0x00, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                    {
                        SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                        CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                        If ((((SUPP & 0x16) != 0x16) || (AMHP == 0x80000000)))
                        {
                            CTRL &= 0x1E
                        }

                        CTRL &= 0x1D
                        If (~(CDW1 & 0x01))
                        {
                            If (\_SB.OSSP)
                            {
                                If ((CTRL & 0x01)){}
                                If ((CTRL & 0x04))
                                {
                                    \_SB.PCI0.SMB.EPNM = One
                                    \_SB.PCI0.SMB.DPPF = Zero
                                    \_SB.PCI0.SMB.PWDE = One
                                }
                                Else
                                {
                                    \_SB.PCI0.SMB.EPNM = Zero
                                    \_SB.PCI0.SMB.DPPF = One
                                    \_SB.PCI0.SMB.PWDE = Zero
                                }
                            }
                        }

                        If ((Arg1 != One))
                        {
                            CDW1 |= 0x08
                        }

                        If ((CDW3 != CTRL))
                        {
                            CDW1 |= 0x10
                        }

                        CDW3 = CTRL /* \_SB_.PCI0.CTRL */
                        Return (Arg3)
                    }
                    Else
                    {
                        CDW1 |= 0x04
                        Return (Arg3)
                    }
                }
            }

            Name (INIW, 0x00)
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If ((INIW == 0x00))
                {
                    INIW = 0x01
                    PHSR (0x99, 0x00)
                }

                \_SB.OSTP ()
                If (((TPOS == 0x40) && (OSSP == 0x00)))
                {
                    AMHP = 0x80000000
                }

                If (!((TPOS >= 0x01) && (TPOS <= 0x04)))
                {
                    If (((TPOS < 0x40) || (AMHP == 0x80000000)))
                    {
                        Local1 = DerefOf (HPDT [0x01])
                        If ((Local1 != 0x80000000))
                        {
                            OperationRegion (EXH1, SystemMemory, DerefOf (HPDT [0x01]), DerefOf (HPDT [0x02]))
                            Load (EXH1, \DDB0)
                        }
                    }
                }

                If (((TPOS >= 0x40) && (AMHP == 0x00)))
                {
                    Local1 = DerefOf (HPDT [0x04])
                    If ((Local1 != 0x80000000))
                    {
                        OperationRegion (EXH2, SystemMemory, DerefOf (HPDT [0x04]), DerefOf (HPDT [0x05]))
                        Load (EXH2, \DDB1)
                    }
                }

                Local1 = DerefOf (HPDT [0x07])
                If ((Local1 != 0x80000000))
                {
                    OperationRegion (EXH3, SystemMemory, DerefOf (HPDT [0x07]), DerefOf (HPDT [0x08]))
                    Load (EXH3, \DDB2)
                }

                If (((TPOS >= 0x04) && (TPOS < 0x40))){}
            }

            OperationRegion (NBRV, PCI_Config, 0x08, 0x01)
            Field (NBRV, ByteAcc, NoLock, Preserve)
            {
                PREV,   8
            }

            OperationRegion (NBBR, PCI_Config, 0x1C, 0x08)
            Field (NBBR, DWordAcc, NoLock, Preserve)
            {
                BR3L,   32, 
                BR3H,   32
            }

            OperationRegion (NBBI, PCI_Config, 0x84, 0x04)
            Field (NBBI, DWordAcc, NoLock, Preserve)
            {
                PARB,   32
            }

            OperationRegion (NBMS, PCI_Config, 0x60, 0x08)
            Field (NBMS, DWordAcc, NoLock, Preserve)
            {
                MIDX,   32, 
                MIDR,   32
            }

            OperationRegion (NBXP, PCI_Config, 0xE0, 0x08)
            Field (NBXP, DWordAcc, NoLock, Preserve)
            {
                NBXI,   32, 
                NBXD,   32
            }

            Mutex (NBMM, 0x00)
            Mutex (NBXM, 0x00)
            Method (NBMR, 1, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                Local0 = (Arg0 & 0x7F)
                MIDX = Local0
                Local0 = MIDR /* \_SB_.PCI0.MIDR */
                MIDX = 0x7F
                Release (NBMM)
                Return (Local0)
            }

            Method (NBMW, 2, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                Local0 = (Arg0 & 0x7F)
                Local0 |= 0x80
                MIDX = Local0
                MIDR = Arg1
                MIDX = Local0 &= 0x7F
                Release (NBMM)
            }

            Method (NBXR, 1, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                NBXI = Arg0
                Local0 = NBXD /* \_SB_.PCI0.NBXD */
                NBXI = 0x00
                Release (NBXM)
                Return (Local0)
            }

            Method (NBXW, 2, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                NBXI = Arg0
                NBXD = Arg1
                NBXI = 0x00
                Release (NBXM)
            }

            Method (GFXM, 0, NotSerialized)
            {
                Local0 = NBMR (0x08)
                Local0 >>= 0x08
                Local0 &= 0x0F
                Return (Local0)
            }

            Method (GPPM, 0, NotSerialized)
            {
                Local0 = NBMR (0x67)
                Local0 &= 0x0F
                Return (Local0)
            }

            Method (GPPX, 0, NotSerialized)
            {
                Local0 = NBMR (0x2D)
                Local0 >>= 0x07
                Local0 &= 0x0F
                Return (Local0)
            }

            Method (XPTR, 2, NotSerialized)
            {
                If ((Arg0 < 0x02))
                {
                    Return (0x00)
                }

                If (((Arg0 > 0x0A) || (Arg0 == 0x08)))
                {
                    Return (0x00)
                }
                Else
                {
                    Local0 = GPPM ()
                    Local1 = GPPX ()
                    If ((Arg0 == 0x0A))
                    {
                        If (((Local0 == 0x03) && (Local1 == 0x03)))
                        {
                            Local0 = 0x20
                            Local2 = NBMR (0x2D)
                            If (Arg1)
                            {
                                Local2 &= ~Local0
                            }
                            Else
                            {
                                Local2 |= Local0
                            }

                            NBMW (0x2D, Local2)
                            Return (Ones)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    If ((Arg0 == 0x09))
                    {
                        If (((Local0 >= 0x02) && (Local1 >= 0x02)))
                        {
                            Local0 = 0x10
                            Local2 = NBMR (0x2D)
                            If (Arg1)
                            {
                                Local2 &= ~Local0
                            }
                            Else
                            {
                                Local2 |= Local0
                            }

                            NBMW (0x2D, Local2)
                            Return (Ones)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Local0 = 0x01
                    If ((Arg0 < 0x04))
                    {
                        Local1 = (Arg0 + 0x02)
                    }
                    Else
                    {
                        Local1 = (Arg0 + 0x11)
                    }

                    Local0 <<= Local1
                    Local2 = NBMR (0x08)
                    If (Arg1)
                    {
                        Local2 &= ~Local0
                    }
                    Else
                    {
                        Local2 |= Local0
                    }

                    NBMW (0x08, Local2)
                    Return (Ones)
                }
            }

            Name (PX3L, 0x80000000)
            Name (PX3H, 0x80000000)
            Name (PX3S, 0x10000000)
            Name (PX3K, 0xF0000000)
            Mutex (BR3X, 0x00)
            Method (BR3M, 0, NotSerialized)
            {
                Local0 = PARB /* \_SB_.PCI0.PARB */
                Local0 >>= 0x10
                Local0 &= 0x07
                If (Local0)
                {
                    Local1 = (0x01 << Local0)
                    Local1 = (0x1000 - Local1)
                    Local1 <<= 0x14
                    PX3K = Local1
                    Local0 = (0x00100000 >> Local0)
                    PX3S = Local0
                }

                Acquire (BR3X, 0xFFFF)
                Local0 = NBMR (0x00)
                Local0 &= 0xFFFFFFF7
                NBMW (0x00, Local0)
                Local0 = BR3L /* \_SB_.PCI0.BR3L */
                Local0 &= PX3K /* \_SB_.PCI0.PX3K */
                PX3L = Local0
                Local0 = BR3H /* \_SB_.PCI0.BR3H */
                Local0 &= 0xFF
                PX3H = Local0
                Local0 = NBMR (0x00)
                Local0 |= 0x08
                NBMW (0x00, Local0)
                Release (BR3X)
                Return (PX3L) /* \_SB_.PCI0.PX3L */
            }

            OperationRegion (K8ST, SystemMemory, 0x6FEAEF74, 0x00000048)
            Field (K8ST, AnyAcc, NoLock, Preserve)
            {
                C0_0,   16, 
                C2_0,   16, 
                C4_0,   16, 
                C6_0,   16, 
                C8_0,   16, 
                CA_0,   16, 
                CC_0,   16, 
                CE_0,   16, 
                D0_0,   16, 
                D2_0,   16, 
                D4_0,   16, 
                D6_0,   16, 
                D8_0,   16, 
                DA_0,   16, 
                DC_0,   16, 
                DE_0,   16, 
                E0_0,   16, 
                E2_0,   16, 
                E4_0,   16, 
                E6_0,   16, 
                E8_0,   16, 
                EA_0,   16, 
                EC_0,   16, 
                EE_0,   16, 
                F0_0,   16, 
                F2_0,   16, 
                F4_0,   16, 
                F6_0,   16, 
                F8_0,   16, 
                FA_0,   16, 
                FC_0,   16, 
                FE_0,   16, 
                TOML,   32, 
                TOMH,   32
            }

            Name (RSRC, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C2000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C6000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000C9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CA000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CE000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D2000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D6000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000D9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DA000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DE000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y10, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E2000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y11, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y12, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E6000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y13, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000E9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y14, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EA000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y15, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y16, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EE000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y17, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y18, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y19, AddressRangeMemory, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    0x00,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    0x00,, , TypeStatic, DenseTranslation)
            })
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                CreateBitField (RSRC, \_SB.PCI0._Y00._RW, C0RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y00._LEN, C0LN)  // _LEN: Length
                C0RW = One
                C0LN = 0x2000
                If ((C0_0 & 0x1818))
                {
                    C0LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y01._RW, C2RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y01._LEN, C2LN)  // _LEN: Length
                C2RW = One
                C2LN = 0x2000
                If ((C2_0 & 0x1818))
                {
                    C2LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y02._RW, C4RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y02._LEN, C4LN)  // _LEN: Length
                C4RW = One
                C4LN = 0x2000
                If ((C4_0 & 0x1818))
                {
                    C4LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y03._RW, C6RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y03._LEN, C6LN)  // _LEN: Length
                C6RW = One
                C6LN = 0x2000
                If ((C6_0 & 0x1818))
                {
                    C6LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y04._RW, C8RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y04._LEN, C8LN)  // _LEN: Length
                C8RW = One
                C8LN = 0x2000
                If ((C8_0 & 0x1818))
                {
                    C8LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y05._RW, CARW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y05._LEN, CALN)  // _LEN: Length
                CARW = One
                CALN = 0x2000
                If ((CA_0 & 0x1818))
                {
                    CALN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y06._RW, CCRW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y06._LEN, CCLN)  // _LEN: Length
                CCRW = One
                CCLN = 0x2000
                If ((CC_0 & 0x1818))
                {
                    CCLN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y07._RW, CERW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y07._LEN, CELN)  // _LEN: Length
                CERW = One
                CELN = 0x2000
                If ((CE_0 & 0x1818))
                {
                    CELN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y08._RW, D0RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y08._LEN, D0LN)  // _LEN: Length
                D0RW = One
                D0LN = 0x2000
                If ((D0_0 & 0x1818))
                {
                    D0LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y09._RW, D2RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y09._LEN, D2LN)  // _LEN: Length
                D2RW = One
                D2LN = 0x2000
                If ((D2_0 & 0x1818))
                {
                    D2LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0A._RW, D4RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0A._LEN, D4LN)  // _LEN: Length
                D4RW = One
                D4LN = 0x2000
                If ((D4_0 & 0x1818))
                {
                    D4LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0B._RW, D6RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0B._LEN, D6LN)  // _LEN: Length
                D6RW = One
                D6LN = 0x2000
                If ((D6_0 & 0x1818))
                {
                    D6LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0C._RW, D8RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0C._LEN, D8LN)  // _LEN: Length
                D8RW = One
                D8LN = 0x2000
                If ((D8_0 & 0x1818))
                {
                    D8LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0D._RW, DARW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0D._LEN, DALN)  // _LEN: Length
                DARW = One
                DALN = 0x2000
                If ((DA_0 & 0x1818))
                {
                    DALN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0E._RW, DCRW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0E._LEN, DCLN)  // _LEN: Length
                DCRW = One
                DCLN = 0x2000
                If ((DC_0 & 0x1818))
                {
                    DCLN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0F._RW, DERW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0F._LEN, DELN)  // _LEN: Length
                DERW = One
                DELN = 0x2000
                If ((DE_0 & 0x1818))
                {
                    DELN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y10._RW, E0RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y10._LEN, E0LN)  // _LEN: Length
                E0RW = One
                E0LN = 0x2000
                If ((E0_0 & 0x1818))
                {
                    E0LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y11._RW, E2RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y11._LEN, E2LN)  // _LEN: Length
                E2RW = One
                E2LN = 0x2000
                If ((E2_0 & 0x1818))
                {
                    E2LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y12._RW, E4RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y12._LEN, E4LN)  // _LEN: Length
                E4RW = One
                E4LN = 0x2000
                If ((E4_0 & 0x1818))
                {
                    E4LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y13._RW, E6RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y13._LEN, E6LN)  // _LEN: Length
                E6RW = One
                E6LN = 0x2000
                If ((E6_0 & 0x1818))
                {
                    E6LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y14._RW, E8RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y14._LEN, E8LN)  // _LEN: Length
                E8RW = One
                E8LN = 0x2000
                If ((E8_0 & 0x1818))
                {
                    E8LN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y15._RW, EARW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y15._LEN, EALN)  // _LEN: Length
                EARW = One
                EALN = 0x2000
                If ((EA_0 & 0x1818))
                {
                    EALN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y16._RW, ECRW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y16._LEN, ECLN)  // _LEN: Length
                ECRW = One
                ECLN = 0x2000
                If ((EC_0 & 0x1818))
                {
                    ECLN = 0x00
                }

                CreateBitField (RSRC, \_SB.PCI0._Y17._RW, EERW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y17._LEN, EELN)  // _LEN: Length
                EERW = One
                EELN = 0x2000
                If ((EE_0 & 0x1818))
                {
                    EELN = 0x00
                }

                CreateDWordField (RSRC, \_SB.PCI0._Y18._MIN, BT1S)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y18._MAX, BT1M)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y18._LEN, BT1L)  // _LEN: Length
                CreateDWordField (RSRC, \_SB.PCI0._Y19._MIN, BT2S)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y19._MAX, BT2M)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y19._LEN, BT2L)  // _LEN: Length
                Local0 = BR3M ()
                Local2 = PX3H /* \_SB_.PCI0.PX3H */
                Local1 = PX3S /* \_SB_.PCI0.PX3S */
                If (Local2)
                {
                    Local1 = 0x00
                    Local0 = TOML /* \_SB_.PCI0.TOML */
                }

                BT1S = TOML /* \_SB_.PCI0.TOML */
                BT1M = (Local0 - 0x01)
                BT1L = (Local0 - TOML) /* \_SB_.PCI0.TOML */
                BT2S = (Local0 + Local1)
                BT2L = ((BT2M - BT2S) + 0x01)
                Return (RSRC) /* \_SB_.PCI0.RSRC */
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (MEM1, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0F50,             // Range Minimum
                        0x0F50,             // Range Maximum
                        0x01,               // Alignment
                        0x02,               // Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y1A)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y1B)
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._BAS, MB01)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._LEN, ML01)  // _LEN: Length
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1B._BAS, MB02)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1B._LEN, ML02)  // _LEN: Length
                    If (GPIC)
                    {
                        MB01 = 0xFEC00000
                        MB02 = 0xFEE00000
                        ML01 = 0x1000
                        ML02 = 0x1000
                    }

                    Return (MEM1) /* \_SB_.PCI0.MEMR.MEM1 */
                }
            }

            Scope (\_SB.PCI0)
            {
                Method (AFN0, 0, Serialized)
                {
                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.AGP._ADR))
                    {
                        Return (\_SB.PCI0.AGP.VGA.AFN0 ())
                    }

                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB2._ADR))
                    {
                        Return (\_SB.PCI0.PB2.VGA.AFN0 ())
                    }

                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB3._ADR))
                    {
                        Return (\_SB.PCI0.PB3.VGA.AFN0 ())
                    }
                }

                Method (AFN1, 1, Serialized)
                {
                }

                Method (AFN2, 2, Serialized)
                {
                }

                Method (AFN3, 2, Serialized)
                {
                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.AGP._ADR))
                    {
                        Return (\_SB.PCI0.AGP.VGA.AFN3 (Arg0, Arg1))
                    }

                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB2._ADR))
                    {
                        Return (\_SB.PCI0.PB2.VGA.AFN3 (Arg0, Arg1))
                    }

                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB3._ADR))
                    {
                        Return (\_SB.PCI0.PB3.VGA.AFN3 (Arg0, Arg1))
                    }
                }

                Method (AFN4, 1, Serialized)
                {
                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.AGP._ADR))
                    {
                        Return (\_SB.PCI0.AGP.VGA.AFN4 (Arg0))
                    }

                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB2._ADR))
                    {
                        Return (\_SB.PCI0.PB2.VGA.AFN4 (Arg0))
                    }

                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB3._ADR))
                    {
                        Return (\_SB.PCI0.PB3.VGA.AFN4 (Arg0))
                    }
                }

                Method (AFN5, 0, Serialized)
                {
                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.AGP._ADR))
                    {
                        Return (\_SB.PCI0.AGP.VGA.AFN5 ())
                    }

                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB2._ADR))
                    {
                        Return (\_SB.PCI0.PB2.VGA.AFN5 ())
                    }

                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB3._ADR))
                    {
                        Return (\_SB.PCI0.PB3.VGA.AFN5 ())
                    }
                }

                Method (AFN6, 0, Serialized)
                {
                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.AGP._ADR))
                    {
                        Return (\_SB.PCI0.AGP.VGA.AFN6 ())
                    }

                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB2._ADR))
                    {
                        Return (\_SB.PCI0.PB2.VGA.AFN6 ())
                    }

                    If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB3._ADR))
                    {
                        Return (\_SB.PCI0.PB3.VGA.AFN6 ())
                    }
                }
            }

            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (GPIC)
                {
                    Return (Package (0x19)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }
                    })
                }
                Else
                {
                    Return (Package (0x19)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x02, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x03, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }
                    })
                }
            }

            OperationRegion (BAR1, PCI_Config, 0x14, 0x04)
            Field (BAR1, ByteAcc, NoLock, Preserve)
            {
                Z009,   32
            }

            Method (XCMP, 2, NotSerialized)
            {
                If ((0x10 != SizeOf (Arg0)))
                {
                    Return (0x00)
                }

                If ((0x10 != SizeOf (Arg1)))
                {
                    Return (0x00)
                }

                Local0 = 0x00
                While ((Local0 < 0x10))
                {
                    If ((DerefOf (Arg0 [Local0]) != DerefOf (Arg1 [Local0]
                        )))
                    {
                        Return (0x00)
                    }

                    Local0++
                }

                Return (0x01)
            }

            Device (PB2)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xE0010100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Local0 = Zero
                    If ((VC0S & 0x00020000))
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    XPIR = Arg0
                    Local0 = XPID /* \_SB_.PCI0.PB2_.XPID */
                    XPIR = 0x00
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    XPIR = Arg0
                    XPID = Arg1
                    XPIR = 0x00
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Local0 = XPRD (0xA2)
                    Local0 &= ~0x07
                    Local1 = (Local0 >> 0x04)
                    Local1 &= 0x07
                    Local0 |= Local1
                    Local0 |= 0x0100
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Local0 = _ADR /* \_SB_.PCI0.PB2_._ADR */
                    Local1 = (Local0 >> 0x10)
                    Local1 = (Local1 << 0x03)
                    Local2 = (Local0 & 0x0F)
                    Local3 = (Local1 | Local2)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Local1 = 0x00
                    Local0 = XPPB ()
                    If ((0x04 > Local0))
                    {
                        Local1 = 0x00
                    }

                    If ((0x08 > Local0))
                    {
                        Local1 = 0x00010000
                    }

                    If ((0x0B > Local0))
                    {
                        Local1 = 0x00020000
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Local0 = XPPB ()
                    Local2 = GPPX ()
                    Local3 = GFXM ()
                    Local1 = 0x00
                    If ((0x10 == Local0))
                    {
                        Local1 = 0xFFFF
                        If (Local3)
                        {
                            Local1 = 0x0F0F
                        }
                    }

                    If ((0x18 == Local0))
                    {
                        Local1 = 0xF0F0
                    }

                    If ((0x20 == Local0))
                    {
                        Local1 = 0x1010
                    }

                    If ((0x28 == Local0))
                    {
                        Local1 = 0x2020
                    }

                    If ((0x30 == Local0))
                    {
                        Local1 = 0x4040
                    }

                    If ((0x38 == Local0))
                    {
                        Local1 = 0x8080
                    }

                    If ((0x48 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x02 == Local2))
                        {
                            Local1 = 0x0303
                        }

                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0101
                        }
                    }

                    If ((0x50 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0202
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Local1 = XPPD ()
                    If ((0x00 != Local1))
                    {
                        Local2 = \_SB.PCI0.NBXR ((0x65 + XPCN ()))
                        If (Arg0)
                        {
                            Local2 &= ~Local1
                        }
                        Else
                        {
                            Local2 |= Local1
                        }

                        \_SB.PCI0.NBXW ((0x65 + XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Local0 = LKCN /* \_SB_.PCI0.PB2_.LKCN */
                    Local0 &= ~0x20
                    LKCN = Local0
                    Local0 |= 0x20
                    LKCN = Local0
                    Local1 = 0x64
                    Local2 = 0x01
                    While ((Local1 && Local2))
                    {
                        Sleep (0x01)
                        Local3 = LKST /* \_SB_.PCI0.PB2_.LKST */
                        If ((Local3 & 0x0800))
                        {
                            Local1--
                        }
                        Else
                        {
                            Local2 = 0x00
                        }
                    }

                    Local0 &= ~0x20
                    LKCN = Local0
                    If (!Local2)
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Local0 = GFXM ()
                    Local1 = XPPB ()
                    Local2 = 0x00
                    If ((0x10 == Local1))
                    {
                        Local2 = 0x01
                        Local3 = 0x00770070
                        If (Local0)
                        {
                            Local3 = 0x00330030
                        }
                    }

                    If (((0x18 == Local1) && Local0))
                    {
                        Local2 = 0x01
                        Local3 = 0x00440040
                    }

                    Local0 = \_SB.PCI0.NBMR (0x07)
                    Local1 = \_SB.PCI0.NBXR (0x65)
                    If ((Local0 && 0x0201F000))
                    {
                        Local4 = 0x00440040
                        Local5 = Local4
                        If ((~Local1 && 0xF0F0))
                        {
                            Local5 = 0x00
                        }
                    }
                    Else
                    {
                        Local4 = 0x00110010
                        Local5 = Local4
                        If ((~Local1 && 0x0F0F))
                        {
                            Local5 = 0x00
                        }
                    }

                    If (Local2)
                    {
                        Local6 = (Local3 | Local4)
                        Local0 = (Local5 & Local4)
                        Local7 = (Local3 | Local0)
                        Local0 = \_SB.PCI0.NBMR (0x2E)
                        If (Arg0)
                        {
                            Local0 &= ~Local6
                        }
                        Else
                        {
                            Local0 |= Local7
                        }

                        \_SB.PCI0.NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Name (SWIT, 0x01)
                    Name (CRTC, 0x01)
                    Name (LCDC, 0x01)
                    Name (TV0C, 0x00)
                    Name (HDMC, 0x01)
                    Name (CRTN, 0x01)
                    Name (LCDN, 0x01)
                    Name (TV0N, 0x00)
                    Name (HDMN, 0x01)
                    Method (VDEV, 0, NotSerialized)
                    {
                        GDST ()
                        If ((\VDSS == 0x00))
                        {
                            Local0 = 0x00
                            If ((CRTC == 0x01))
                            {
                                Local0 = 0x02
                            }

                            Local0++
                            If ((Local0 > 0x04))
                            {
                                Local0 = 0x01
                            }

                            If ((Local0 && 0x01))
                            {
                                LCDN = 0x01
                            }

                            If ((Local0 && 0x02))
                            {
                                CRTN = 0x01
                            }

                            If ((Local0 && 0x04))
                            {
                                TV0N = 0x01
                            }
                        }

                        If ((\VDSS == 0x01))
                        {
                            LCDN = 0x01
                            CRTN = 0x00
                            TV0N = 0x00
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x02))
                        {
                            LCDN = 0x00
                            CRTN = 0x01
                            TV0N = 0x00
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x03))
                        {
                            LCDN = 0x01
                            CRTN = 0x01
                            TV0N = 0x00
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x04))
                        {
                            LCDN = 0x00
                            CRTN = 0x00
                            TV0N = 0x01
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x05))
                        {
                            LCDN = 0x01
                            CRTN = 0x00
                            TV0N = 0x01
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x06))
                        {
                            LCDN = 0x00
                            CRTN = 0x00
                            TV0N = 0x00
                            HDMN = 0x01
                        }

                        If ((\VDSS == 0x07))
                        {
                            LCDN = 0x01
                            CRTN = 0x00
                            TV0N = 0x00
                            HDMN = 0x01
                        }

                        If ((\VDSS == 0x08))
                        {
                            LCDN = 0x00
                            CRTN = 0x01
                            TV0N = 0x00
                            HDMN = 0x01
                        }
                    }

                    Method (GDST, 0, NotSerialized)
                    {
                        CRTC = 0x00
                        LCDC = 0x00
                        TV0C = 0x00
                        HDMC = 0x00
                    }

                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        VDEV ()
                        Local0 = Arg0
                        SWIT = (Local0 & 0x01)
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Name (VGAT, Package (0x04)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        VGAT [0x00] = (0x00010000 | 0x0100)
                        VGAT [0x01] = (0x00010000 | 0x0200)
                        VGAT [0x02] = (0x00010000 | 0x0110)
                        VGAT [0x03] = (0x00010000 | 0x0210)
                        Return (VGAT) /* \_SB_.PCI0.PB2_.VGA_._DOD.VGAT */
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (CRTC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (CRTN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (LCDC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (LCDN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }

                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (\BCLP)
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            Local0 = 0x01
                            Local1 = 0x02
                            While (Local0)
                            {
                                If ((Arg0 == DerefOf (\BCLP [Local1])))
                                {
                                    Local0 = 0x00
                                }
                                Else
                                {
                                    Local1++
                                    If ((0x0B == Local1))
                                    {
                                        Local0 = 0x00
                                    }
                                }
                            }

                            Local1--
                            Local1--
                            If (\_SB.PCI0.LPC0.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPC0.EC0.ACST)
                                {
                                    \_SB.PCI0.LPC0.EC0.BNAC = Local1
                                }
                                Else
                                {
                                    \_SB.PCI0.LPC0.EC0.BNDC = Local1
                                }
                            }
                            Else
                            {
                                \_SB.PCI0.LPC0.EC0.BNAC = Local1
                            }

                            If (\BCVE)
                            {
                                HKEY (0x1C)
                            }
                        }

                        Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
                        {
                            If (\_SB.PCI0.LPC0.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPC0.EC0.ACST)
                                {
                                    Local1 = \_SB.PCI0.LPC0.EC0.BNAC
                                }
                                Else
                                {
                                    Local1 = \_SB.PCI0.LPC0.EC0.BNDC
                                }
                            }
                            Else
                            {
                                Local1 = \_SB.PCI0.LPC0.EC0.BNAC
                            }

                            Local1++
                            Local1++
                            Local0 = DerefOf (\BCLP [Local1])
                            Return (Local0)
                        }
                    }

                    Device (TV0)
                    {
                        Name (_ADR, 0x0200)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (TV0C)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (TV0N)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }
                    }

                    Device (HDMI)
                    {
                        Name (_ADR, 0x0210)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (HDMC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (HDMN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }
                    }

                    OperationRegion (PCFG, PCI_Config, 0x00, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }

                    Name (ATIB, Buffer (0x0100){})
                    Method (ATIF, 2, Serialized)
                    {
                        If ((Arg0 == 0x00))
                        {
                            Return (AF00 ())
                        }

                        If ((Arg0 == 0x01))
                        {
                            Return (AF01 ())
                        }

                        If ((Arg0 == 0x02))
                        {
                            Return (AF02 ())
                        }

                        If ((Arg0 == 0x03))
                        {
                            Return (AF03 (DerefOf (Arg1 [0x02]), DerefOf (Arg1 [0x04])))
                        }

                        If ((Arg0 == 0x0F))
                        {
                            Return (AF15 ())
                        }
                        Else
                        {
                            CreateWordField (ATIB, 0x00, SSZE)
                            CreateWordField (ATIB, 0x02, VERN)
                            CreateDWordField (ATIB, 0x04, NMSK)
                            CreateDWordField (ATIB, 0x08, SFUN)
                            SSZE = 0x00
                            VERN = 0x00
                            NMSK = 0x00
                            SFUN = 0x00
                            Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                        }
                    }

                    Method (AF00, 0, NotSerialized)
                    {
                        P80H = 0xF0
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        SSZE = 0x0C
                        VERN = 0x01
                        If ((\_SB.PCI0.AGP.PXEN == 0x80000000))
                        {
                            NMSK = 0x11
                        }
                        Else
                        {
                            NMSK = 0x51
                        }

                        MSKN = NMSK /* \_SB_.PCI0.PB2_.VGA_.AF00.NMSK */
                        SFUN = 0x4007
                        Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                    }

                    Name (NCOD, 0x81)
                    Method (AF01, 0, NotSerialized)
                    {
                        P80H = 0xF1
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, VMSK)
                        CreateDWordField (ATIB, 0x06, FLGS)
                        VMSK = 0x03
                        SSZE = 0x0A
                        FLGS = 0x01
                        NCOD = 0x81
                        Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                    }

                    Name (PSBR, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                           // ....
                    })
                    Name (MSKN, 0x00)
                    Name (SEXM, 0x00)
                    Name (STHG, 0x00)
                    Name (STHI, 0x00)
                    Name (SFPG, 0x00)
                    Name (SFPI, 0x00)
                    Name (SSPS, 0x00)
                    Name (SSDM, 0x0A)
                    Name (SCDY, 0x00)
                    Name (SACT, Buffer (0x05)
                    {
                         0x01, 0x03, 0x09, 0x02, 0x08                     // .....
                    })
                    Method (AF02, 0, NotSerialized)
                    {
                        P80H = 0xF2
                        CreateBitField (PSBR, 0x00, PDSW)
                        CreateBitField (PSBR, 0x01, PEXM)
                        CreateBitField (PSBR, 0x02, PTHR)
                        CreateBitField (PSBR, 0x03, PFPS)
                        CreateBitField (PSBR, 0x04, PSPS)
                        CreateBitField (PSBR, 0x05, PDCC)
                        CreateBitField (PSBR, 0x06, PXPS)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, PSBI)
                        CreateByteField (ATIB, 0x06, EXPM)
                        CreateByteField (ATIB, 0x07, THRM)
                        CreateByteField (ATIB, 0x08, THID)
                        CreateByteField (ATIB, 0x09, FPWR)
                        CreateByteField (ATIB, 0x0A, FPID)
                        CreateByteField (ATIB, 0x0B, SPWR)
                        SSZE = 0x0C
                        PSBI = PSBR /* \_SB_.PCI0.PB2_.VGA_.PSBR */
                        If (PDSW)
                        {
                            P80H = 0x82
                            PDSW = Zero
                        }

                        If (PEXM)
                        {
                            EXPM = SEXM /* \_SB_.PCI0.PB2_.VGA_.SEXM */
                            SEXM = Zero
                            PEXM = Zero
                        }

                        If (PTHR)
                        {
                            THRM = STHG /* \_SB_.PCI0.PB2_.VGA_.STHG */
                            THID = STHI /* \_SB_.PCI0.PB2_.VGA_.STHI */
                            STHG = Zero
                            STHI = Zero
                            PTHR = Zero
                        }

                        If (PFPS)
                        {
                            FPWR = SFPG /* \_SB_.PCI0.PB2_.VGA_.SFPG */
                            FPWR = SFPI /* \_SB_.PCI0.PB2_.VGA_.SFPI */
                            SFPG = Zero
                            SFPI = Zero
                            PFPS = Zero
                        }

                        If (PSPS)
                        {
                            SPWR = SSPS /* \_SB_.PCI0.PB2_.VGA_.SSPS */
                            PSPS = Zero
                        }

                        If (PXPS)
                        {
                            P80H = 0xA2
                            PXPS = Zero
                        }

                        Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                    }

                    Method (AF03, 2, NotSerialized)
                    {
                        P80H = 0xF3
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, SSDP)
                        CreateWordField (ATIB, 0x04, SCDP)
                        SSDP = Arg0
                        SCDP = Arg1
                        Name (NXTD, 0x06)
                        Name (CIDX, 0x06)
                        Local1 = SSDP /* \_SB_.PCI0.PB2_.VGA_.AF03.SSDP */
                        Local1 &= 0x0B
                        Local2 = SCDP /* \_SB_.PCI0.PB2_.VGA_.AF03.SCDP */
                        If (CondRefOf (\_SB.LID0._LID, Local4))
                        {
                            Local2 &= ~0x01
                            Local2 |= \_SB.LID0._LID ()
                        }
                        Else
                        {
                            Local2 |= 0x01
                        }

                        P80H = Local2
                        Local0 = Zero
                        While ((Local0 < SizeOf (SACT)))
                        {
                            Local3 = DerefOf (SACT [Local0])
                            If ((Local3 == Local1))
                            {
                                CIDX = Local0
                                Local0 = SizeOf (SACT)
                            }
                            Else
                            {
                                Local0++
                            }
                        }

                        Local0 = CIDX /* \_SB_.PCI0.PB2_.VGA_.AF03.CIDX */
                        While ((Local0 < SizeOf (SACT)))
                        {
                            Local0++
                            If ((Local0 == SizeOf (SACT)))
                            {
                                Local0 = 0x00
                            }

                            Local3 = DerefOf (SACT [Local0])
                            If (((Local3 & Local2) == Local3))
                            {
                                NXTD = Local0
                                Local0 = SizeOf (SACT)
                            }
                        }

                        If ((NXTD == SizeOf (SACT)))
                        {
                            SSDP = Zero
                        }
                        Else
                        {
                            Local0 = NXTD /* \_SB_.PCI0.PB2_.VGA_.AF03.NXTD */
                            Local3 = DerefOf (SACT [Local0])
                            SSDP &= ~0x0B
                            SSDP |= Local3
                        }

                        SSZE = 0x04
                        P80H = SSDP /* \_SB_.PCI0.PB2_.VGA_.AF03.SSDP */
                        Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                    }

                    Method (AFN0, 0, Serialized)
                    {
                        If ((MSKN & 0x01))
                        {
                            CreateBitField (PSBR, 0x00, PDSW)
                            PDSW = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN3, 2, Serialized)
                    {
                        If ((MSKN & 0x08))
                        {
                            Local0 = Arg0
                            SFPI = Local0
                            Local0 = Arg1
                            SFPG = Local0 &= 0x03
                            CreateBitField (PSBR, 0x03, PFPS)
                            PFPS = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN4, 1, Serialized)
                    {
                        If ((MSKN & 0x10))
                        {
                            Local0 = Arg0
                            Local1 = SSPS /* \_SB_.PCI0.PB2_.VGA_.SSPS */
                            SSPS = Local0
                            If ((Local0 == Local1)){}
                            Else
                            {
                                CreateBitField (PSBR, 0x04, PSPS)
                                PSPS = One
                                Notify (VGA, NCOD)
                            }
                        }
                    }

                    Method (AFN5, 0, Serialized)
                    {
                        If ((MSKN & 0x20))
                        {
                            CreateBitField (PSBR, 0x05, PDCC)
                            PDCC = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN6, 0, Serialized)
                    {
                        If ((MSKN & 0x40))
                        {
                            CreateBitField (PSBR, 0x06, PXPS)
                            PXPS = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AF15, 0, NotSerialized)
                    {
                        P80H = 0xFF
                        CreateWordField (ATIB, 0x00, DNUM)
                        CreateWordField (ATIB, 0x02, DSZE)
                        DSZE = 0x08
                        Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                        \_SB.PCI0.LPC0.BCMD = 0x8D
                        \_SB.PCI0.LPC0.DID = 0x0F
                        \_SB.PCI0.LPC0.INFO = ATIB /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                        \_SB.PCI0.LPC0.SMIC = Zero
                        ATIB = \_SB.PCI0.LPC0.INFO
                        Release (\_SB.PCI0.LPC0.PSMX)
                        Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                    }
                }

                Device (HDAU)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Local0 = 0x00
                        Local2 = 0x00
                        While ((Local2 < 0x0F))
                        {
                            PSDC = One
                            Local4 = 0x01
                            Local5 = 0xC8
                            While ((Local4 && Local5))
                            {
                                Local6 = XPRD (0xA5)
                                Local6 &= 0x7F
                                If (((Local6 >= 0x10) && (Local6 != 0x7F)))
                                {
                                    Local4 = 0x00
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Local5--
                                }
                            }

                            If (!Local4)
                            {
                                Local5 = XPDL ()
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Local2++
                                }
                                Else
                                {
                                    \_SB.PCI0.LPC0.INFO = (XPPB () << 0x03)
                                    \_SB.PCI0.LPC0.BCMD = 0x87
                                    \_SB.PCI0.LPC0.SMIC = Zero
                                    If ((XPR2 () == Ones))
                                    {
                                        Local0 = 0x01
                                        Local2 = 0x10
                                    }
                                    Else
                                    {
                                        Local0 = 0x00
                                        Local2 = 0x10
                                    }
                                }
                            }
                            Else
                            {
                                Local2 = 0x10
                            }
                        }

                        If (!Local0)
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        PSDC = One
                        Local7 = ^VGA.DVID /* \_SB_.PCI0.PB2_.VGA_.DVID */
                        Sleep (0x0A)
                        Local4 = 0x01
                        Local5 = 0x05
                        While ((Local4 && Local5))
                        {
                            Local6 = XPRD (0xA5)
                            Local6 &= 0x7F
                            If ((Local6 <= 0x04))
                            {
                                Local4 = 0x00
                            }
                            Else
                            {
                                Local7 = ^VGA.DVID /* \_SB_.PCI0.PB2_.VGA_.DVID */
                                Sleep (0x05)
                                Local5--
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB3)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x10, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xE0018100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Local0 = Zero
                    If ((VC0S & 0x00020000))
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    XPIR = Arg0
                    Local0 = XPID /* \_SB_.PCI0.PB3_.XPID */
                    XPIR = 0x00
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    XPIR = Arg0
                    XPID = Arg1
                    XPIR = 0x00
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Local0 = XPRD (0xA2)
                    Local0 &= ~0x07
                    Local1 = (Local0 >> 0x04)
                    Local1 &= 0x07
                    Local0 |= Local1
                    Local0 |= 0x0100
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Local0 = _ADR /* \_SB_.PCI0.PB3_._ADR */
                    Local1 = (Local0 >> 0x10)
                    Local1 = (Local1 << 0x03)
                    Local2 = (Local0 & 0x0F)
                    Local3 = (Local1 | Local2)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Local1 = 0x00
                    Local0 = XPPB ()
                    If ((0x04 > Local0))
                    {
                        Local1 = 0x00
                    }

                    If ((0x08 > Local0))
                    {
                        Local1 = 0x00010000
                    }

                    If ((0x0B > Local0))
                    {
                        Local1 = 0x00020000
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Local0 = XPPB ()
                    Local2 = GPPX ()
                    Local3 = GFXM ()
                    Local1 = 0x00
                    If ((0x10 == Local0))
                    {
                        Local1 = 0xFFFF
                        If (Local3)
                        {
                            Local1 = 0x0F0F
                        }
                    }

                    If ((0x18 == Local0))
                    {
                        Local1 = 0xF0F0
                    }

                    If ((0x20 == Local0))
                    {
                        Local1 = 0x1010
                    }

                    If ((0x28 == Local0))
                    {
                        Local1 = 0x2020
                    }

                    If ((0x30 == Local0))
                    {
                        Local1 = 0x4040
                    }

                    If ((0x38 == Local0))
                    {
                        Local1 = 0x8080
                    }

                    If ((0x48 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x02 == Local2))
                        {
                            Local1 = 0x0303
                        }

                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0101
                        }
                    }

                    If ((0x50 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0202
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Local1 = XPPD ()
                    If ((0x00 != Local1))
                    {
                        Local2 = \_SB.PCI0.NBXR ((0x65 + XPCN ()))
                        If (Arg0)
                        {
                            Local2 &= ~Local1
                        }
                        Else
                        {
                            Local2 |= Local1
                        }

                        \_SB.PCI0.NBXW ((0x65 + XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Local0 = LKCN /* \_SB_.PCI0.PB3_.LKCN */
                    Local0 &= ~0x20
                    LKCN = Local0
                    Local0 |= 0x20
                    LKCN = Local0
                    Local1 = 0x64
                    Local2 = 0x01
                    While ((Local1 && Local2))
                    {
                        Sleep (0x01)
                        Local3 = LKST /* \_SB_.PCI0.PB3_.LKST */
                        If ((Local3 & 0x0800))
                        {
                            Local1--
                        }
                        Else
                        {
                            Local2 = 0x00
                        }
                    }

                    Local0 &= ~0x20
                    LKCN = Local0
                    If (!Local2)
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Local0 = GFXM ()
                    Local1 = XPPB ()
                    Local2 = 0x00
                    If ((0x10 == Local1))
                    {
                        Local2 = 0x01
                        Local3 = 0x00770070
                        If (Local0)
                        {
                            Local3 = 0x00330030
                        }
                    }

                    If (((0x18 == Local1) && Local0))
                    {
                        Local2 = 0x01
                        Local3 = 0x00440040
                    }

                    Local0 = \_SB.PCI0.NBMR (0x07)
                    Local1 = \_SB.PCI0.NBXR (0x65)
                    If ((Local0 && 0x0201F000))
                    {
                        Local4 = 0x00440040
                        Local5 = Local4
                        If ((~Local1 && 0xF0F0))
                        {
                            Local5 = 0x00
                        }
                    }
                    Else
                    {
                        Local4 = 0x00110010
                        Local5 = Local4
                        If ((~Local1 && 0x0F0F))
                        {
                            Local5 = 0x00
                        }
                    }

                    If (Local2)
                    {
                        Local6 = (Local3 | Local4)
                        Local0 = (Local5 & Local4)
                        Local7 = (Local3 | Local0)
                        Local0 = \_SB.PCI0.NBMR (0x2E)
                        If (Arg0)
                        {
                            Local0 &= ~Local6
                        }
                        Else
                        {
                            Local0 |= Local7
                        }

                        \_SB.PCI0.NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Name (SWIT, 0x01)
                    Name (CRTC, 0x01)
                    Name (LCDC, 0x01)
                    Name (TV0C, 0x00)
                    Name (HDMC, 0x01)
                    Name (CRTN, 0x01)
                    Name (LCDN, 0x01)
                    Name (TV0N, 0x00)
                    Name (HDMN, 0x01)
                    Method (VDEV, 0, NotSerialized)
                    {
                        GDST ()
                        If ((\VDSS == 0x00))
                        {
                            Local0 = 0x00
                            If ((CRTC == 0x01))
                            {
                                Local0 = 0x02
                            }

                            Local0++
                            If ((Local0 > 0x04))
                            {
                                Local0 = 0x01
                            }

                            If ((Local0 && 0x01))
                            {
                                LCDN = 0x01
                            }

                            If ((Local0 && 0x02))
                            {
                                CRTN = 0x01
                            }

                            If ((Local0 && 0x04))
                            {
                                TV0N = 0x01
                            }
                        }

                        If ((\VDSS == 0x01))
                        {
                            LCDN = 0x01
                            CRTN = 0x00
                            TV0N = 0x00
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x02))
                        {
                            LCDN = 0x00
                            CRTN = 0x01
                            TV0N = 0x00
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x03))
                        {
                            LCDN = 0x01
                            CRTN = 0x01
                            TV0N = 0x00
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x04))
                        {
                            LCDN = 0x00
                            CRTN = 0x00
                            TV0N = 0x01
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x05))
                        {
                            LCDN = 0x01
                            CRTN = 0x00
                            TV0N = 0x01
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x06))
                        {
                            LCDN = 0x00
                            CRTN = 0x00
                            TV0N = 0x00
                            HDMN = 0x01
                        }

                        If ((\VDSS == 0x07))
                        {
                            LCDN = 0x01
                            CRTN = 0x00
                            TV0N = 0x00
                            HDMN = 0x01
                        }

                        If ((\VDSS == 0x08))
                        {
                            LCDN = 0x00
                            CRTN = 0x01
                            TV0N = 0x00
                            HDMN = 0x01
                        }
                    }

                    Method (GDST, 0, NotSerialized)
                    {
                        CRTC = 0x00
                        LCDC = 0x00
                        TV0C = 0x00
                        HDMC = 0x00
                    }

                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        VDEV ()
                        Local0 = Arg0
                        SWIT = (Local0 & 0x01)
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Name (VGAT, Package (0x04)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        VGAT [0x00] = (0x00010000 | 0x0100)
                        VGAT [0x01] = (0x00010000 | 0x0200)
                        VGAT [0x02] = (0x00010000 | 0x0110)
                        VGAT [0x03] = (0x00010000 | 0x0210)
                        Return (VGAT) /* \_SB_.PCI0.PB3_.VGA_._DOD.VGAT */
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (CRTC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (CRTN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (LCDC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (LCDN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }

                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (\BCLP)
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            Local0 = 0x01
                            Local1 = 0x02
                            While (Local0)
                            {
                                If ((Arg0 == DerefOf (\BCLP [Local1])))
                                {
                                    Local0 = 0x00
                                }
                                Else
                                {
                                    Local1++
                                    If ((0x0B == Local1))
                                    {
                                        Local0 = 0x00
                                    }
                                }
                            }

                            Local1--
                            Local1--
                            If (\_SB.PCI0.LPC0.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPC0.EC0.ACST)
                                {
                                    \_SB.PCI0.LPC0.EC0.BNAC = Local1
                                }
                                Else
                                {
                                    \_SB.PCI0.LPC0.EC0.BNDC = Local1
                                }
                            }
                            Else
                            {
                                \_SB.PCI0.LPC0.EC0.BNAC = Local1
                            }

                            If (\BCVE)
                            {
                                HKEY (0x1C)
                            }
                        }

                        Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
                        {
                            If (\_SB.PCI0.LPC0.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPC0.EC0.ACST)
                                {
                                    Local1 = \_SB.PCI0.LPC0.EC0.BNAC
                                }
                                Else
                                {
                                    Local1 = \_SB.PCI0.LPC0.EC0.BNDC
                                }
                            }
                            Else
                            {
                                Local1 = \_SB.PCI0.LPC0.EC0.BNAC
                            }

                            Local1++
                            Local1++
                            Local0 = DerefOf (\BCLP [Local1])
                            Return (Local0)
                        }
                    }

                    Device (TV0)
                    {
                        Name (_ADR, 0x0200)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (TV0C)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (TV0N)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }
                    }

                    Device (HDMI)
                    {
                        Name (_ADR, 0x0210)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (HDMC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (HDMN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }
                    }

                    OperationRegion (PCFG, PCI_Config, 0x00, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }

                    Name (ATIB, Buffer (0x0100){})
                    Method (ATIF, 2, Serialized)
                    {
                        If ((Arg0 == 0x00))
                        {
                            Return (AF00 ())
                        }

                        If ((Arg0 == 0x01))
                        {
                            Return (AF01 ())
                        }

                        If ((Arg0 == 0x02))
                        {
                            Return (AF02 ())
                        }

                        If ((Arg0 == 0x03))
                        {
                            Return (AF03 (DerefOf (Arg1 [0x02]), DerefOf (Arg1 [0x04])))
                        }

                        If ((Arg0 == 0x0F))
                        {
                            Return (AF15 ())
                        }
                        Else
                        {
                            CreateWordField (ATIB, 0x00, SSZE)
                            CreateWordField (ATIB, 0x02, VERN)
                            CreateDWordField (ATIB, 0x04, NMSK)
                            CreateDWordField (ATIB, 0x08, SFUN)
                            SSZE = 0x00
                            VERN = 0x00
                            NMSK = 0x00
                            SFUN = 0x00
                            Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                        }
                    }

                    Method (AF00, 0, NotSerialized)
                    {
                        P80H = 0xF0
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        SSZE = 0x0C
                        VERN = 0x01
                        If ((\_SB.PCI0.AGP.PXEN == 0x80000000))
                        {
                            NMSK = 0x11
                        }
                        Else
                        {
                            NMSK = 0x51
                        }

                        MSKN = NMSK /* \_SB_.PCI0.PB3_.VGA_.AF00.NMSK */
                        SFUN = 0x4007
                        Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                    }

                    Name (NCOD, 0x81)
                    Method (AF01, 0, NotSerialized)
                    {
                        P80H = 0xF1
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, VMSK)
                        CreateDWordField (ATIB, 0x06, FLGS)
                        VMSK = 0x03
                        SSZE = 0x0A
                        FLGS = 0x01
                        NCOD = 0x81
                        Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                    }

                    Name (PSBR, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                           // ....
                    })
                    Name (MSKN, 0x00)
                    Name (SEXM, 0x00)
                    Name (STHG, 0x00)
                    Name (STHI, 0x00)
                    Name (SFPG, 0x00)
                    Name (SFPI, 0x00)
                    Name (SSPS, 0x00)
                    Name (SSDM, 0x0A)
                    Name (SCDY, 0x00)
                    Name (SACT, Buffer (0x05)
                    {
                         0x01, 0x03, 0x09, 0x02, 0x08                     // .....
                    })
                    Method (AF02, 0, NotSerialized)
                    {
                        P80H = 0xF2
                        CreateBitField (PSBR, 0x00, PDSW)
                        CreateBitField (PSBR, 0x01, PEXM)
                        CreateBitField (PSBR, 0x02, PTHR)
                        CreateBitField (PSBR, 0x03, PFPS)
                        CreateBitField (PSBR, 0x04, PSPS)
                        CreateBitField (PSBR, 0x05, PDCC)
                        CreateBitField (PSBR, 0x06, PXPS)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, PSBI)
                        CreateByteField (ATIB, 0x06, EXPM)
                        CreateByteField (ATIB, 0x07, THRM)
                        CreateByteField (ATIB, 0x08, THID)
                        CreateByteField (ATIB, 0x09, FPWR)
                        CreateByteField (ATIB, 0x0A, FPID)
                        CreateByteField (ATIB, 0x0B, SPWR)
                        SSZE = 0x0C
                        PSBI = PSBR /* \_SB_.PCI0.PB3_.VGA_.PSBR */
                        If (PDSW)
                        {
                            P80H = 0x82
                            PDSW = Zero
                        }

                        If (PEXM)
                        {
                            EXPM = SEXM /* \_SB_.PCI0.PB3_.VGA_.SEXM */
                            SEXM = Zero
                            PEXM = Zero
                        }

                        If (PTHR)
                        {
                            THRM = STHG /* \_SB_.PCI0.PB3_.VGA_.STHG */
                            THID = STHI /* \_SB_.PCI0.PB3_.VGA_.STHI */
                            STHG = Zero
                            STHI = Zero
                            PTHR = Zero
                        }

                        If (PFPS)
                        {
                            FPWR = SFPG /* \_SB_.PCI0.PB3_.VGA_.SFPG */
                            FPWR = SFPI /* \_SB_.PCI0.PB3_.VGA_.SFPI */
                            SFPG = Zero
                            SFPI = Zero
                            PFPS = Zero
                        }

                        If (PSPS)
                        {
                            SPWR = SSPS /* \_SB_.PCI0.PB3_.VGA_.SSPS */
                            PSPS = Zero
                        }

                        If (PXPS)
                        {
                            P80H = 0xA2
                            PXPS = Zero
                        }

                        Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                    }

                    Method (AF03, 2, NotSerialized)
                    {
                        P80H = 0xF3
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, SSDP)
                        CreateWordField (ATIB, 0x04, SCDP)
                        SSDP = Arg0
                        SCDP = Arg1
                        Name (NXTD, 0x06)
                        Name (CIDX, 0x06)
                        Local1 = SSDP /* \_SB_.PCI0.PB3_.VGA_.AF03.SSDP */
                        Local1 &= 0x0B
                        Local2 = SCDP /* \_SB_.PCI0.PB3_.VGA_.AF03.SCDP */
                        If (CondRefOf (\_SB.LID0._LID, Local4))
                        {
                            Local2 &= ~0x01
                            Local2 |= \_SB.LID0._LID ()
                        }
                        Else
                        {
                            Local2 |= 0x01
                        }

                        P80H = Local2
                        Local0 = Zero
                        While ((Local0 < SizeOf (SACT)))
                        {
                            Local3 = DerefOf (SACT [Local0])
                            If ((Local3 == Local1))
                            {
                                CIDX = Local0
                                Local0 = SizeOf (SACT)
                            }
                            Else
                            {
                                Local0++
                            }
                        }

                        Local0 = CIDX /* \_SB_.PCI0.PB3_.VGA_.AF03.CIDX */
                        While ((Local0 < SizeOf (SACT)))
                        {
                            Local0++
                            If ((Local0 == SizeOf (SACT)))
                            {
                                Local0 = 0x00
                            }

                            Local3 = DerefOf (SACT [Local0])
                            If (((Local3 & Local2) == Local3))
                            {
                                NXTD = Local0
                                Local0 = SizeOf (SACT)
                            }
                        }

                        If ((NXTD == SizeOf (SACT)))
                        {
                            SSDP = Zero
                        }
                        Else
                        {
                            Local0 = NXTD /* \_SB_.PCI0.PB3_.VGA_.AF03.NXTD */
                            Local3 = DerefOf (SACT [Local0])
                            SSDP &= ~0x0B
                            SSDP |= Local3
                        }

                        SSZE = 0x04
                        P80H = SSDP /* \_SB_.PCI0.PB3_.VGA_.AF03.SSDP */
                        Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                    }

                    Method (AFN0, 0, Serialized)
                    {
                        If ((MSKN & 0x01))
                        {
                            CreateBitField (PSBR, 0x00, PDSW)
                            PDSW = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN3, 2, Serialized)
                    {
                        If ((MSKN & 0x08))
                        {
                            Local0 = Arg0
                            SFPI = Local0
                            Local0 = Arg1
                            SFPG = Local0 &= 0x03
                            CreateBitField (PSBR, 0x03, PFPS)
                            PFPS = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN4, 1, Serialized)
                    {
                        If ((MSKN & 0x10))
                        {
                            Local0 = Arg0
                            Local1 = SSPS /* \_SB_.PCI0.PB3_.VGA_.SSPS */
                            SSPS = Local0
                            If ((Local0 == Local1)){}
                            Else
                            {
                                CreateBitField (PSBR, 0x04, PSPS)
                                PSPS = One
                                Notify (VGA, NCOD)
                            }
                        }
                    }

                    Method (AFN5, 0, Serialized)
                    {
                        If ((MSKN & 0x20))
                        {
                            CreateBitField (PSBR, 0x05, PDCC)
                            PDCC = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN6, 0, Serialized)
                    {
                        If ((MSKN & 0x40))
                        {
                            CreateBitField (PSBR, 0x06, PXPS)
                            PXPS = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AF15, 0, NotSerialized)
                    {
                        P80H = 0xFF
                        CreateWordField (ATIB, 0x00, DNUM)
                        CreateWordField (ATIB, 0x02, DSZE)
                        DSZE = 0x08
                        Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                        \_SB.PCI0.LPC0.BCMD = 0x8D
                        \_SB.PCI0.LPC0.DID = 0x0F
                        \_SB.PCI0.LPC0.INFO = ATIB /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                        \_SB.PCI0.LPC0.SMIC = Zero
                        ATIB = \_SB.PCI0.LPC0.INFO
                        Release (\_SB.PCI0.LPC0.PSMX)
                        Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                    }
                }

                Device (HDAU)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Local0 = 0x00
                        Local2 = 0x00
                        While ((Local2 < 0x0F))
                        {
                            PSDC = One
                            Local4 = 0x01
                            Local5 = 0xC8
                            While ((Local4 && Local5))
                            {
                                Local6 = XPRD (0xA5)
                                Local6 &= 0x7F
                                If (((Local6 >= 0x10) && (Local6 != 0x7F)))
                                {
                                    Local4 = 0x00
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Local5--
                                }
                            }

                            If (!Local4)
                            {
                                Local5 = XPDL ()
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Local2++
                                }
                                Else
                                {
                                    \_SB.PCI0.LPC0.INFO = (XPPB () << 0x03)
                                    \_SB.PCI0.LPC0.BCMD = 0x87
                                    \_SB.PCI0.LPC0.SMIC = Zero
                                    If ((XPR2 () == Ones))
                                    {
                                        Local0 = 0x01
                                        Local2 = 0x10
                                    }
                                    Else
                                    {
                                        Local0 = 0x00
                                        Local2 = 0x10
                                    }
                                }
                            }
                            Else
                            {
                                Local2 = 0x10
                            }
                        }

                        If (!Local0)
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        PSDC = One
                        Local7 = ^VGA.DVID /* \_SB_.PCI0.PB3_.VGA_.DVID */
                        Sleep (0x0A)
                        Local4 = 0x01
                        Local5 = 0x05
                        While ((Local4 && Local5))
                        {
                            Local6 = XPRD (0xA5)
                            Local6 &= 0x7F
                            If ((Local6 <= 0x04))
                            {
                                Local4 = 0x00
                            }
                            Else
                            {
                                Local7 = ^VGA.DVID /* \_SB_.PCI0.PB3_.VGA_.DVID */
                                Sleep (0x05)
                                Local5--
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB4)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xE0020100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Local0 = Zero
                    If ((VC0S & 0x00020000))
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    XPIR = Arg0
                    Local0 = XPID /* \_SB_.PCI0.PB4_.XPID */
                    XPIR = 0x00
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    XPIR = Arg0
                    XPID = Arg1
                    XPIR = 0x00
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Local0 = XPRD (0xA2)
                    Local0 &= ~0x07
                    Local1 = (Local0 >> 0x04)
                    Local1 &= 0x07
                    Local0 |= Local1
                    Local0 |= 0x0100
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Local0 = _ADR /* \_SB_.PCI0.PB4_._ADR */
                    Local1 = (Local0 >> 0x10)
                    Local1 = (Local1 << 0x03)
                    Local2 = (Local0 & 0x0F)
                    Local3 = (Local1 | Local2)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Local1 = 0x00
                    Local0 = XPPB ()
                    If ((0x04 > Local0))
                    {
                        Local1 = 0x00
                    }

                    If ((0x08 > Local0))
                    {
                        Local1 = 0x00010000
                    }

                    If ((0x0B > Local0))
                    {
                        Local1 = 0x00020000
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Local0 = XPPB ()
                    Local2 = GPPX ()
                    Local3 = GFXM ()
                    Local1 = 0x00
                    If ((0x10 == Local0))
                    {
                        Local1 = 0xFFFF
                        If (Local3)
                        {
                            Local1 = 0x0F0F
                        }
                    }

                    If ((0x18 == Local0))
                    {
                        Local1 = 0xF0F0
                    }

                    If ((0x20 == Local0))
                    {
                        Local1 = 0x1010
                    }

                    If ((0x28 == Local0))
                    {
                        Local1 = 0x2020
                    }

                    If ((0x30 == Local0))
                    {
                        Local1 = 0x4040
                    }

                    If ((0x38 == Local0))
                    {
                        Local1 = 0x8080
                    }

                    If ((0x48 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x02 == Local2))
                        {
                            Local1 = 0x0303
                        }

                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0101
                        }
                    }

                    If ((0x50 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0202
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Local1 = XPPD ()
                    If ((0x00 != Local1))
                    {
                        Local2 = \_SB.PCI0.NBXR ((0x65 + XPCN ()))
                        If (Arg0)
                        {
                            Local2 &= ~Local1
                        }
                        Else
                        {
                            Local2 |= Local1
                        }

                        \_SB.PCI0.NBXW ((0x65 + XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Local0 = LKCN /* \_SB_.PCI0.PB4_.LKCN */
                    Local0 &= ~0x20
                    LKCN = Local0
                    Local0 |= 0x20
                    LKCN = Local0
                    Local1 = 0x64
                    Local2 = 0x01
                    While ((Local1 && Local2))
                    {
                        Sleep (0x01)
                        Local3 = LKST /* \_SB_.PCI0.PB4_.LKST */
                        If ((Local3 & 0x0800))
                        {
                            Local1--
                        }
                        Else
                        {
                            Local2 = 0x00
                        }
                    }

                    Local0 &= ~0x20
                    LKCN = Local0
                    If (!Local2)
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Local0 = GFXM ()
                    Local1 = XPPB ()
                    Local2 = 0x00
                    If ((0x10 == Local1))
                    {
                        Local2 = 0x01
                        Local3 = 0x00770070
                        If (Local0)
                        {
                            Local3 = 0x00330030
                        }
                    }

                    If (((0x18 == Local1) && Local0))
                    {
                        Local2 = 0x01
                        Local3 = 0x00440040
                    }

                    Local0 = \_SB.PCI0.NBMR (0x07)
                    Local1 = \_SB.PCI0.NBXR (0x65)
                    If ((Local0 && 0x0201F000))
                    {
                        Local4 = 0x00440040
                        Local5 = Local4
                        If ((~Local1 && 0xF0F0))
                        {
                            Local5 = 0x00
                        }
                    }
                    Else
                    {
                        Local4 = 0x00110010
                        Local5 = Local4
                        If ((~Local1 && 0x0F0F))
                        {
                            Local5 = 0x00
                        }
                    }

                    If (Local2)
                    {
                        Local6 = (Local3 | Local4)
                        Local0 = (Local5 & Local4)
                        Local7 = (Local3 | Local0)
                        Local0 = \_SB.PCI0.NBMR (0x2E)
                        If (Arg0)
                        {
                            Local0 &= ~Local6
                        }
                        Else
                        {
                            Local0 |= Local7
                        }

                        \_SB.PCI0.NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xDC), 
                        DISF,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Local0 = 0x00
                        Local2 = 0x00
                        While ((Local2 < 0x0F))
                        {
                            PSDC = One
                            Local4 = 0x01
                            Local5 = 0xC8
                            While ((Local4 && Local5))
                            {
                                Local6 = XPRD (0xA5)
                                Local6 &= 0x7F
                                If (((Local6 >= 0x10) && (Local6 != 0x7F)))
                                {
                                    Local4 = 0x00
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Local5--
                                }
                            }

                            If (!Local4)
                            {
                                Local5 = XPDL ()
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Local2++
                                }
                                Else
                                {
                                    \_SB.PCI0.LPC0.INFO = (XPPB () << 0x03)
                                    \_SB.PCI0.LPC0.BCMD = 0x87
                                    \_SB.PCI0.LPC0.SMIC = Zero
                                    If ((XPR2 () == Ones))
                                    {
                                        Local0 = 0x01
                                        Local2 = 0x10
                                    }
                                    Else
                                    {
                                        Local0 = 0x00
                                        Local2 = 0x10
                                    }
                                }
                            }
                            Else
                            {
                                Local2 = 0x10
                            }
                        }

                        If (!Local0)
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        PSDC = One
                        Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB4_.XPDV.DVID */
                        Sleep (0x0A)
                        Local4 = 0x01
                        Local5 = 0x05
                        While ((Local4 && Local5))
                        {
                            Local6 = XPRD (0xA5)
                            Local6 &= 0x7F
                            If ((Local6 <= 0x04))
                            {
                                Local4 = 0x00
                            }
                            Else
                            {
                                Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB4_.XPDV.DVID */
                                Sleep (0x05)
                                Local5--
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB5)
            {
                Name (_ADR, 0x00050000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xE0028100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Local0 = Zero
                    If ((VC0S & 0x00020000))
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    XPIR = Arg0
                    Local0 = XPID /* \_SB_.PCI0.PB5_.XPID */
                    XPIR = 0x00
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    XPIR = Arg0
                    XPID = Arg1
                    XPIR = 0x00
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Local0 = XPRD (0xA2)
                    Local0 &= ~0x07
                    Local1 = (Local0 >> 0x04)
                    Local1 &= 0x07
                    Local0 |= Local1
                    Local0 |= 0x0100
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Local0 = _ADR /* \_SB_.PCI0.PB5_._ADR */
                    Local1 = (Local0 >> 0x10)
                    Local1 = (Local1 << 0x03)
                    Local2 = (Local0 & 0x0F)
                    Local3 = (Local1 | Local2)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Local1 = 0x00
                    Local0 = XPPB ()
                    If ((0x04 > Local0))
                    {
                        Local1 = 0x00
                    }

                    If ((0x08 > Local0))
                    {
                        Local1 = 0x00010000
                    }

                    If ((0x0B > Local0))
                    {
                        Local1 = 0x00020000
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Local0 = XPPB ()
                    Local2 = GPPX ()
                    Local3 = GFXM ()
                    Local1 = 0x00
                    If ((0x10 == Local0))
                    {
                        Local1 = 0xFFFF
                        If (Local3)
                        {
                            Local1 = 0x0F0F
                        }
                    }

                    If ((0x18 == Local0))
                    {
                        Local1 = 0xF0F0
                    }

                    If ((0x20 == Local0))
                    {
                        Local1 = 0x1010
                    }

                    If ((0x28 == Local0))
                    {
                        Local1 = 0x2020
                    }

                    If ((0x30 == Local0))
                    {
                        Local1 = 0x4040
                    }

                    If ((0x38 == Local0))
                    {
                        Local1 = 0x8080
                    }

                    If ((0x48 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x02 == Local2))
                        {
                            Local1 = 0x0303
                        }

                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0101
                        }
                    }

                    If ((0x50 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0202
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Local1 = XPPD ()
                    If ((0x00 != Local1))
                    {
                        Local2 = \_SB.PCI0.NBXR ((0x65 + XPCN ()))
                        If (Arg0)
                        {
                            Local2 &= ~Local1
                        }
                        Else
                        {
                            Local2 |= Local1
                        }

                        \_SB.PCI0.NBXW ((0x65 + XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Local0 = LKCN /* \_SB_.PCI0.PB5_.LKCN */
                    Local0 &= ~0x20
                    LKCN = Local0
                    Local0 |= 0x20
                    LKCN = Local0
                    Local1 = 0x64
                    Local2 = 0x01
                    While ((Local1 && Local2))
                    {
                        Sleep (0x01)
                        Local3 = LKST /* \_SB_.PCI0.PB5_.LKST */
                        If ((Local3 & 0x0800))
                        {
                            Local1--
                        }
                        Else
                        {
                            Local2 = 0x00
                        }
                    }

                    Local0 &= ~0x20
                    LKCN = Local0
                    If (!Local2)
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Local0 = GFXM ()
                    Local1 = XPPB ()
                    Local2 = 0x00
                    If ((0x10 == Local1))
                    {
                        Local2 = 0x01
                        Local3 = 0x00770070
                        If (Local0)
                        {
                            Local3 = 0x00330030
                        }
                    }

                    If (((0x18 == Local1) && Local0))
                    {
                        Local2 = 0x01
                        Local3 = 0x00440040
                    }

                    Local0 = \_SB.PCI0.NBMR (0x07)
                    Local1 = \_SB.PCI0.NBXR (0x65)
                    If ((Local0 && 0x0201F000))
                    {
                        Local4 = 0x00440040
                        Local5 = Local4
                        If ((~Local1 && 0xF0F0))
                        {
                            Local5 = 0x00
                        }
                    }
                    Else
                    {
                        Local4 = 0x00110010
                        Local5 = Local4
                        If ((~Local1 && 0x0F0F))
                        {
                            Local5 = 0x00
                        }
                    }

                    If (Local2)
                    {
                        Local6 = (Local3 | Local4)
                        Local0 = (Local5 & Local4)
                        Local7 = (Local3 | Local0)
                        Local0 = \_SB.PCI0.NBMR (0x2E)
                        If (Arg0)
                        {
                            Local0 &= ~Local6
                        }
                        Else
                        {
                            Local0 |= Local7
                        }

                        \_SB.PCI0.NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xDC), 
                        DISF,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Local0 = 0x00
                        Local2 = 0x00
                        While ((Local2 < 0x0F))
                        {
                            PSDC = One
                            Local4 = 0x01
                            Local5 = 0xC8
                            While ((Local4 && Local5))
                            {
                                Local6 = XPRD (0xA5)
                                Local6 &= 0x7F
                                If (((Local6 >= 0x10) && (Local6 != 0x7F)))
                                {
                                    Local4 = 0x00
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Local5--
                                }
                            }

                            If (!Local4)
                            {
                                Local5 = XPDL ()
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Local2++
                                }
                                Else
                                {
                                    \_SB.PCI0.LPC0.INFO = (XPPB () << 0x03)
                                    \_SB.PCI0.LPC0.BCMD = 0x87
                                    \_SB.PCI0.LPC0.SMIC = Zero
                                    If ((XPR2 () == Ones))
                                    {
                                        Local0 = 0x01
                                        Local2 = 0x10
                                    }
                                    Else
                                    {
                                        Local0 = 0x00
                                        Local2 = 0x10
                                    }
                                }
                            }
                            Else
                            {
                                Local2 = 0x10
                            }
                        }

                        If (!Local0)
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        PSDC = One
                        Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB5_.XPDV.DVID */
                        Sleep (0x0A)
                        Local4 = 0x01
                        Local5 = 0x05
                        While ((Local4 && Local5))
                        {
                            Local6 = XPRD (0xA5)
                            Local6 &= 0x7F
                            If ((Local6 <= 0x04))
                            {
                                Local4 = 0x00
                            }
                            Else
                            {
                                Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB5_.XPDV.DVID */
                                Sleep (0x05)
                                Local5--
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB6)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xE0030100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Local0 = Zero
                    If ((VC0S & 0x00020000))
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    XPIR = Arg0
                    Local0 = XPID /* \_SB_.PCI0.PB6_.XPID */
                    XPIR = 0x00
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    XPIR = Arg0
                    XPID = Arg1
                    XPIR = 0x00
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Local0 = XPRD (0xA2)
                    Local0 &= ~0x07
                    Local1 = (Local0 >> 0x04)
                    Local1 &= 0x07
                    Local0 |= Local1
                    Local0 |= 0x0100
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Local0 = _ADR /* \_SB_.PCI0.PB6_._ADR */
                    Local1 = (Local0 >> 0x10)
                    Local1 = (Local1 << 0x03)
                    Local2 = (Local0 & 0x0F)
                    Local3 = (Local1 | Local2)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Local1 = 0x00
                    Local0 = XPPB ()
                    If ((0x04 > Local0))
                    {
                        Local1 = 0x00
                    }

                    If ((0x08 > Local0))
                    {
                        Local1 = 0x00010000
                    }

                    If ((0x0B > Local0))
                    {
                        Local1 = 0x00020000
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Local0 = XPPB ()
                    Local2 = GPPX ()
                    Local3 = GFXM ()
                    Local1 = 0x00
                    If ((0x10 == Local0))
                    {
                        Local1 = 0xFFFF
                        If (Local3)
                        {
                            Local1 = 0x0F0F
                        }
                    }

                    If ((0x18 == Local0))
                    {
                        Local1 = 0xF0F0
                    }

                    If ((0x20 == Local0))
                    {
                        Local1 = 0x1010
                    }

                    If ((0x28 == Local0))
                    {
                        Local1 = 0x2020
                    }

                    If ((0x30 == Local0))
                    {
                        Local1 = 0x4040
                    }

                    If ((0x38 == Local0))
                    {
                        Local1 = 0x8080
                    }

                    If ((0x48 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x02 == Local2))
                        {
                            Local1 = 0x0303
                        }

                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0101
                        }
                    }

                    If ((0x50 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0202
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Local1 = XPPD ()
                    If ((0x00 != Local1))
                    {
                        Local2 = \_SB.PCI0.NBXR ((0x65 + XPCN ()))
                        If (Arg0)
                        {
                            Local2 &= ~Local1
                        }
                        Else
                        {
                            Local2 |= Local1
                        }

                        \_SB.PCI0.NBXW ((0x65 + XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Local0 = LKCN /* \_SB_.PCI0.PB6_.LKCN */
                    Local0 &= ~0x20
                    LKCN = Local0
                    Local0 |= 0x20
                    LKCN = Local0
                    Local1 = 0x64
                    Local2 = 0x01
                    While ((Local1 && Local2))
                    {
                        Sleep (0x01)
                        Local3 = LKST /* \_SB_.PCI0.PB6_.LKST */
                        If ((Local3 & 0x0800))
                        {
                            Local1--
                        }
                        Else
                        {
                            Local2 = 0x00
                        }
                    }

                    Local0 &= ~0x20
                    LKCN = Local0
                    If (!Local2)
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Local0 = GFXM ()
                    Local1 = XPPB ()
                    Local2 = 0x00
                    If ((0x10 == Local1))
                    {
                        Local2 = 0x01
                        Local3 = 0x00770070
                        If (Local0)
                        {
                            Local3 = 0x00330030
                        }
                    }

                    If (((0x18 == Local1) && Local0))
                    {
                        Local2 = 0x01
                        Local3 = 0x00440040
                    }

                    Local0 = \_SB.PCI0.NBMR (0x07)
                    Local1 = \_SB.PCI0.NBXR (0x65)
                    If ((Local0 && 0x0201F000))
                    {
                        Local4 = 0x00440040
                        Local5 = Local4
                        If ((~Local1 && 0xF0F0))
                        {
                            Local5 = 0x00
                        }
                    }
                    Else
                    {
                        Local4 = 0x00110010
                        Local5 = Local4
                        If ((~Local1 && 0x0F0F))
                        {
                            Local5 = 0x00
                        }
                    }

                    If (Local2)
                    {
                        Local6 = (Local3 | Local4)
                        Local0 = (Local5 & Local4)
                        Local7 = (Local3 | Local0)
                        Local0 = \_SB.PCI0.NBMR (0x2E)
                        If (Arg0)
                        {
                            Local0 &= ~Local6
                        }
                        Else
                        {
                            Local0 |= Local7
                        }

                        \_SB.PCI0.NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xDC), 
                        DISF,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Local0 = 0x00
                        Local2 = 0x00
                        While ((Local2 < 0x0F))
                        {
                            PSDC = One
                            Local4 = 0x01
                            Local5 = 0xC8
                            While ((Local4 && Local5))
                            {
                                Local6 = XPRD (0xA5)
                                Local6 &= 0x7F
                                If (((Local6 >= 0x10) && (Local6 != 0x7F)))
                                {
                                    Local4 = 0x00
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Local5--
                                }
                            }

                            If (!Local4)
                            {
                                Local5 = XPDL ()
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Local2++
                                }
                                Else
                                {
                                    \_SB.PCI0.LPC0.INFO = (XPPB () << 0x03)
                                    \_SB.PCI0.LPC0.BCMD = 0x87
                                    \_SB.PCI0.LPC0.SMIC = Zero
                                    If ((XPR2 () == Ones))
                                    {
                                        Local0 = 0x01
                                        Local2 = 0x10
                                    }
                                    Else
                                    {
                                        Local0 = 0x00
                                        Local2 = 0x10
                                    }
                                }
                            }
                            Else
                            {
                                Local2 = 0x10
                            }
                        }

                        If (!Local0)
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        PSDC = One
                        Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB6_.XPDV.DVID */
                        Sleep (0x0A)
                        Local4 = 0x01
                        Local5 = 0x05
                        While ((Local4 && Local5))
                        {
                            Local6 = XPRD (0xA5)
                            Local6 &= 0x7F
                            If ((Local6 <= 0x04))
                            {
                                Local4 = 0x00
                            }
                            Else
                            {
                                Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB6_.XPDV.DVID */
                                Sleep (0x05)
                                Local5--
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB7)
            {
                Name (_ADR, 0x00070000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xE0038100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Local0 = Zero
                    If ((VC0S & 0x00020000))
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    XPIR = Arg0
                    Local0 = XPID /* \_SB_.PCI0.PB7_.XPID */
                    XPIR = 0x00
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    XPIR = Arg0
                    XPID = Arg1
                    XPIR = 0x00
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Local0 = XPRD (0xA2)
                    Local0 &= ~0x07
                    Local1 = (Local0 >> 0x04)
                    Local1 &= 0x07
                    Local0 |= Local1
                    Local0 |= 0x0100
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Local0 = _ADR /* \_SB_.PCI0.PB7_._ADR */
                    Local1 = (Local0 >> 0x10)
                    Local1 = (Local1 << 0x03)
                    Local2 = (Local0 & 0x0F)
                    Local3 = (Local1 | Local2)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Local1 = 0x00
                    Local0 = XPPB ()
                    If ((0x04 > Local0))
                    {
                        Local1 = 0x00
                    }

                    If ((0x08 > Local0))
                    {
                        Local1 = 0x00010000
                    }

                    If ((0x0B > Local0))
                    {
                        Local1 = 0x00020000
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Local0 = XPPB ()
                    Local2 = GPPX ()
                    Local3 = GFXM ()
                    Local1 = 0x00
                    If ((0x10 == Local0))
                    {
                        Local1 = 0xFFFF
                        If (Local3)
                        {
                            Local1 = 0x0F0F
                        }
                    }

                    If ((0x18 == Local0))
                    {
                        Local1 = 0xF0F0
                    }

                    If ((0x20 == Local0))
                    {
                        Local1 = 0x1010
                    }

                    If ((0x28 == Local0))
                    {
                        Local1 = 0x2020
                    }

                    If ((0x30 == Local0))
                    {
                        Local1 = 0x4040
                    }

                    If ((0x38 == Local0))
                    {
                        Local1 = 0x8080
                    }

                    If ((0x48 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x02 == Local2))
                        {
                            Local1 = 0x0303
                        }

                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0101
                        }
                    }

                    If ((0x50 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0202
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Local1 = XPPD ()
                    If ((0x00 != Local1))
                    {
                        Local2 = \_SB.PCI0.NBXR ((0x65 + XPCN ()))
                        If (Arg0)
                        {
                            Local2 &= ~Local1
                        }
                        Else
                        {
                            Local2 |= Local1
                        }

                        \_SB.PCI0.NBXW ((0x65 + XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Local0 = LKCN /* \_SB_.PCI0.PB7_.LKCN */
                    Local0 &= ~0x20
                    LKCN = Local0
                    Local0 |= 0x20
                    LKCN = Local0
                    Local1 = 0x64
                    Local2 = 0x01
                    While ((Local1 && Local2))
                    {
                        Sleep (0x01)
                        Local3 = LKST /* \_SB_.PCI0.PB7_.LKST */
                        If ((Local3 & 0x0800))
                        {
                            Local1--
                        }
                        Else
                        {
                            Local2 = 0x00
                        }
                    }

                    Local0 &= ~0x20
                    LKCN = Local0
                    If (!Local2)
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Local0 = GFXM ()
                    Local1 = XPPB ()
                    Local2 = 0x00
                    If ((0x10 == Local1))
                    {
                        Local2 = 0x01
                        Local3 = 0x00770070
                        If (Local0)
                        {
                            Local3 = 0x00330030
                        }
                    }

                    If (((0x18 == Local1) && Local0))
                    {
                        Local2 = 0x01
                        Local3 = 0x00440040
                    }

                    Local0 = \_SB.PCI0.NBMR (0x07)
                    Local1 = \_SB.PCI0.NBXR (0x65)
                    If ((Local0 && 0x0201F000))
                    {
                        Local4 = 0x00440040
                        Local5 = Local4
                        If ((~Local1 && 0xF0F0))
                        {
                            Local5 = 0x00
                        }
                    }
                    Else
                    {
                        Local4 = 0x00110010
                        Local5 = Local4
                        If ((~Local1 && 0x0F0F))
                        {
                            Local5 = 0x00
                        }
                    }

                    If (Local2)
                    {
                        Local6 = (Local3 | Local4)
                        Local0 = (Local5 & Local4)
                        Local7 = (Local3 | Local0)
                        Local0 = \_SB.PCI0.NBMR (0x2E)
                        If (Arg0)
                        {
                            Local0 &= ~Local6
                        }
                        Else
                        {
                            Local0 |= Local7
                        }

                        \_SB.PCI0.NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xDC), 
                        DISF,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Local0 = 0x00
                        Local2 = 0x00
                        While ((Local2 < 0x0F))
                        {
                            PSDC = One
                            Local4 = 0x01
                            Local5 = 0xC8
                            While ((Local4 && Local5))
                            {
                                Local6 = XPRD (0xA5)
                                Local6 &= 0x7F
                                If (((Local6 >= 0x10) && (Local6 != 0x7F)))
                                {
                                    Local4 = 0x00
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Local5--
                                }
                            }

                            If (!Local4)
                            {
                                Local5 = XPDL ()
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Local2++
                                }
                                Else
                                {
                                    \_SB.PCI0.LPC0.INFO = (XPPB () << 0x03)
                                    \_SB.PCI0.LPC0.BCMD = 0x87
                                    \_SB.PCI0.LPC0.SMIC = Zero
                                    If ((XPR2 () == Ones))
                                    {
                                        Local0 = 0x01
                                        Local2 = 0x10
                                    }
                                    Else
                                    {
                                        Local0 = 0x00
                                        Local2 = 0x10
                                    }
                                }
                            }
                            Else
                            {
                                Local2 = 0x10
                            }
                        }

                        If (!Local0)
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        PSDC = One
                        Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB7_.XPDV.DVID */
                        Sleep (0x0A)
                        Local4 = 0x01
                        Local5 = 0x05
                        While ((Local4 && Local5))
                        {
                            Local6 = XPRD (0xA5)
                            Local6 &= 0x7F
                            If ((Local6 <= 0x04))
                            {
                                Local4 = 0x00
                            }
                            Else
                            {
                                Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB7_.XPDV.DVID */
                                Sleep (0x05)
                                Local5--
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB9)
            {
                Name (_ADR, 0x00090000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xE0048100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Local0 = Zero
                    If ((VC0S & 0x00020000))
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    XPIR = Arg0
                    Local0 = XPID /* \_SB_.PCI0.PB9_.XPID */
                    XPIR = 0x00
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    XPIR = Arg0
                    XPID = Arg1
                    XPIR = 0x00
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Local0 = XPRD (0xA2)
                    Local0 &= ~0x07
                    Local1 = (Local0 >> 0x04)
                    Local1 &= 0x07
                    Local0 |= Local1
                    Local0 |= 0x0100
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Local0 = _ADR /* \_SB_.PCI0.PB9_._ADR */
                    Local1 = (Local0 >> 0x10)
                    Local1 = (Local1 << 0x03)
                    Local2 = (Local0 & 0x0F)
                    Local3 = (Local1 | Local2)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Local1 = 0x00
                    Local0 = XPPB ()
                    If ((0x04 > Local0))
                    {
                        Local1 = 0x00
                    }

                    If ((0x08 > Local0))
                    {
                        Local1 = 0x00010000
                    }

                    If ((0x0B > Local0))
                    {
                        Local1 = 0x00020000
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Local0 = XPPB ()
                    Local2 = GPPX ()
                    Local3 = GFXM ()
                    Local1 = 0x00
                    If ((0x10 == Local0))
                    {
                        Local1 = 0xFFFF
                        If (Local3)
                        {
                            Local1 = 0x0F0F
                        }
                    }

                    If ((0x18 == Local0))
                    {
                        Local1 = 0xF0F0
                    }

                    If ((0x20 == Local0))
                    {
                        Local1 = 0x1010
                    }

                    If ((0x28 == Local0))
                    {
                        Local1 = 0x2020
                    }

                    If ((0x30 == Local0))
                    {
                        Local1 = 0x4040
                    }

                    If ((0x38 == Local0))
                    {
                        Local1 = 0x8080
                    }

                    If ((0x48 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x02 == Local2))
                        {
                            Local1 = 0x0303
                        }

                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0101
                        }
                    }

                    If ((0x50 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0202
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Local1 = XPPD ()
                    If ((0x00 != Local1))
                    {
                        Local2 = \_SB.PCI0.NBXR ((0x65 + XPCN ()))
                        If (Arg0)
                        {
                            Local2 &= ~Local1
                        }
                        Else
                        {
                            Local2 |= Local1
                        }

                        \_SB.PCI0.NBXW ((0x65 + XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Local0 = LKCN /* \_SB_.PCI0.PB9_.LKCN */
                    Local0 &= ~0x20
                    LKCN = Local0
                    Local0 |= 0x20
                    LKCN = Local0
                    Local1 = 0x64
                    Local2 = 0x01
                    While ((Local1 && Local2))
                    {
                        Sleep (0x01)
                        Local3 = LKST /* \_SB_.PCI0.PB9_.LKST */
                        If ((Local3 & 0x0800))
                        {
                            Local1--
                        }
                        Else
                        {
                            Local2 = 0x00
                        }
                    }

                    Local0 &= ~0x20
                    LKCN = Local0
                    If (!Local2)
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Local0 = GFXM ()
                    Local1 = XPPB ()
                    Local2 = 0x00
                    If ((0x10 == Local1))
                    {
                        Local2 = 0x01
                        Local3 = 0x00770070
                        If (Local0)
                        {
                            Local3 = 0x00330030
                        }
                    }

                    If (((0x18 == Local1) && Local0))
                    {
                        Local2 = 0x01
                        Local3 = 0x00440040
                    }

                    Local0 = \_SB.PCI0.NBMR (0x07)
                    Local1 = \_SB.PCI0.NBXR (0x65)
                    If ((Local0 && 0x0201F000))
                    {
                        Local4 = 0x00440040
                        Local5 = Local4
                        If ((~Local1 && 0xF0F0))
                        {
                            Local5 = 0x00
                        }
                    }
                    Else
                    {
                        Local4 = 0x00110010
                        Local5 = Local4
                        If ((~Local1 && 0x0F0F))
                        {
                            Local5 = 0x00
                        }
                    }

                    If (Local2)
                    {
                        Local6 = (Local3 | Local4)
                        Local0 = (Local5 & Local4)
                        Local7 = (Local3 | Local0)
                        Local0 = \_SB.PCI0.NBMR (0x2E)
                        If (Arg0)
                        {
                            Local0 &= ~Local6
                        }
                        Else
                        {
                            Local0 |= Local7
                        }

                        \_SB.PCI0.NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xDC), 
                        DISF,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Local0 = 0x00
                        Local2 = 0x00
                        While ((Local2 < 0x0F))
                        {
                            PSDC = One
                            Local4 = 0x01
                            Local5 = 0xC8
                            While ((Local4 && Local5))
                            {
                                Local6 = XPRD (0xA5)
                                Local6 &= 0x7F
                                If (((Local6 >= 0x10) && (Local6 != 0x7F)))
                                {
                                    Local4 = 0x00
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Local5--
                                }
                            }

                            If (!Local4)
                            {
                                Local5 = XPDL ()
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Local2++
                                }
                                Else
                                {
                                    \_SB.PCI0.LPC0.INFO = (XPPB () << 0x03)
                                    \_SB.PCI0.LPC0.BCMD = 0x87
                                    \_SB.PCI0.LPC0.SMIC = Zero
                                    If ((XPR2 () == Ones))
                                    {
                                        Local0 = 0x01
                                        Local2 = 0x10
                                    }
                                    Else
                                    {
                                        Local0 = 0x00
                                        Local2 = 0x10
                                    }
                                }
                            }
                            Else
                            {
                                Local2 = 0x10
                            }
                        }

                        If (!Local0)
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        PSDC = One
                        Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB9_.XPDV.DVID */
                        Sleep (0x0A)
                        Local4 = 0x01
                        Local5 = 0x05
                        While ((Local4 && Local5))
                        {
                            Local6 = XPRD (0xA5)
                            Local6 &= 0x7F
                            If ((Local6 <= 0x04))
                            {
                                Local4 = 0x00
                            }
                            Else
                            {
                                Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB9_.XPDV.DVID */
                                Sleep (0x05)
                                Local5--
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB10)
            {
                Name (_ADR, 0x000A0000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xE0050100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Local0 = Zero
                    If ((VC0S & 0x00020000))
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    XPIR = Arg0
                    Local0 = XPID /* \_SB_.PCI0.PB10.XPID */
                    XPIR = 0x00
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    XPIR = Arg0
                    XPID = Arg1
                    XPIR = 0x00
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Local0 = XPRD (0xA2)
                    Local0 &= ~0x07
                    Local1 = (Local0 >> 0x04)
                    Local1 &= 0x07
                    Local0 |= Local1
                    Local0 |= 0x0100
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Local0 = _ADR /* \_SB_.PCI0.PB10._ADR */
                    Local1 = (Local0 >> 0x10)
                    Local1 = (Local1 << 0x03)
                    Local2 = (Local0 & 0x0F)
                    Local3 = (Local1 | Local2)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Local1 = 0x00
                    Local0 = XPPB ()
                    If ((0x04 > Local0))
                    {
                        Local1 = 0x00
                    }

                    If ((0x08 > Local0))
                    {
                        Local1 = 0x00010000
                    }

                    If ((0x0B > Local0))
                    {
                        Local1 = 0x00020000
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Local0 = XPPB ()
                    Local2 = GPPX ()
                    Local3 = GFXM ()
                    Local1 = 0x00
                    If ((0x10 == Local0))
                    {
                        Local1 = 0xFFFF
                        If (Local3)
                        {
                            Local1 = 0x0F0F
                        }
                    }

                    If ((0x18 == Local0))
                    {
                        Local1 = 0xF0F0
                    }

                    If ((0x20 == Local0))
                    {
                        Local1 = 0x1010
                    }

                    If ((0x28 == Local0))
                    {
                        Local1 = 0x2020
                    }

                    If ((0x30 == Local0))
                    {
                        Local1 = 0x4040
                    }

                    If ((0x38 == Local0))
                    {
                        Local1 = 0x8080
                    }

                    If ((0x48 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x02 == Local2))
                        {
                            Local1 = 0x0303
                        }

                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0101
                        }
                    }

                    If ((0x50 == Local0))
                    {
                        Local1 = 0x00
                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0202
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Local1 = XPPD ()
                    If ((0x00 != Local1))
                    {
                        Local2 = \_SB.PCI0.NBXR ((0x65 + XPCN ()))
                        If (Arg0)
                        {
                            Local2 &= ~Local1
                        }
                        Else
                        {
                            Local2 |= Local1
                        }

                        \_SB.PCI0.NBXW ((0x65 + XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Local0 = LKCN /* \_SB_.PCI0.PB10.LKCN */
                    Local0 &= ~0x20
                    LKCN = Local0
                    Local0 |= 0x20
                    LKCN = Local0
                    Local1 = 0x64
                    Local2 = 0x01
                    While ((Local1 && Local2))
                    {
                        Sleep (0x01)
                        Local3 = LKST /* \_SB_.PCI0.PB10.LKST */
                        If ((Local3 & 0x0800))
                        {
                            Local1--
                        }
                        Else
                        {
                            Local2 = 0x00
                        }
                    }

                    Local0 &= ~0x20
                    LKCN = Local0
                    If (!Local2)
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Local0 = GFXM ()
                    Local1 = XPPB ()
                    Local2 = 0x00
                    If ((0x10 == Local1))
                    {
                        Local2 = 0x01
                        Local3 = 0x00770070
                        If (Local0)
                        {
                            Local3 = 0x00330030
                        }
                    }

                    If (((0x18 == Local1) && Local0))
                    {
                        Local2 = 0x01
                        Local3 = 0x00440040
                    }

                    Local0 = \_SB.PCI0.NBMR (0x07)
                    Local1 = \_SB.PCI0.NBXR (0x65)
                    If ((Local0 && 0x0201F000))
                    {
                        Local4 = 0x00440040
                        Local5 = Local4
                        If ((~Local1 && 0xF0F0))
                        {
                            Local5 = 0x00
                        }
                    }
                    Else
                    {
                        Local4 = 0x00110010
                        Local5 = Local4
                        If ((~Local1 && 0x0F0F))
                        {
                            Local5 = 0x00
                        }
                    }

                    If (Local2)
                    {
                        Local6 = (Local3 | Local4)
                        Local0 = (Local5 & Local4)
                        Local7 = (Local3 | Local0)
                        Local0 = \_SB.PCI0.NBMR (0x2E)
                        If (Arg0)
                        {
                            Local0 &= ~Local6
                        }
                        Else
                        {
                            Local0 |= Local7
                        }

                        \_SB.PCI0.NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        \_SB.PCI0.XPTR ((XPPB () << 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xDC), 
                        DISF,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Local0 = 0x00
                        Local2 = 0x00
                        While ((Local2 < 0x0F))
                        {
                            PSDC = One
                            Local4 = 0x01
                            Local5 = 0xC8
                            While ((Local4 && Local5))
                            {
                                Local6 = XPRD (0xA5)
                                Local6 &= 0x7F
                                If (((Local6 >= 0x10) && (Local6 != 0x7F)))
                                {
                                    Local4 = 0x00
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Local5--
                                }
                            }

                            If (!Local4)
                            {
                                Local5 = XPDL ()
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Local2++
                                }
                                Else
                                {
                                    \_SB.PCI0.LPC0.INFO = (XPPB () << 0x03)
                                    \_SB.PCI0.LPC0.BCMD = 0x87
                                    \_SB.PCI0.LPC0.SMIC = Zero
                                    If ((XPR2 () == Ones))
                                    {
                                        Local0 = 0x01
                                        Local2 = 0x10
                                    }
                                    Else
                                    {
                                        Local0 = 0x00
                                        Local2 = 0x10
                                    }
                                }
                            }
                            Else
                            {
                                Local2 = 0x10
                            }
                        }

                        If (!Local0)
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        PSDC = One
                        Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB10.XPDV.DVID */
                        Sleep (0x0A)
                        Local4 = 0x01
                        Local5 = 0x05
                        While ((Local4 && Local5))
                        {
                            Local6 = XPRD (0xA5)
                            Local6 &= 0x7F
                            If ((Local6 <= 0x04))
                            {
                                Local4 = 0x00
                            }
                            Else
                            {
                                Local7 = ^XPDV.DVID /* \_SB_.PCI0.PB10.XPDV.DVID */
                                Sleep (0x05)
                                Local5--
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (OHC1)
            {
                Name (_ADR, 0x00120000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (EHC1)
            {
                Name (_ADR, 0x00120002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (EHC2)
            {
                Name (_ADR, 0x00130002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (OHC3)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (EHC3)
            {
                Name (_ADR, 0x00160002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (OHC4)
            {
                Name (_ADR, 0x00140005)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (SBAZ)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x19, 
                    0x03
                })
            }

            Device (GEC)
            {
                Name (_ADR, 0x00140006)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x1A, 
                    0x04
                })
                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        \_SB.PCI0.SMB.E26C = 0x01
                    }
                }
            }

            Scope (\_SB.PCI0)
            {
                OperationRegion (SATC, SystemMemory, 0xE0088000, 0x0100)
                Field (SATC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x0A), 
                    STCL,   16, 
                    Offset (0xFC), 
                    RMBA,   32
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x00110000)  // _ADR: Address
                Name (B5EN, 0x00)
                Name (BA_5, 0x00)
                Name (SBAR, 0xD0607C00)
                OperationRegion (SATX, PCI_Config, 0x00, 0x28)
                Field (SATX, AnyAcc, NoLock, Preserve)
                {
                    VIDI,   32, 
                    Offset (0x24), 
                    BA05,   32
                }

                Method (GBAA, 0, Serialized)
                {
                    BA_5 = BA05 /* \_SB_.PCI0.SATA.BA05 */
                    If (((BA_5 == 0xFFFFFFFF) || (\_SB.PCI0.STCL != 0x0101)))
                    {
                        B5EN = 0x00
                        Return (SBAR) /* \_SB_.PCI0.SATA.SBAR */
                    }
                    Else
                    {
                        B5EN = 0x01
                        Return (BA_5) /* \_SB_.PCI0.SATA.BA_5 */
                    }
                }

                OperationRegion (BAR5, SystemMemory, GBAA (), 0x1000)
                Field (BAR5, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x120), 
                        ,   7, 
                    BSY0,   1, 
                    Offset (0x128), 
                    DET0,   4, 
                    Offset (0x129), 
                    IPM0,   4, 
                    Offset (0x1A0), 
                        ,   7, 
                    BSY1,   1, 
                    Offset (0x1A8), 
                    DET1,   4, 
                    Offset (0x1A9), 
                    IPM1,   4, 
                    Offset (0x220), 
                        ,   7, 
                    BSY2,   1, 
                    Offset (0x228), 
                    DET2,   4, 
                    Offset (0x229), 
                    IPM2,   4, 
                    Offset (0x2A0), 
                        ,   7, 
                    BSY3,   1, 
                    Offset (0x2A8), 
                    DET3,   4, 
                    Offset (0x2A9), 
                    IPM3,   4, 
                    Offset (0x320), 
                        ,   7, 
                    BSY4,   1, 
                    Offset (0x328), 
                    DET4,   4, 
                    Offset (0x329), 
                    IPM4,   4, 
                    Offset (0x3A0), 
                        ,   7, 
                    BSY5,   1, 
                    Offset (0x3A8), 
                    DET5,   4, 
                    Offset (0x3A9), 
                    IPM5,   4
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    GBAA ()
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */  0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  // x.......
                        /* 0008 */  0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  // x.......
                        /* 0010 */  0x1F, 0x00, 0x00, 0x00                           // ....
                    })
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM) /* \_SB_.PCI0.SATA.PRID.SPTM */
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        SPTM = Arg0
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        GBAA ()
                        If ((((TPOS >= 0x40) || (TPOS == 0x04)) && \_SB.PCI0.SATA.B5EN))
                        {
                            If (\_SB.PCI0.SATA.IPM0)
                            {
                                Local0 = 0x32
                                While (((\_SB.PCI0.SATA.BSY0 == 0x01) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }

                            If (\_SB.PCI0.SATA.IPM2)
                            {
                                Local0 = 0x32
                                While (((\_SB.PCI0.SATA.BSY2 == 0x01) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }
                        }
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If ((B5EN == 0x00))
                            {
                                Return (0x00)
                            }

                            If ((\_SB.PCI0.SATA.DET0 == 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Name (S12P, 0x00)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If ((((TPOS < 0x40) && (TPOS != 0x04)) && \_SB.PCI0.SATA.B5EN))
                            {
                                Local0 = 0x32
                                While (((\_SB.PCI0.SATA.BSY0 == 0x01) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF         // .F.....
                                }
                            Return (Local0)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If ((B5EN == 0x00))
                            {
                                Return (0x00)
                            }

                            If ((\_SB.PCI0.SATA.DET2 == 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Name (S12P, 0x00)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If ((((TPOS < 0x40) && (TPOS != 0x04)) && \_SB.PCI0.SATA.B5EN))
                            {
                                Local0 = 0x32
                                While (((\_SB.PCI0.SATA.BSY2 == 0x01) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF         // .F.....
                                }
                            Return (Local0)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */  0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  // x.......
                        /* 0008 */  0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  // x.......
                        /* 0010 */  0x1F, 0x00, 0x00, 0x00                           // ....
                    })
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM) /* \_SB_.PCI0.SATA.SECD.SPTM */
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        SPTM = Arg0
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        GBAA ()
                        If ((((TPOS >= 0x40) || (TPOS == 0x04)) && \_SB.PCI0.SATA.B5EN))
                        {
                            If (\_SB.PCI0.SATA.IPM1)
                            {
                                Local0 = 0x32
                                While (((\_SB.PCI0.SATA.BSY1 == 0x01) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }

                            If (\_SB.PCI0.SATA.IPM3)
                            {
                                Local0 = 0x32
                                While (((\_SB.PCI0.SATA.BSY3 == 0x01) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }
                        }
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If ((B5EN == 0x00))
                            {
                                Return (0x00)
                            }

                            If ((\_SB.PCI0.SATA.DET1 == 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If ((((TPOS < 0x40) && (TPOS != 0x04)) && \_SB.PCI0.SATA.B5EN))
                            {
                                Local0 = 0x32
                                While (((\_SB.PCI0.SATA.BSY1 == 0x01) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF         // .F.....
                                }
                            Return (Local0)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If ((B5EN == 0x00))
                            {
                                Return (0x00)
                            }

                            If ((\_SB.PCI0.SATA.DET3 == 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If ((((TPOS < 0x40) && (TPOS != 0x04)) && \_SB.PCI0.SATA.B5EN))
                            {
                                Local0 = 0x32
                                While (((\_SB.PCI0.SATA.BSY3 == 0x01) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF         // .F.....
                                }
                            Return (Local0)
                        }
                    }
                }

                Device (PRT1)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                OperationRegion (Z00A, PCI_Config, 0x08, 0x0100)
                Field (Z00A, AnyAcc, NoLock, Preserve)
                {
                    RVID,   8, 
                    Offset (0x0C), 
                    HPBS,   32, 
                    Offset (0x3B), 
                        ,   3, 
                    HIHP,   1, 
                    Offset (0x5A), 
                    I1F,    1, 
                    I12F,   1, 
                    Offset (0x5C), 
                        ,   10, 
                    HPET,   1, 
                    Offset (0x7A), 
                        ,   2, 
                    G31O,   1, 
                    Offset (0xD9), 
                        ,   6, 
                    ACIR,   1
                }

                OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                    INPM,   8, 
                    DAPM,   8
                }

                IndexField (INPM, DAPM, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x24), 
                    MMSO,   32, 
                    Offset (0x60), 
                    P1EB,   16
                }

                OperationRegion (ERMM, SystemMemory, MMSO, 0x1000)
                Field (ERMM, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x105), 
                        ,   5, 
                    G06E,   1, 
                    G06O,   1, 
                    G06I,   1, 
                        ,   5, 
                    G07E,   1, 
                    G07O,   1, 
                    G07I,   1, 
                    Offset (0x10A), 
                        ,   5, 
                    G11E,   1, 
                    G11O,   1, 
                    G11I,   1, 
                        ,   5, 
                    G12E,   1, 
                    G12O,   1, 
                    G12I,   1, 
                        ,   5, 
                    G13E,   1, 
                    G13O,   1, 
                    G13I,   1, 
                        ,   5, 
                    G14E,   1, 
                    G14O,   1, 
                    G14I,   1, 
                        ,   5, 
                    G15E,   1, 
                    G15O,   1, 
                    G15I,   1, 
                        ,   5, 
                    G16E,   1, 
                    G16O,   1, 
                    G16I,   1, 
                    Offset (0x113), 
                        ,   5, 
                    G20E,   1, 
                    G20O,   1, 
                    G20I,   1, 
                        ,   5, 
                    G21E,   1, 
                    G21O,   1, 
                    G21I,   1, 
                    Offset (0x11A), 
                        ,   5, 
                    G27E,   1, 
                    G27O,   1, 
                    G27I,   1, 
                    Offset (0x11F), 
                        ,   5, 
                    G32E,   1, 
                    G32O,   1, 
                    G32I,   1, 
                    Offset (0x122), 
                        ,   5, 
                    G35E,   1, 
                    G35O,   1, 
                    G35I,   1, 
                    Offset (0x128), 
                    GP41,   8, 
                    Offset (0x12B), 
                        ,   5, 
                    G44E,   1, 
                    G44O,   1, 
                    G44I,   1, 
                        ,   5, 
                    G45E,   1, 
                    G45O,   1, 
                    G45I,   1, 
                    GP46,   8, 
                    Offset (0x132), 
                        ,   5, 
                    G51E,   1, 
                    G51O,   1, 
                    G51I,   1, 
                    Offset (0x136), 
                        ,   5, 
                    G55E,   1, 
                    G55O,   1, 
                    G55I,   1, 
                    Offset (0x13A), 
                        ,   5, 
                    G59E,   1, 
                    G59O,   1, 
                    G59I,   1, 
                    Offset (0x13E), 
                    GP63,   8, 
                        ,   5, 
                    G64E,   1, 
                    G64O,   1, 
                    G64I,   1, 
                    Offset (0x164), 
                        ,   7, 
                    GE05,   1, 
                        ,   5, 
                    Z00B,   1, 
                    Z00C,   1, 
                    Z00D,   1, 
                    Offset (0x16A), 
                    GE11,   8, 
                    Offset (0x16E), 
                        ,   7, 
                    GE15,   1, 
                        ,   7, 
                    GE16,   1, 
                    Offset (0x174), 
                    GE21,   8, 
                        ,   7, 
                    GE22,   1, 
                    Offset (0x1A5), 
                    GPA6,   8, 
                    Offset (0x1A9), 
                        ,   5, 
                    Z00E,   1, 
                    Z00F,   1, 
                    Z00G,   1, 
                    Offset (0x1AE), 
                        ,   5, 
                    PD0E,   1, 
                    PD0O,   1, 
                    PD0I,   1, 
                        ,   5, 
                    PD1E,   1, 
                    PD1O,   1, 
                    PD1I,   1, 
                        ,   5, 
                    Z00H,   1, 
                    Z00I,   1, 
                    Z00J,   1, 
                        ,   5, 
                    Z00K,   1, 
                    Z00L,   1, 
                    Z00M,   1, 
                        ,   5, 
                    Z00N,   1, 
                    Z00O,   1, 
                    Z00P,   1, 
                        ,   5, 
                    Z00Q,   1, 
                    Z00R,   1, 
                    Z00S,   1, 
                        ,   5, 
                    Z00T,   1, 
                    Z00U,   1, 
                    Z00V,   1, 
                        ,   5, 
                    Z00W,   1, 
                    Z00X,   1, 
                    Z00Y,   1, 
                    Offset (0x1FF), 
                        ,   1, 
                    E01S,   1, 
                        ,   3, 
                    E05S,   1, 
                        ,   9, 
                    E15S,   1, 
                    E16S,   1, 
                        ,   6, 
                    E22S,   1, 
                    Offset (0x203), 
                        ,   1, 
                    E01E,   1, 
                        ,   3, 
                    E05E,   1, 
                        ,   9, 
                    E15E,   1, 
                    E16E,   1, 
                        ,   5, 
                    E22E,   1, 
                    Offset (0x207), 
                        ,   1, 
                    E01C,   1, 
                        ,   3, 
                    E05C,   1, 
                        ,   9, 
                    E15C,   1, 
                    E16C,   1, 
                        ,   5, 
                    E22C,   1, 
                        ,   3, 
                    E26C,   1, 
                    Offset (0x20B), 
                        ,   1, 
                    E01L,   1, 
                        ,   3, 
                    E05L,   1, 
                        ,   9, 
                    E15L,   1, 
                    E16L,   1, 
                        ,   6, 
                    E22L,   1, 
                    Offset (0x287), 
                        ,   1, 
                    CLPS,   1, 
                    Offset (0x298), 
                        ,   7, 
                    G15A,   1, 
                    Offset (0x2AF), 
                        ,   2, 
                    SLPS,   2, 
                    Offset (0x361), 
                        ,   6, 
                    MT3A,   1, 
                    Offset (0x376), 
                    EPNM,   1, 
                    DPPF,   1, 
                    Offset (0x3BA), 
                        ,   6, 
                    PWDE,   1, 
                    Offset (0x3BD), 
                        ,   5, 
                    ALLS,   1, 
                    Offset (0x3C7), 
                        ,   2, 
                    TFTE,   1, 
                    Offset (0x3DE), 
                    BLNK,   2, 
                    Offset (0x3EF), 
                    PHYD,   1, 
                        ,   1, 
                    RSTU,   1, 
                    US5R,   1, 
                    Offset (0x3F5), 
                    GECD,   1, 
                    Offset (0x3FF), 
                    F0CT,   8, 
                    F0MS,   8, 
                    F0FQ,   8, 
                    F0LD,   8, 
                    F0MD,   8, 
                    F0MP,   8, 
                    LT0L,   8, 
                    LT0H,   8, 
                    MT0L,   8, 
                    MT0H,   8, 
                    HT0L,   8, 
                    HT0H,   8, 
                    LRG0,   8, 
                    LHC0,   8, 
                    Offset (0x40F), 
                    F1CT,   8, 
                    F1MS,   8, 
                    F1FQ,   8, 
                    F1LD,   8, 
                    F1MD,   8, 
                    F1MP,   8, 
                    LT1L,   8, 
                    LT1H,   8, 
                    MT1L,   8, 
                    MT1H,   8, 
                    HT1L,   8, 
                    HT1H,   8, 
                    LRG1,   8, 
                    LHC1,   8, 
                    Offset (0x41F), 
                    F2CT,   8, 
                    F2MS,   8, 
                    F2FQ,   8, 
                    F2LD,   8, 
                    F2MD,   8, 
                    F2MP,   8, 
                    LT2L,   8, 
                    LT2H,   8, 
                    MT2L,   8, 
                    MT2H,   8, 
                    HT2L,   8, 
                    HT2H,   8, 
                    LRG2,   8, 
                    LHC2,   8, 
                    Offset (0x42F), 
                    F3CT,   8, 
                    F3MS,   8, 
                    F3FQ,   8, 
                    F3LD,   8, 
                    F3MD,   8, 
                    F3MP,   8, 
                    LT3L,   8, 
                    LT3H,   8, 
                    MT3L,   8, 
                    MT3H,   8, 
                    HT3L,   8, 
                    HT3H,   8, 
                    LRG3,   8, 
                    LHC3,   8, 
                    Offset (0x5EF), 
                    GGN2,   1, 
                    Offset (0xD06), 
                    MX07,   8, 
                    Offset (0xD0E), 
                    MX15,   8, 
                    MX16,   8, 
                    Offset (0xD14), 
                    MX21,   8, 
                    Offset (0xD1A), 
                    MX27,   8, 
                    Offset (0xD1F), 
                    MX32,   8, 
                    Offset (0xD2B), 
                    MX44,   8, 
                    Offset (0xD3A), 
                    MX59,   8, 
                    Offset (0xD65), 
                    M102,   8, 
                    Offset (0xDAE), 
                    M175,   8, 
                    M176,   8, 
                    Offset (0xDB3), 
                    M180,   8, 
                    Offset (0xDB5), 
                    M182,   8, 
                    Offset (0xE01), 
                    MS02,   8, 
                    MS03,   8, 
                    MS04,   8, 
                    Offset (0xE3F), 
                    MS40,   8, 
                    Offset (0xE80), 
                        ,   2, 
                    ECES,   1
                }

                OperationRegion (P1E0, SystemIO, P1EB, 0x04)
                Field (P1E0, ByteAcc, NoLock, Preserve)
                {
                        ,   14, 
                    PEWS,   1, 
                    WSTA,   1, 
                        ,   14, 
                    PEWD,   1
                }

                Method (TRMD, 0, NotSerialized)
                {
                    TFTE = Zero
                }

                Method (HTCD, 0, NotSerialized)
                {
                }

                OperationRegion (ABIO, SystemIO, 0x0CD8, 0x08)
                Field (ABIO, DWordAcc, NoLock, Preserve)
                {
                    INAB,   32, 
                    DAAB,   32
                }

                Method (RDAB, 1, NotSerialized)
                {
                    INAB = Arg0
                    Return (DAAB) /* \_SB_.PCI0.SMB_.DAAB */
                }

                Method (WTAB, 2, NotSerialized)
                {
                    INAB = Arg0
                    DAAB = Arg1
                }

                Method (RWAB, 3, NotSerialized)
                {
                    Local0 = (RDAB (Arg0) & Arg1)
                    Local1 = (Local0 | Arg2)
                    WTAB (Arg0, Local1)
                }

                Method (CABR, 3, NotSerialized)
                {
                    Local0 = (Arg0 << 0x05)
                    Local1 = (Local0 + Arg1)
                    Local2 = (Local1 << 0x18)
                    Local3 = (Local2 + Arg2)
                    Return (Local3)
                }
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
                Field (PIRQ, ByteAcc, NoLock, Preserve)
                {
                    PIID,   8, 
                    PIDA,   8
                }

                IndexField (PIID, PIDA, ByteAcc, NoLock, Preserve)
                {
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8, 
                    Offset (0x10), 
                    PIRS,   8, 
                    Offset (0x13), 
                    HDAD,   8, 
                    Offset (0x15), 
                    GEC,    8, 
                    Offset (0x30), 
                    USB1,   8, 
                    USB2,   8, 
                    USB3,   8, 
                    USB4,   8, 
                    USB5,   8, 
                    USB6,   8, 
                    USB7,   8, 
                    Offset (0x40), 
                    IDE,    8, 
                    SATA,   8, 
                    Offset (0x50), 
                    GPP0,   8, 
                    GPP1,   8, 
                    GPP2,   8, 
                    GPP3,   8
                }

                Name (IPRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10,11}
                })
                Name (UPRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Exclusive, )
                        {3,4,5,7}
                })
                Method (DSPI, 0, NotSerialized)
                {
                    INTA (0x1F)
                    INTB (0x1F)
                    INTC (0x1F)
                    INTD (0x1F)
                    PIRE = 0x1F
                    PIRF = 0x1F
                    PIRG = 0x1F
                    PIRH = 0x1F
                }

                Method (INTA, 1, NotSerialized)
                {
                    PIRA = Arg0
                    HDAD = Arg0
                    GEC = Arg0
                    GPP0 = Arg0
                }

                Method (INTB, 1, NotSerialized)
                {
                    PIRB = Arg0
                    USB2 = Arg0
                    USB4 = Arg0
                    USB6 = Arg0
                    GPP1 = Arg0
                    IDE = Arg0
                }

                Method (INTC, 1, NotSerialized)
                {
                    PIRC = Arg0
                    USB1 = Arg0
                    USB3 = Arg0
                    USB5 = Arg0
                    USB7 = Arg0
                    GPP2 = Arg0
                }

                Method (INTD, 1, NotSerialized)
                {
                    PIRD = Arg0
                    SATA = Arg0
                    GPP3 = Arg0
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x01)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRA)
                        {
                            Return (Z007) /* \Z007 */
                        }
                        Else
                        {
                            Return (Z008) /* \Z008 */
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        INTA (0x1F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Local0 = IPRS /* \_SB_.PCI0.LPC0.IPRS */
                        CreateWordField (Local0, 0x01, IRQ0)
                        IRQ0 = (0x01 << PIRA) /* \_SB_.PCI0.LPC0.PIRA */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Local0--
                        INTA (Local0)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRB)
                        {
                            Return (Z007) /* \Z007 */
                        }
                        Else
                        {
                            Return (Z008) /* \Z008 */
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        INTB (0x1F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Local0 = IPRS /* \_SB_.PCI0.LPC0.IPRS */
                        CreateWordField (Local0, 0x01, IRQ0)
                        IRQ0 = (0x01 << PIRB) /* \_SB_.PCI0.LPC0.PIRB */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Local0--
                        INTB (Local0)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x03)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRC)
                        {
                            Return (Z007) /* \Z007 */
                        }
                        Else
                        {
                            Return (Z008) /* \Z008 */
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        INTC (0x1F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Local0 = IPRS /* \_SB_.PCI0.LPC0.IPRS */
                        CreateWordField (Local0, 0x01, IRQ0)
                        IRQ0 = (0x01 << PIRC) /* \_SB_.PCI0.LPC0.PIRC */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Local0--
                        INTC (Local0)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x04)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRD)
                        {
                            Return (Z007) /* \Z007 */
                        }
                        Else
                        {
                            Return (Z008) /* \Z008 */
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        INTD (0x1F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Local0 = IPRS /* \_SB_.PCI0.LPC0.IPRS */
                        CreateWordField (Local0, 0x01, IRQ0)
                        IRQ0 = (0x01 << PIRD) /* \_SB_.PCI0.LPC0.PIRD */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Local0--
                        INTD (Local0)
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x05)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRE)
                        {
                            Return (Z007) /* \Z007 */
                        }
                        Else
                        {
                            Return (Z008) /* \Z008 */
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        PIRE = 0x1F
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Local0 = IPRS /* \_SB_.PCI0.LPC0.IPRS */
                        CreateWordField (Local0, 0x01, IRQ0)
                        IRQ0 = (0x01 << PIRE) /* \_SB_.PCI0.LPC0.PIRE */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Local0--
                        PIRE = Local0
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x06)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRF)
                        {
                            Return (Z007) /* \Z007 */
                        }
                        Else
                        {
                            Return (Z008) /* \Z008 */
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        PIRF = 0x1F
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Local0 = IPRS /* \_SB_.PCI0.LPC0.IPRS */
                        CreateWordField (Local0, 0x01, IRQ0)
                        IRQ0 = (0x01 << PIRF) /* \_SB_.PCI0.LPC0.PIRF */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Local0--
                        PIRF = Local0
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x07)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRG)
                        {
                            Return (Z007) /* \Z007 */
                        }
                        Else
                        {
                            Return (Z008) /* \Z008 */
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        PIRG = 0x1F
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Local0 = IPRS /* \_SB_.PCI0.LPC0.IPRS */
                        CreateWordField (Local0, 0x01, IRQ0)
                        IRQ0 = (0x01 << PIRG) /* \_SB_.PCI0.LPC0.PIRG */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Local0--
                        PIRG = Local0
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x08)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRH)
                        {
                            Return (Z007) /* \Z007 */
                        }
                        Else
                        {
                            Return (Z008) /* \Z008 */
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        PIRH = 0x1F
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Local0 = IPRS /* \_SB_.PCI0.LPC0.IPRS */
                        CreateWordField (Local0, 0x01, IRQ0)
                        IRQ0 = (0x01 << PIRH) /* \_SB_.PCI0.LPC0.PIRH */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Local0--
                        PIRH = Local0
                    }
                }

                OperationRegion (LPCR, PCI_Config, 0x04, 0x42)
                Field (LPCR, ByteAcc, NoLock, Preserve)
                {
                    PCMD,   2, 
                    Offset (0x40), 
                    CMA0,   1, 
                    CMA1,   1, 
                    CMA2,   1, 
                    CMA3,   1, 
                    CMA4,   1, 
                    CMA5,   1, 
                    CMA6,   1, 
                    CMA7,   1, 
                    CMB0,   1, 
                    CMB1,   1, 
                    CMB2,   1, 
                    CMB3,   1, 
                    CMB4,   1, 
                    CMB5,   1, 
                    CMB6,   1, 
                    CMB7,   1
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {13}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (TIME)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {0}
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0220,             // Range Minimum
                            0x0220,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x040B,             // Range Minimum
                            0x040B,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0530,             // Range Minimum
                            0x0530,             // Range Maximum
                            0x08,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD2,             // Range Minimum
                            0x0CD2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD4,             // Range Minimum
                            0x0CD4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD6,             // Range Minimum
                            0x0CD6,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD8,             // Range Minimum
                            0x0CD8,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x8000,             // Range Minimum
                            0x8000,             // Range Maximum
                            0x01,               // Alignment
                            0x60,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFF800000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8100,             // Range Minimum
                            0x81FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic, DenseTranslation)
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8200,             // Range Minimum
                            0x82FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic, DenseTranslation)
                        IO (Decode16,
                            0x0F40,             // Range Minimum
                            0x0F40,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x087F,             // Range Minimum
                            0x087F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                OperationRegion (LPCS, PCI_Config, 0xA0, 0x04)
                Field (LPCS, DWordAcc, NoLock, Preserve)
                {
                    SPBA,   32
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFFE00000,         // Address Base
                            0x00200000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y1C)
                        Memory32Fixed (ReadWrite,
                            0xFEC10000,         // Address Base
                            0x00000020,         // Address Length
                            _Y1D)
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED61000,         // Address Base
                            0x00000400,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED80000,         // Address Base
                            0x00001000,         // Address Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1C._BAS, BARX)  // _BAS: Base Address
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1C._LEN, GALN)  // _LEN: Length
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1D._BAS, MB01)  // _BAS: Base Address
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1D._LEN, ML01)  // _LEN: Length
                        Local0 = SPBA /* \_SB_.PCI0.LPC0.SPBA */
                        MB01 = (Local0 & 0xFFFFFFE0)
                        Local0 = \_SB.PCI0.Z009
                        If (Local0)
                        {
                            GALN = 0x1000
                            BARX = (Local0 & 0xFFFFFFF0)
                        }

                        Return (MSRC) /* \_SB_.PCI0.LPC0.MEM_.MSRC */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }

                Mutex (PSMX, 0x00)
                OperationRegion (SMI0, SystemIO, 0x00000F40, 0x00000002)
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x6FEAED9D, 0x00000120)
                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    BCMD,   8, 
                    DID,    32, 
                    INFO,   1024
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x05), 
                    INF0,   8
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    AccessAs (ByteAcc, 0x00), 
                    Offset (0x05), 
                    INF,    8, 
                    INF1,   8, 
                    INF2,   8
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    AccessAs (ByteAcc, 0x00), 
                    Offset (0x05), 
                    WNVA,   32, 
                    WNVB,   32, 
                    WNVC,   32, 
                    WNVD,   32, 
                    WFLG,   32, 
                    WNVS,   32, 
                    WNVI,   32
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y1E)
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((\_SB.PCI0.SMB.HPET == One))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Mutex (HPSM, 0x00)
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (CRS, \_SB.PCI0.LPC0.HPET._Y1E._BAS, HPT)  // _BAS: Base Address
                        Acquire (HPSM, 0xFFFF)
                        Local0 = \_SB.PCI0.SMB.HIHP
                        \_SB.PCI0.SMB.HIHP = Zero
                        If ((\_SB.PCI0.SMB.HPBS != 0x00))
                        {
                            HPT = \_SB.PCI0.SMB.HPBS
                        }

                        \_SB.PCI0.SMB.HIHP = Local0
                        Release (HPSM)
                        HPT &= 0xFFFFFFC0
                        Return (CRS) /* \_SB_.PCI0.LPC0.HPET.CRS_ */
                    }
                }
            }

            Device (P2P)
            {
                Name (_ADR, 0x00140004)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x04, 
                    0x05
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x08)
                        {
                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x02, 
                                0x00, 
                                0x17
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x03, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                0x00, 
                                0x17
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x08)
                        {
                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKH, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKH, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (SPB0)
            {
                Name (_ADR, 0x00150000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x40)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x22), 
                    PMES,   1, 
                    Offset (0x30), 
                    TGLS,   4
                }

                Method (GPPB, 0, NotSerialized)
                {
                    Local0 = _ADR /* \_SB_.PCI0.SPB0._ADR */
                    Local1 = (Local0 << 0x10)
                    Local1 = (Local0 >> 0x03)
                    Local2 = (Local0 & 0x0F)
                    Return (Local2)
                }

                Method (GHPS, 2, NotSerialized)
                {
                    If ((Arg0 == 0x00))
                    {
                        \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x00)
                        \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x00)
                        Stall (0xC8)
                    }

                    If ((Arg0 == 0x01))
                    {
                        \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x1000)
                        \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x0101)
                        Stall (0xC8)
                    }

                    If (\_SB.PCI0.SMB.GGN2)
                    {
                        If ((Arg0 == 0x00))
                        {
                            GEN2 ()
                            Local2 = GPPB ()
                            Local0 = \_SB.PCI0.SMB.RDAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA5))
                            Local0 &= 0xFF
                            Local1 = 0x01F4
                            While (((Local1 > 0x00) && (Local0 != 0x10)))
                            {
                                Local0 = \_SB.PCI0.SMB.RDAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA5))
                                Local0 &= 0xFF
                                Local1--
                                Stall (0xC8)
                                Stall (0xC8)
                            }

                            If ((Local0 != 0x10))
                            {
                                GEN1 ()
                            }
                        }
                    }
                }

                Method (GEN2, 0, NotSerialized)
                {
                    TGLS = 0x02
                    Local2 = GPPB ()
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA4), 0xFFFFFFFE, 0x01)
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA2), 0xFFFFDFFF, 0x2000)
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xC0), 0xFFFF7FFF, 0x8000)
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA4), 0xDFFFFFFF, 0x20000000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Method (GEN1, 0, NotSerialized)
                {
                    TGLS = 0x01
                    Local2 = GPPB ()
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA4), 0xFFFFFFFE, 0x00)
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA2), 0xFFFFDFFF, 0x2000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB1)
            {
                Name (_ADR, 0x00150001)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x40)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x22), 
                    PMES,   1, 
                    Offset (0x30), 
                    TGLS,   4
                }

                Method (GPPB, 0, NotSerialized)
                {
                    Local0 = _ADR /* \_SB_.PCI0.SPB1._ADR */
                    Local1 = (Local0 << 0x10)
                    Local1 = (Local0 >> 0x03)
                    Local2 = (Local0 & 0x0F)
                    Return (Local2)
                }

                Method (GHPS, 2, NotSerialized)
                {
                    If ((Arg0 == 0x00))
                    {
                        \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x00)
                        \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x00)
                        Stall (0xC8)
                    }

                    If ((Arg0 == 0x01))
                    {
                        \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x1000)
                        \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x0101)
                        Stall (0xC8)
                    }

                    If (\_SB.PCI0.SMB.GGN2)
                    {
                        If ((Arg0 == 0x00))
                        {
                            GEN2 ()
                            Local2 = GPPB ()
                            Local0 = \_SB.PCI0.SMB.RDAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA5))
                            Local0 &= 0xFF
                            Local1 = 0x01F4
                            While (((Local1 > 0x00) && (Local0 != 0x10)))
                            {
                                Local0 = \_SB.PCI0.SMB.RDAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA5))
                                Local0 &= 0xFF
                                Local1--
                                Stall (0xC8)
                                Stall (0xC8)
                            }

                            If ((Local0 != 0x10))
                            {
                                GEN1 ()
                            }
                        }
                    }
                }

                Method (GEN2, 0, NotSerialized)
                {
                    TGLS = 0x02
                    Local2 = GPPB ()
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA4), 0xFFFFFFFE, 0x01)
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA2), 0xFFFFDFFF, 0x2000)
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xC0), 0xFFFF7FFF, 0x8000)
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA4), 0xDFFFFFFF, 0x20000000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Method (GEN1, 0, NotSerialized)
                {
                    TGLS = 0x01
                    Local2 = GPPB ()
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA4), 0xFFFFFFFE, 0x00)
                    \_SB.PCI0.SMB.RWAB (\_SB.PCI0.SMB.CABR (0x03, Local2, 0xA2), 0xFFFFDFFF, 0x2000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB2)
            {
                Name (_ADR, 0x00150002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (SPB3)
            {
                Name (_ADR, 0x00150003)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (AGP)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x02)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }
                        })
                    }
                }

                Name (PXEN, 0x80000000)
                Name (PXID, 0x00020000)
                Name (PXMX, 0x80000000)
                Name (LCDT, 0x80000002)
                Name (DSCT, 0x80000000)
                Device (VGA)
                {
                    Name (_ADR, 0x00050000)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (SWIT, 0x01)
                    Name (CRTC, 0x01)
                    Name (LCDC, 0x01)
                    Name (TV0C, 0x00)
                    Name (HDMC, 0x01)
                    Name (CRTN, 0x01)
                    Name (LCDN, 0x01)
                    Name (TV0N, 0x00)
                    Name (HDMN, 0x01)
                    Method (VDEV, 0, NotSerialized)
                    {
                        GDST ()
                        If ((\VDSS == 0x00))
                        {
                            Local0 = 0x00
                            If ((CRTC == 0x01))
                            {
                                Local0 = 0x02
                            }

                            Local0++
                            If ((Local0 > 0x04))
                            {
                                Local0 = 0x01
                            }

                            If ((Local0 && 0x01))
                            {
                                LCDN = 0x01
                            }

                            If ((Local0 && 0x02))
                            {
                                CRTN = 0x01
                            }

                            If ((Local0 && 0x04))
                            {
                                TV0N = 0x01
                            }
                        }

                        If ((\VDSS == 0x01))
                        {
                            LCDN = 0x01
                            CRTN = 0x00
                            TV0N = 0x00
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x02))
                        {
                            LCDN = 0x00
                            CRTN = 0x01
                            TV0N = 0x00
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x03))
                        {
                            LCDN = 0x01
                            CRTN = 0x01
                            TV0N = 0x00
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x04))
                        {
                            LCDN = 0x00
                            CRTN = 0x00
                            TV0N = 0x01
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x05))
                        {
                            LCDN = 0x01
                            CRTN = 0x00
                            TV0N = 0x01
                            HDMN = 0x00
                        }

                        If ((\VDSS == 0x06))
                        {
                            LCDN = 0x00
                            CRTN = 0x00
                            TV0N = 0x00
                            HDMN = 0x01
                        }

                        If ((\VDSS == 0x07))
                        {
                            LCDN = 0x01
                            CRTN = 0x00
                            TV0N = 0x00
                            HDMN = 0x01
                        }

                        If ((\VDSS == 0x08))
                        {
                            LCDN = 0x00
                            CRTN = 0x01
                            TV0N = 0x00
                            HDMN = 0x01
                        }
                    }

                    Method (GDST, 0, NotSerialized)
                    {
                        CRTC = 0x00
                        LCDC = 0x00
                        TV0C = 0x00
                        HDMC = 0x00
                    }

                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        VDEV ()
                        Local0 = Arg0
                        SWIT = (Local0 & 0x01)
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Name (VGAT, Package (0x04)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        VGAT [0x00] = (0x00010000 | 0x0100)
                        VGAT [0x01] = (0x00010000 | 0x0200)
                        VGAT [0x02] = (0x00010000 | 0x0110)
                        VGAT [0x03] = (0x00010000 | 0x0210)
                        Return (VGAT) /* \_SB_.PCI0.AGP_.VGA_._DOD.VGAT */
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (CRTC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (CRTN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (LCDC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (LCDN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }

                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (\BCLP)
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            Local0 = 0x01
                            Local1 = 0x02
                            While (Local0)
                            {
                                If ((Arg0 == DerefOf (\BCLP [Local1])))
                                {
                                    Local0 = 0x00
                                }
                                Else
                                {
                                    Local1++
                                    If ((0x0B == Local1))
                                    {
                                        Local0 = 0x00
                                    }
                                }
                            }

                            Local1--
                            Local1--
                            If (\_SB.PCI0.LPC0.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPC0.EC0.ACST)
                                {
                                    \_SB.PCI0.LPC0.EC0.BNAC = Local1
                                }
                                Else
                                {
                                    \_SB.PCI0.LPC0.EC0.BNDC = Local1
                                }
                            }
                            Else
                            {
                                \_SB.PCI0.LPC0.EC0.BNAC = Local1
                            }

                            If (\BCVE)
                            {
                                HKEY (0x1C)
                            }
                        }

                        Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
                        {
                            If (\_SB.PCI0.LPC0.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPC0.EC0.ACST)
                                {
                                    Local1 = \_SB.PCI0.LPC0.EC0.BNAC
                                }
                                Else
                                {
                                    Local1 = \_SB.PCI0.LPC0.EC0.BNDC
                                }
                            }
                            Else
                            {
                                Local1 = \_SB.PCI0.LPC0.EC0.BNAC
                            }

                            Local1++
                            Local1++
                            Local0 = DerefOf (\BCLP [Local1])
                            Return (Local0)
                        }
                    }

                    Device (TV0)
                    {
                        Name (_ADR, 0x0200)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (TV0C)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (TV0N)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }
                    }

                    Device (HDMI)
                    {
                        Name (_ADR, 0x0210)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            If (HDMC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (HDMN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }
                    }

                    Name (ATIB, Buffer (0x0100){})
                    Method (ATIF, 2, Serialized)
                    {
                        If ((Arg0 == 0x00))
                        {
                            Return (AF00 ())
                        }

                        If ((Arg0 == 0x01))
                        {
                            Return (AF01 ())
                        }

                        If ((Arg0 == 0x02))
                        {
                            Return (AF02 ())
                        }

                        If ((Arg0 == 0x03))
                        {
                            Return (AF03 (DerefOf (Arg1 [0x02]), DerefOf (Arg1 [0x04])))
                        }

                        If ((Arg0 == 0x0F))
                        {
                            Return (AF15 ())
                        }
                        Else
                        {
                            CreateWordField (ATIB, 0x00, SSZE)
                            CreateWordField (ATIB, 0x02, VERN)
                            CreateDWordField (ATIB, 0x04, NMSK)
                            CreateDWordField (ATIB, 0x08, SFUN)
                            SSZE = 0x00
                            VERN = 0x00
                            NMSK = 0x00
                            SFUN = 0x00
                            Return (ATIB) /* \_SB_.PCI0.AGP_.VGA_.ATIB */
                        }
                    }

                    Method (AF00, 0, NotSerialized)
                    {
                        P80H = 0xF0
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        SSZE = 0x0C
                        VERN = 0x01
                        If ((\_SB.PCI0.AGP.PXEN == 0x80000000))
                        {
                            NMSK = 0x11
                        }
                        Else
                        {
                            NMSK = 0x51
                        }

                        MSKN = NMSK /* \_SB_.PCI0.AGP_.VGA_.AF00.NMSK */
                        SFUN = 0x4007
                        Return (ATIB) /* \_SB_.PCI0.AGP_.VGA_.ATIB */
                    }

                    Name (NCOD, 0x81)
                    Method (AF01, 0, NotSerialized)
                    {
                        P80H = 0xF1
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, VMSK)
                        CreateDWordField (ATIB, 0x06, FLGS)
                        VMSK = 0x03
                        SSZE = 0x0A
                        FLGS = 0x01
                        NCOD = 0x81
                        Return (ATIB) /* \_SB_.PCI0.AGP_.VGA_.ATIB */
                    }

                    Name (PSBR, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                           // ....
                    })
                    Name (MSKN, 0x00)
                    Name (SEXM, 0x00)
                    Name (STHG, 0x00)
                    Name (STHI, 0x00)
                    Name (SFPG, 0x00)
                    Name (SFPI, 0x00)
                    Name (SSPS, 0x00)
                    Name (SSDM, 0x0A)
                    Name (SCDY, 0x00)
                    Name (SACT, Buffer (0x05)
                    {
                         0x01, 0x03, 0x09, 0x02, 0x08                     // .....
                    })
                    Method (AF02, 0, NotSerialized)
                    {
                        P80H = 0xF2
                        CreateBitField (PSBR, 0x00, PDSW)
                        CreateBitField (PSBR, 0x01, PEXM)
                        CreateBitField (PSBR, 0x02, PTHR)
                        CreateBitField (PSBR, 0x03, PFPS)
                        CreateBitField (PSBR, 0x04, PSPS)
                        CreateBitField (PSBR, 0x05, PDCC)
                        CreateBitField (PSBR, 0x06, PXPS)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, PSBI)
                        CreateByteField (ATIB, 0x06, EXPM)
                        CreateByteField (ATIB, 0x07, THRM)
                        CreateByteField (ATIB, 0x08, THID)
                        CreateByteField (ATIB, 0x09, FPWR)
                        CreateByteField (ATIB, 0x0A, FPID)
                        CreateByteField (ATIB, 0x0B, SPWR)
                        SSZE = 0x0C
                        PSBI = PSBR /* \_SB_.PCI0.AGP_.VGA_.PSBR */
                        If (PDSW)
                        {
                            P80H = 0x82
                            PDSW = Zero
                        }

                        If (PEXM)
                        {
                            EXPM = SEXM /* \_SB_.PCI0.AGP_.VGA_.SEXM */
                            SEXM = Zero
                            PEXM = Zero
                        }

                        If (PTHR)
                        {
                            THRM = STHG /* \_SB_.PCI0.AGP_.VGA_.STHG */
                            THID = STHI /* \_SB_.PCI0.AGP_.VGA_.STHI */
                            STHG = Zero
                            STHI = Zero
                            PTHR = Zero
                        }

                        If (PFPS)
                        {
                            FPWR = SFPG /* \_SB_.PCI0.AGP_.VGA_.SFPG */
                            FPWR = SFPI /* \_SB_.PCI0.AGP_.VGA_.SFPI */
                            SFPG = Zero
                            SFPI = Zero
                            PFPS = Zero
                        }

                        If (PSPS)
                        {
                            SPWR = SSPS /* \_SB_.PCI0.AGP_.VGA_.SSPS */
                            PSPS = Zero
                        }

                        If (PXPS)
                        {
                            P80H = 0xA2
                            PXPS = Zero
                        }

                        Return (ATIB) /* \_SB_.PCI0.AGP_.VGA_.ATIB */
                    }

                    Method (AF03, 2, NotSerialized)
                    {
                        P80H = 0xF3
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, SSDP)
                        CreateWordField (ATIB, 0x04, SCDP)
                        SSDP = Arg0
                        SCDP = Arg1
                        Name (NXTD, 0x06)
                        Name (CIDX, 0x06)
                        Local1 = SSDP /* \_SB_.PCI0.AGP_.VGA_.AF03.SSDP */
                        Local1 &= 0x0B
                        Local2 = SCDP /* \_SB_.PCI0.AGP_.VGA_.AF03.SCDP */
                        If (CondRefOf (\_SB.LID0._LID, Local4))
                        {
                            Local2 &= ~0x01
                            Local2 |= \_SB.LID0._LID ()
                        }
                        Else
                        {
                            Local2 |= 0x01
                        }

                        P80H = Local2
                        Local0 = Zero
                        While ((Local0 < SizeOf (SACT)))
                        {
                            Local3 = DerefOf (SACT [Local0])
                            If ((Local3 == Local1))
                            {
                                CIDX = Local0
                                Local0 = SizeOf (SACT)
                            }
                            Else
                            {
                                Local0++
                            }
                        }

                        Local0 = CIDX /* \_SB_.PCI0.AGP_.VGA_.AF03.CIDX */
                        While ((Local0 < SizeOf (SACT)))
                        {
                            Local0++
                            If ((Local0 == SizeOf (SACT)))
                            {
                                Local0 = 0x00
                            }

                            Local3 = DerefOf (SACT [Local0])
                            If (((Local3 & Local2) == Local3))
                            {
                                NXTD = Local0
                                Local0 = SizeOf (SACT)
                            }
                        }

                        If ((NXTD == SizeOf (SACT)))
                        {
                            SSDP = Zero
                        }
                        Else
                        {
                            Local0 = NXTD /* \_SB_.PCI0.AGP_.VGA_.AF03.NXTD */
                            Local3 = DerefOf (SACT [Local0])
                            SSDP &= ~0x0B
                            SSDP |= Local3
                        }

                        SSZE = 0x04
                        P80H = SSDP /* \_SB_.PCI0.AGP_.VGA_.AF03.SSDP */
                        Return (ATIB) /* \_SB_.PCI0.AGP_.VGA_.ATIB */
                    }

                    Method (AFN0, 0, Serialized)
                    {
                        If ((MSKN & 0x01))
                        {
                            CreateBitField (PSBR, 0x00, PDSW)
                            PDSW = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN3, 2, Serialized)
                    {
                        If ((MSKN & 0x08))
                        {
                            Local0 = Arg0
                            SFPI = Local0
                            Local0 = Arg1
                            SFPG = Local0 &= 0x03
                            CreateBitField (PSBR, 0x03, PFPS)
                            PFPS = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN4, 1, Serialized)
                    {
                        If ((MSKN & 0x10))
                        {
                            Local0 = Arg0
                            Local1 = SSPS /* \_SB_.PCI0.AGP_.VGA_.SSPS */
                            SSPS = Local0
                            If ((Local0 == Local1)){}
                            Else
                            {
                                CreateBitField (PSBR, 0x04, PSPS)
                                PSPS = One
                                Notify (VGA, NCOD)
                            }
                        }
                    }

                    Method (AFN5, 0, Serialized)
                    {
                        If ((MSKN & 0x20))
                        {
                            CreateBitField (PSBR, 0x05, PDCC)
                            PDCC = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN6, 0, Serialized)
                    {
                        If ((MSKN & 0x40))
                        {
                            CreateBitField (PSBR, 0x06, PXPS)
                            PXPS = One
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AF15, 0, NotSerialized)
                    {
                        P80H = 0xFF
                        CreateWordField (ATIB, 0x00, DNUM)
                        CreateWordField (ATIB, 0x02, DSZE)
                        DSZE = 0x08
                        Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                        \_SB.PCI0.LPC0.BCMD = 0x8D
                        \_SB.PCI0.LPC0.DID = 0x0F
                        \_SB.PCI0.LPC0.INFO = ATIB /* \_SB_.PCI0.AGP_.VGA_.ATIB */
                        \_SB.PCI0.LPC0.SMIC = Zero
                        ATIB = \_SB.PCI0.LPC0.INFO
                        Release (\_SB.PCI0.LPC0.PSMX)
                        Return (ATIB) /* \_SB_.PCI0.AGP_.VGA_.ATIB */
                    }
                }
            }

            Scope (\_SB.PCI0.AGP.VGA)
            {
                Name (ATPB, Buffer (0x0100){})
                Name (DSID, 0xFFFFFFFF)
                Name (HSID, 0xFFFFFFFF)
                Name (CNT0, Buffer (0x05)
                {
                     0x05, 0x00, 0x00, 0x10, 0x01                     // .....
                })
                Name (CNT1, Buffer (0x05)
                {
                     0x05, 0x01, 0x00, 0x00, 0x01                     // .....
                })
                Name (CNT2, Buffer (0x05)
                {
                     0x07, 0x03, 0x00, 0x10, 0x02                     // .....
                })
                Name (CNT3, Buffer (0x05)
                {
                     0x07, 0x07, 0x00, 0x20, 0x02                     // ... .
                })
                Name (CNT4, Buffer (0x05)
                {
                     0x00, 0x09, 0x00, 0x30, 0x02                     // ...0.
                })
                Name (CNT5, Buffer (0x05)
                {
                     0x05, 0x00, 0x01, 0x10, 0x01                     // .....
                })
                Name (CNT6, Buffer (0x05)
                {
                     0x05, 0x01, 0x01, 0x00, 0x01                     // .....
                })
                Name (CNT7, Buffer (0x05)
                {
                     0x07, 0x03, 0x01, 0x10, 0x02                     // .....
                })
                Name (CNT8, Buffer (0x05)
                {
                     0x07, 0x07, 0x01, 0x20, 0x02                     // ... .
                })
                Name (CNT9, Buffer (0x05)
                {
                     0x00, 0x09, 0x01, 0x30, 0x02                     // ...0.
                })
                Method (ATPX, 2, Serialized)
                {
                    If ((Arg0 == 0x00))
                    {
                        Return (PX00 ())
                    }

                    If ((Arg0 == 0x01))
                    {
                        Return (PX01 ())
                    }

                    If ((Arg0 == 0x02))
                    {
                        Return (PX02 (DerefOf (Arg1 [0x02])))
                    }

                    If ((Arg0 == 0x03))
                    {
                        Return (PX03 (DerefOf (Arg1 [0x02])))
                    }

                    If ((Arg0 == 0x04))
                    {
                        Return (PX04 (DerefOf (Arg1 [0x02])))
                    }

                    If ((Arg0 == 0x08))
                    {
                        Return (PX08 ())
                    }

                    If ((Arg0 == 0x09))
                    {
                        Return (PX09 ())
                    }

                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateWordField (ATPB, 0x02, VERN)
                    CreateDWordField (ATPB, 0x04, SFUN)
                    SSZE = 0x00
                    VERN = 0x00
                    SFUN = 0x00
                    Return (ATPB) /* \_SB_.PCI0.AGP_.VGA_.ATPB */
                }

                Method (PX00, 0, NotSerialized)
                {
                    P80H = 0xE0
                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateWordField (ATPB, 0x02, VERN)
                    CreateDWordField (ATPB, 0x04, SFUN)
                    SSZE = 0x08
                    VERN = 0x01
                    If ((\_SB.PCI0.AGP.PXEN == 0x80000000))
                    {
                        SFUN = 0x00
                        Return (ATPB) /* \_SB_.PCI0.AGP_.VGA_.ATPB */
                    }

                    If ((\_SB.PCI0.AGP.PXMX == 0x80000000))
                    {
                        SFUN = 0x018F
                    }
                    Else
                    {
                        SFUN = 0x0182
                    }

                    If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                    {
                        Local0 = \_SB.PCI0.PB3.VGA.SVID
                        Local1 = \_SB.PCI0.PB3.HDAU.SVID
                    }
                    Else
                    {
                        Local0 = \_SB.PCI0.PB2.VGA.SVID
                        Local1 = \_SB.PCI0.PB2.HDAU.SVID
                    }

                    If ((Local0 != 0xFFFFFFFF))
                    {
                        \_SB.PCI0.AGP.VGA.DSID = Local0
                    }

                    If ((Local1 != 0xFFFFFFFF))
                    {
                        \_SB.PCI0.AGP.VGA.HSID = Local1
                    }

                    Return (ATPB) /* \_SB_.PCI0.AGP_.VGA_.ATPB */
                }

                Method (PX01, 0, NotSerialized)
                {
                    P80H = 0xE1
                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateDWordField (ATPB, 0x02, VMSK)
                    CreateDWordField (ATPB, 0x06, FLGS)
                    SSZE = 0x0A
                    VMSK = 0x7F
                    FLGS = 0x4B
                    Return (ATPB) /* \_SB_.PCI0.AGP_.VGA_.ATPB */
                }

                Method (PX02, 1, NotSerialized)
                {
                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateByteField (ATPB, 0x02, PWST)
                    SSZE = 0x03
                    PWST = (Arg0 & 0x01)
                    Name (HPOK, 0x00)
                    If (PWST)
                    {
                        P80H = 0x11E2
                        \_SB.PCI0.SMB.G45O = One
                        \_SB.PCI0.SMB.G45E = Zero
                        Sleep (0x0A)
                        \_SB.PCI0.SMB.G55O = One
                        \_SB.PCI0.SMB.G55E = Zero
                        Sleep (0x64)
                        \_SB.PCI0.SMB.MX32 = One
                        While ((\_SB.PCI0.SMB.G32I == 0x00)){}
                        \_SB.PCI0.SMB.G35O = One
                        \_SB.PCI0.SMB.G35E = Zero
                        P80H = 0x12E2
                        HPOK = 0x00
                        Sleep (0x64)
                        Sleep (0x64)
                        If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                        {
                            \_SB.PCI0.XPTR (0x03, 0x01)
                        }
                        Else
                        {
                            \_SB.PCI0.XPTR (0x02, 0x01)
                        }

                        Sleep (0x14)
                        Local2 = 0x00
                        While ((Local2 < 0x0F))
                        {
                            If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                            {
                                \_SB.PCI0.PB3.PSDC = One
                            }
                            Else
                            {
                                \_SB.PCI0.PB2.PSDC = One
                            }

                            Local4 = 0x01
                            Local5 = 0xC8
                            While ((Local4 && Local5))
                            {
                                If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                                {
                                    Local6 = \_SB.PCI0.PB3.XPRD (0xA5)
                                }
                                Else
                                {
                                    Local6 = \_SB.PCI0.PB2.XPRD (0xA5)
                                }

                                Local6 &= 0x7F
                                If (((Local6 >= 0x10) && (Local6 != 0x7F)))
                                {
                                    Local4 = 0x00
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Local5--
                                }
                            }

                            If (!Local4)
                            {
                                If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                                {
                                    Local5 = \_SB.PCI0.PB3.XPDL ()
                                }
                                Else
                                {
                                    Local5 = \_SB.PCI0.PB2.XPDL ()
                                }

                                If (Local5)
                                {
                                    If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                                    {
                                        \_SB.PCI0.PB3.XPRT ()
                                    }
                                    Else
                                    {
                                        \_SB.PCI0.PB2.XPRT ()
                                    }

                                    Sleep (0x05)
                                    Local2++
                                }
                                Else
                                {
                                    If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                                    {
                                        \_SB.PCI0.LPC0.INFO = 0x18
                                    }
                                    Else
                                    {
                                        \_SB.PCI0.LPC0.INFO = 0x10
                                    }

                                    \_SB.PCI0.LPC0.BCMD = 0x87
                                    \_SB.PCI0.LPC0.SMIC = Zero
                                    Local0 = 0x00
                                    If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                                    {
                                        If ((\_SB.PCI0.PB3.XPR2 () == Ones))
                                        {
                                            Local0 = 0x01
                                        }
                                    }
                                    ElseIf ((\_SB.PCI0.PB2.XPR2 () == Ones))
                                    {
                                        Local0 = 0x01
                                    }

                                    If (Local0)
                                    {
                                        HPOK = 0x01
                                        Local2 = 0x10
                                    }
                                    Else
                                    {
                                        HPOK = 0x00
                                        Local2 = 0x10
                                    }
                                }
                            }
                            Else
                            {
                                Local2 = 0x10
                            }
                        }

                        If (!HPOK)
                        {
                            P80H = 0x13E2
                            If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                            {
                                Local7 = \_SB.PCI0.PB3.VGA.DVID
                            }
                            Else
                            {
                                Local7 = \_SB.PCI0.PB2.VGA.DVID
                            }

                            Sleep (0x0A)
                            Local4 = 0x01
                            Local5 = 0x05
                            While ((Local4 && Local5))
                            {
                                If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                                {
                                    Local6 = \_SB.PCI0.PB3.XPRD (0xA5)
                                }
                                Else
                                {
                                    Local6 = \_SB.PCI0.PB2.XPRD (0xA5)
                                }

                                Local6 &= 0x7F
                                If ((Local6 <= 0x04))
                                {
                                    Local4 = 0x00
                                }
                                Else
                                {
                                    If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                                    {
                                        Local7 = \_SB.PCI0.PB3.VGA.DVID
                                    }
                                    Else
                                    {
                                        Local7 = \_SB.PCI0.PB2.VGA.DVID
                                    }

                                    Sleep (0x05)
                                    Local5--
                                }
                            }

                            If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                            {
                                \_SB.PCI0.XPTR (0x03, 0x00)
                            }
                            Else
                            {
                                \_SB.PCI0.XPTR (0x02, 0x00)
                            }
                        }

                        P80H = 0x14E2
                    }
                    Else
                    {
                        P80H = 0x02E2
                        If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                        {
                            \_SB.PCI0.LPC0.INFO = 0x18
                        }
                        Else
                        {
                            \_SB.PCI0.LPC0.INFO = 0x10
                        }

                        \_SB.PCI0.LPC0.BCMD = 0x84
                        \_SB.PCI0.LPC0.SMIC = Zero
                        \_SB.PCI0.SMB.G35O = Zero
                        \_SB.PCI0.SMB.G35E = Zero
                        \_SB.PCI0.SMB.G55O = Zero
                        \_SB.PCI0.SMB.G55E = Zero
                        Sleep (0x0A)
                        \_SB.PCI0.SMB.G45O = Zero
                        \_SB.PCI0.SMB.G45E = Zero
                        P80H = 0x03E2
                        If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                        {
                            \_SB.PCI0.PB3.PSDC = One
                            Local7 = \_SB.PCI0.PB3.VGA.DVID
                        }
                        Else
                        {
                            \_SB.PCI0.PB2.PSDC = One
                            Local7 = \_SB.PCI0.PB2.VGA.DVID
                        }

                        Sleep (0x0A)
                        Local4 = 0x01
                        Local5 = 0x05
                        While ((Local4 && Local5))
                        {
                            If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                            {
                                Local6 = \_SB.PCI0.PB3.XPRD (0xA5)
                            }
                            Else
                            {
                                Local6 = \_SB.PCI0.PB2.XPRD (0xA5)
                            }

                            Local6 &= 0x7F
                            If ((Local6 <= 0x04))
                            {
                                Local4 = 0x00
                            }
                            Else
                            {
                                If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                                {
                                    Local7 = \_SB.PCI0.PB3.VGA.DVID
                                }
                                Else
                                {
                                    Local7 = \_SB.PCI0.PB2.VGA.DVID
                                }

                                Sleep (0x05)
                                Local5--
                            }
                        }

                        If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                        {
                            \_SB.PCI0.XPTR (0x03, 0x00)
                        }
                        Else
                        {
                            \_SB.PCI0.XPTR (0x02, 0x00)
                        }

                        HPOK = 0x02
                        P80H = 0x04E2
                    }

                    If (HPOK)
                    {
                        If (((HPOK == 0x01) && (\_SB.PCI0.AGP.VGA.DSID != 0xFFFFFFFF)))
                        {
                            If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                            {
                                Local7 = \_SB.PCI0.AGP.VGA.DSID
                                \_SB.PCI0.PB3.VGA.SMID = Local7
                                Sleep (0x0A)
                                Local7 = \_SB.PCI0.AGP.VGA.HSID
                                If ((Local7 != 0xFFFFFFFF))
                                {
                                    \_SB.PCI0.PB3.HDAU.SMID = Local7
                                }
                            }
                            Else
                            {
                                Local7 = \_SB.PCI0.AGP.VGA.DSID
                                \_SB.PCI0.PB2.VGA.SMID = Local7
                                Sleep (0x0A)
                                Local7 = \_SB.PCI0.AGP.VGA.HSID
                                If ((Local7 != 0xFFFFFFFF))
                                {
                                    \_SB.PCI0.PB2.HDAU.SMID = Local7
                                }
                            }

                            Sleep (0x0A)
                        }

                        If ((\_SB.PCI0.AGP.PXID == \_SB.PCI0.PB3._ADR))
                        {
                            Notify (\_SB.PCI0.PB3, 0x00) // Bus Check
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.PB2, 0x00) // Bus Check
                        }
                    }
                }

                Method (PX03, 1, NotSerialized)
                {
                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateWordField (ATPB, 0x02, DPSW)
                    SSZE = 0x04
                    DPSW = (Arg0 & 0x01)
                    If (DPSW)
                    {
                        P80H = 0x02E3
                        \_SB.PCI0.SMB.G06O = 0x01
                        \_SB.PCI0.SMB.G06E = 0x00
                    }
                    Else
                    {
                        P80H = 0x01E3
                        \_SB.PCI0.SMB.G06O = 0x00
                        \_SB.PCI0.SMB.G06E = 0x00
                    }
                }

                Method (PX04, 1, NotSerialized)
                {
                    P80H = 0xE4
                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateWordField (ATPB, 0x02, ICSW)
                    SSZE = 0x04
                    ICSW = (Arg0 & 0x01)
                    If (ICSW)
                    {
                        P80H = 0x02E4
                        \_SB.PCI0.SMB.G20O = 0x01
                        \_SB.PCI0.SMB.G20E = 0x00
                    }
                    Else
                    {
                        P80H = 0x01E4
                        \_SB.PCI0.SMB.G20O = 0x00
                        \_SB.PCI0.SMB.G20E = 0x00
                    }
                }

                Method (PX08, 0, NotSerialized)
                {
                    P80H = 0xE8
                    CreateWordField (ATPB, 0x00, CNUM)
                    CreateWordField (ATPB, 0x02, CSSZ)
                    CNUM = 0x0A
                    CSSZ = 0x05
                    CreateField (ATPB, 0x20, 0x28, CTI0)
                    CTI0 = CNT0 /* \_SB_.PCI0.AGP_.VGA_.CNT0 */
                    CreateField (ATPB, 0x48, 0x28, CTI1)
                    CTI1 = CNT1 /* \_SB_.PCI0.AGP_.VGA_.CNT1 */
                    CreateField (ATPB, 0x70, 0x28, CTI2)
                    CreateByteField (CNT2, 0x00, FLG2)
                    If ((\_SB.PCI0.AGP.LCDT == 0x80000001))
                    {
                        If ((\_SB.PCI0.AGP.DSCT == 0x80000001))
                        {
                            FLG2 = 0x00
                        }

                        If ((\_SB.PCI0.AGP.DSCT == 0x80000002))
                        {
                            FLG2 = 0x07
                        }
                    }

                    CTI2 = CNT2 /* \_SB_.PCI0.AGP_.VGA_.CNT2 */
                    CreateField (ATPB, 0x98, 0x28, CTI3)
                    CreateByteField (CNT3, 0x00, FLG3)
                    If ((\_SB.PCI0.AGP.LCDT == 0x80000000))
                    {
                        FLG3 = 0x07
                    }

                    If ((\_SB.PCI0.AGP.LCDT == 0x80000001))
                    {
                        FLG3 = 0x00
                        If ((\_SB.PCI0.AGP.DSCT == 0x80000002))
                        {
                            FLG3 = 0x00
                        }
                    }

                    If ((\_SB.PCI0.AGP.LCDT == 0x80000002))
                    {
                        FLG3 = 0x00
                        If ((\_SB.PCI0.AGP.DSCT == 0x80000002))
                        {
                            FLG3 = 0x07
                        }
                    }

                    CTI3 = CNT3 /* \_SB_.PCI0.AGP_.VGA_.CNT3 */
                    CreateField (ATPB, 0xC0, 0x28, CTI4)
                    CTI4 = CNT4 /* \_SB_.PCI0.AGP_.VGA_.CNT4 */
                    CreateField (ATPB, 0xE8, 0x28, CTI5)
                    CTI5 = CNT5 /* \_SB_.PCI0.AGP_.VGA_.CNT5 */
                    CreateField (ATPB, 0x0110, 0x28, CTI6)
                    CTI6 = CNT6 /* \_SB_.PCI0.AGP_.VGA_.CNT6 */
                    CreateField (ATPB, 0x0138, 0x28, CTI7)
                    CreateByteField (CNT7, 0x00, FLG7)
                    If ((\_SB.PCI0.AGP.LCDT == 0x80000001))
                    {
                        If ((\_SB.PCI0.AGP.DSCT == 0x80000001))
                        {
                            FLG7 = 0x00
                        }

                        If ((\_SB.PCI0.AGP.DSCT == 0x80000002))
                        {
                            FLG7 = 0x07
                        }
                    }

                    CTI7 = CNT7 /* \_SB_.PCI0.AGP_.VGA_.CNT7 */
                    CreateField (ATPB, 0x0160, 0x28, CTI8)
                    CreateByteField (CNT8, 0x00, FLG8)
                    If ((\_SB.PCI0.AGP.LCDT == 0x80000000))
                    {
                        FLG8 = 0x07
                    }

                    If ((\_SB.PCI0.AGP.LCDT == 0x80000001))
                    {
                        FLG8 = 0x00
                    }

                    If ((\_SB.PCI0.AGP.LCDT == 0x80000002))
                    {
                        FLG8 = 0x00
                    }

                    If ((\_SB.PCI0.AGP.DSCT == 0x80000002))
                    {
                        FLG8 = 0x07
                    }

                    CTI8 = CNT8 /* \_SB_.PCI0.AGP_.VGA_.CNT8 */
                    CreateField (ATPB, 0x0188, 0x28, CTI9)
                    CreateByteField (CNT9, 0x00, FLG9)
                    If ((\_SB.PCI0.AGP.DSCT == 0x80000002))
                    {
                        FLG9 = 0x07
                    }

                    CTI9 = CNT9 /* \_SB_.PCI0.AGP_.VGA_.CNT9 */
                    Return (ATPB) /* \_SB_.PCI0.AGP_.VGA_.ATPB */
                }

                Method (PX09, 0, NotSerialized)
                {
                    P80H = 0xE9
                    CreateWordField (ATPB, 0x00, CNUM)
                    CreateWordField (ATPB, 0x02, CSSZ)
                    CNUM = 0x00
                    CSSZ = 0x00
                    CreateByteField (ATPB, 0x04, ATI0)
                    CreateByteField (ATPB, 0x05, HPD0)
                    CreateByteField (ATPB, 0x06, DDC0)
                    ATI0 = 0x00
                    HPD0 = 0x00
                    DDC0 = 0x00
                    CreateByteField (ATPB, 0x07, ATI1)
                    CreateByteField (ATPB, 0x08, HPD1)
                    CreateByteField (ATPB, 0x09, DDC1)
                    ATI1 = 0x00
                    HPD1 = 0x00
                    DDC1 = 0x00
                    Return (ATPB) /* \_SB_.PCI0.AGP_.VGA_.ATPB */
                }
            }

            Scope (\_SB.PCI0.AGP.VGA)
            {
                OperationRegion (REVD, SystemMemory, 0x6FEAEEBD, 0x00000008)
                Field (REVD, AnyAcc, NoLock, Preserve)
                {
                    SROM,   32, 
                    VROM,   32
                }

                Name (TVGA, Buffer (0x0004)
                {
                     0x00                                             // .
                })
                Method (XTRM, 2, Serialized)
                {
                    Local0 = (Arg0 + Arg1)
                    If ((Local0 <= SROM))
                    {
                        Local1 = (Arg1 * 0x08)
                        Local2 = (Arg0 * 0x08)
                        TVGA = VROM /* \_SB_.PCI0.AGP_.VGA_.VROM */
                        CreateField (TVGA, Local2, Local1, TEMP)
                        Name (RETB, Buffer (Arg1){})
                        RETB = TEMP /* \_SB_.PCI0.AGP_.VGA_.XTRM.TEMP */
                        Return (RETB) /* \_SB_.PCI0.AGP_.VGA_.XTRM.RETB */
                    }
                    ElseIf ((Arg0 < SROM))
                    {
                        Local3 = (SROM - Arg0)
                        Local1 = (Local3 * 0x08)
                        Local2 = (Arg0 * 0x08)
                        TVGA = VROM /* \_SB_.PCI0.AGP_.VGA_.VROM */
                        CreateField (TVGA, Local2, Local1, TEM)
                        Name (RETC, Buffer (Local3){})
                        RETC = TEM /* \_SB_.PCI0.AGP_.VGA_.XTRM.TEM_ */
                        Return (RETC) /* \_SB_.PCI0.AGP_.VGA_.XTRM.RETC */
                    }
                    Else
                    {
                        Name (RETD, Buffer (0x01){})
                        Return (RETD) /* \_SB_.PCI0.AGP_.VGA_.XTRM.RETD */
                    }
                }
            }
        }
    }

    Scope (\)
    {
        Name (HPDT, Package (0x09)
        {
            "LEGACYHP", 
            0x6FEADD3C, 
            0x00000024, 
            "NATIVEHP", 
            0x6FEADD60, 
            0x00000024, 
            "THERMALX", 
            0x80000000, 
            0x80000000
        })
        Name (DDB0, 0x00)
        Name (DDB1, 0x00)
        Name (DDB2, 0x00)
    }

    Scope (\_GPE)
    {
        Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.PB2, 0x02) // Device Wake
            Notify (\_SB.PCI0.PB3, 0x02) // Device Wake
            Notify (\_SB.PCI0.PB4, 0x02) // Device Wake
            Notify (\_SB.PCI0.PB5, 0x02) // Device Wake
            Notify (\_SB.PCI0.PB6, 0x02) // Device Wake
            Notify (\_SB.PCI0.PB7, 0x02) // Device Wake
            Notify (\_SB.PCI0.PB9, 0x02) // Device Wake
            Notify (\_SB.PCI0.PB10, 0x02) // Device Wake
            Notify (\_SB.PCI0.SPB0, 0x02) // Device Wake
            Notify (\_SB.PCI0.SPB1, 0x02) // Device Wake
            Notify (\_SB.PCI0.SPB2, 0x02) // Device Wake
            Notify (\_SB.PCI0.SPB3, 0x02) // Device Wake
        }

        Method (_L18, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.OHC1, 0x02) // Device Wake
            Notify (\_SB.PCI0.OHC2, 0x02) // Device Wake
            Notify (\_SB.PCI0.OHC3, 0x02) // Device Wake
            Notify (\_SB.PCI0.OHC4, 0x02) // Device Wake
            Notify (\_SB.PCI0.EHC1, 0x02) // Device Wake
            Notify (\_SB.PCI0.EHC2, 0x02) // Device Wake
            Notify (\_SB.PCI0.EHC3, 0x02) // Device Wake
        }
    }

    Scope (\_SB.PCI0.SMB)
    {
        Mutex (SBX0, 0x00)
        OperationRegion (SMB0, SystemIO, 0x8040, 0x10)
        Field (SMB0, ByteAcc, NoLock, Preserve)
        {
            HST0,   8, 
            SLV0,   8, 
            CNT0,   8, 
            CMD0,   8, 
            ADD0,   8, 
            DT00,   8, 
            DT10,   8, 
            BLK0,   8
        }

        Method (WBD0, 1, NotSerialized)
        {
            Local0 = Arg0
            Local2 = 0x00
            Local3 = HST0 /* \_SB_.PCI0.SMB_.HST0 */
            Local1 = (Local3 & 0x80)
            While ((Local1 != 0x80))
            {
                If ((Local0 < 0x0A))
                {
                    Local2 = 0x18
                    Local1 = 0x00
                }
                Else
                {
                    Sleep (0x0A)
                    Local0 -= 0x0A
                    Local3 = HST0 /* \_SB_.PCI0.SMB_.HST0 */
                    Local1 = (Local3 & 0x80)
                }
            }

            If ((Local2 != 0x18))
            {
                Local1 = (HST0 & 0x1C)
                If (Local1)
                {
                    Local2 = 0x07
                }
            }

            Return (Local2)
        }

        Method (WTC0, 1, NotSerialized)
        {
            Local0 = Arg0
            Local2 = 0x07
            Local1 = 0x01
            While ((Local1 == 0x01))
            {
                Local3 = (HST0 & 0x1D)
                If ((Local3 != 0x00))
                {
                    If ((Local3 == 0x01))
                    {
                        If ((Local0 < 0x0A))
                        {
                            Local2 = 0x18
                            Local1 = 0x00
                        }
                        Else
                        {
                            Sleep (0x0A)
                            Local0 -= 0x0A
                        }
                    }
                    Else
                    {
                        Local2 = 0x07
                        Local1 = 0x00
                    }
                }
                Else
                {
                    Local2 = 0x00
                    Local1 = 0x00
                }
            }

            HST0 = (HST0 | 0x1F)
            Return (Local2)
        }

        Method (SBR0, 3, NotSerialized)
        {
            Local0 = Package (0x22)
                {
                    0x07, 
                    0x00, 
                    0x00
                }
            Local4 = (Arg0 & 0x5F)
            If ((Local4 != 0x03))
            {
                If ((Local4 != 0x05))
                {
                    If ((Local4 != 0x07))
                    {
                        If ((Local4 != 0x09))
                        {
                            If ((Local4 != 0x0B))
                            {
                                Local0 [0x00] = 0x19
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            If ((Acquire (SBX0, 0xFFFF) == 0x00))
            {
                ADD0 = ((Arg1 << 0x01) | 0x01)
                CMD0 = Arg2
                HST0 = (HST0 | 0x1F)
                Local1 = (Arg0 & 0xA0)
                CNT0 = ((CNT0 & 0x5F) | Local1)
                If ((Local4 == 0x03))
                {
                    CNT0 = ((CNT0 & 0xA0) | 0x40)
                }

                If ((Local4 == 0x05))
                {
                    CNT0 = ((CNT0 & 0xA0) | 0x44)
                }

                If ((Local4 == 0x07))
                {
                    CNT0 = ((CNT0 & 0xA0) | 0x48)
                }

                If ((Local4 == 0x09))
                {
                    CNT0 = ((CNT0 & 0xA0) | 0x4C)
                }

                If ((Local4 == 0x0B))
                {
                    HST0 = (HST0 | 0x80)
                    DT00 = 0x00
                    CNT0 = ((CNT0 & 0xA0) | 0x54)
                }

                Local1 = WTC0 (0x03E8)
                Local0 [0x00] = Local1
                If ((Local1 == 0x00))
                {
                    If ((Local4 == 0x05))
                    {
                        Local0 [0x01] = 0x01
                        Local0 [0x02] = DT00 /* \_SB_.PCI0.SMB_.DT00 */
                    }

                    If ((Local4 == 0x07))
                    {
                        Local0 [0x01] = 0x01
                        Local0 [0x02] = DT00 /* \_SB_.PCI0.SMB_.DT00 */
                    }

                    If ((Local4 == 0x09))
                    {
                        Local0 [0x01] = 0x02
                        Local2 = DT10 /* \_SB_.PCI0.SMB_.DT10 */
                        Local2 <<= 0x08
                        Local2 += DT00 /* \_SB_.PCI0.SMB_.DT00 */
                        Local0 [0x02] = Local2
                    }

                    If ((Local4 == 0x0B))
                    {
                        Local1 = WBD0 (0x01F4)
                        If ((Local1 != 0x00))
                        {
                            Local0 [0x00] = Local1
                        }
                        Else
                        {
                            Local0 [0x01] = DT00 /* \_SB_.PCI0.SMB_.DT00 */
                            Local1 = DT00 /* \_SB_.PCI0.SMB_.DT00 */
                            Local2 = CNT0 /* \_SB_.PCI0.SMB_.CNT0 */
                            Local2 = 0x00
                            While ((Local2 < Local1))
                            {
                                Local3 = (0x02 + Local2)
                                Local0 [Local3] = BLK0 /* \_SB_.PCI0.SMB_.BLK0 */
                                Local2 += 0x01
                            }

                            HST0 = (HST0 | 0x80)
                        }
                    }
                }

                CNT0 = (CNT0 & 0x5F)
                Release (SBX0)
            }

            Return (Local0)
        }

        Method (SBW0, 5, NotSerialized)
        {
            Local0 = Package (0x01)
                {
                    0x07
                }
            Local4 = (Arg0 & 0x5F)
            If ((Local4 != 0x02))
            {
                If ((Local4 != 0x04))
                {
                    If ((Local4 != 0x06))
                    {
                        If ((Local4 != 0x08))
                        {
                            If ((Local4 != 0x0A))
                            {
                                Local0 [0x00] = 0x19
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            If ((Acquire (SBX0, 0xFFFF) == 0x00))
            {
                ADD0 = (Arg1 << 0x01)
                CMD0 = Arg2
                HST0 = (HST0 | 0x1F)
                Local1 = (Arg0 & 0xA0)
                CNT0 = ((CNT0 & 0x5F) | Local1)
                If ((Local4 == 0x02))
                {
                    CNT0 = ((CNT0 & 0xA0) | 0x40)
                }

                If ((Local4 == 0x04))
                {
                    CNT0 = ((CNT0 & 0xA0) | 0x44)
                }

                If ((Local4 == 0x06))
                {
                    DT00 = Arg4
                    CNT0 = ((CNT0 & 0xA0) | 0x48)
                }

                If ((Local4 == 0x08))
                {
                    DT00 = (Arg4 & 0xFF)
                    DT10 = (Arg4 >> 0x08)
                    CNT0 = ((CNT0 & 0xA0) | 0x4C)
                }

                If ((Local4 == 0x0A))
                {
                    HST0 = (HST0 | 0x80)
                    Local1 = CNT0 /* \_SB_.PCI0.SMB_.CNT0 */
                    DT00 = Arg3
                    Local2 = 0x00
                    While ((Local2 < Arg3))
                    {
                        BLK0 = Arg4 [Local2]
                        Local2 += 0x01
                    }

                    CNT0 = ((CNT0 & 0xA0) | 0x54)
                }

                Local0 [0x00] = WTC0 (0x03E8)
                CNT0 = (CNT0 & 0x5F)
                Release (SBX0)
            }

            Return (Local0)
        }
    }

    Scope (\)
    {
        OperationRegion (GNVS, SystemMemory, 0x6FEAEF34, 0x0040)
        Field (GNVS, AnyAcc, NoLock, Preserve)
        {
            TCNT,   8, 
            PSMV,   8, 
            PWMF,   8, 
            SKUT,   8
        }
    }

    Scope (\)
    {
        Mutex (MSMI, 0x07)
        Method (PHSR, 2, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            \_SB.PCI0.LPC0.INF = Arg1
            \_SB.PCI0.LPC0.BCMD = Arg0
            \_SB.PCI0.LPC0.SMIC = Zero
            Local0 = \_SB.PCI0.LPC0.INF
            Release (MSMI)
            Return (Local0)
        }

        Method (LPSR, 2, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            \_SB.PCI0.LPC0.INF = Arg1
            \_SB.PCI0.LPC0.BCMD = Arg0
            \_SB.PCI0.LPC0.SMIC = Zero
            Local0 = \_SB.PCI0.LPC0.INF
            Release (MSMI)
            Return (Local0)
        }

        Method (WSMI, 1, NotSerialized)
        {
            \_SB.PCI0.LPC0.BCMD = Arg0
            \_SB.PCI0.LPC0.SMIC = Zero
        }

        Method (HKEY, 1, NotSerialized)
        {
            PHSR (0x94, Arg0)
        }

        Method (LAMN, 1, NotSerialized)
        {
            If (\_SB.AMW0.WLMP)
            {
                \_SB.AMW0.WLID = Arg0
                Notify (\_SB.AMW0, 0xB0) // Device-Specific
            }
            Else
            {
                PHSR (0x93, Arg0)
            }
        }

        Method (RBEC, 1, NotSerialized)
        {
            Return (PHSR (0x90, Arg0))
        }

        Method (WBEC, 2, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            \_SB.PCI0.LPC0.INF1 = Arg1
            \_SB.PCI0.LPC0.INF = Arg0
            \_SB.PCI0.LPC0.BCMD = 0x91
            \_SB.PCI0.LPC0.SMIC = Zero
            Release (MSMI)
        }

        Method (MBEC, 3, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            \_SB.PCI0.LPC0.INF2 = Arg2
            \_SB.PCI0.LPC0.INF1 = Arg1
            \_SB.PCI0.LPC0.INF = Arg0
            \_SB.PCI0.LPC0.BCMD = 0x92
            \_SB.PCI0.LPC0.SMIC = Zero
            Release (MSMI)
        }
    }

    Scope (\)
    {
        Name (BCEN, 0x01)
        Name (BCVE, 0x00)
        Name (SGEN, 0x00)
        Name (PSBN, 0x00)
        Name (\ECON, 0x00)
        Name (\VDSS, 0x00)
        Name (\DSEN, 0x00)
        Name (\CADL, 0x00)
        Name (\PADL, 0x00)
    }

    Scope (\_TZ)
    {
        Name (TBSE, 0x0AAC)
        Name (CRT0, 0x00)
        Name (PSV0, 0x00)
        ThermalZone (TZS0)
        {
            Method (_TMP, 0, NotSerialized)  // _TMP: Temperature
            {
                If (\ECON)
                {
                    Local0 = \_SB.PCI0.LPC0.EC0.THS0
                    Local1 = \_SB.PCI0.LPC0.EC0.KCSS
                    Local2 = \_SB.PCI0.LPC0.EC0.KOSD
                }
                Else
                {
                    Local0 = RBEC (0x92)
                    Local1 = (Local0 & 0x01)
                    Local2 = (Local0 & 0x08)
                    Local0 = RBEC (0xA8)
                }

                If (Local2)
                {
                    If ((Local0 <= CRT0))
                    {
                        Local0 = (CRT0 + 0x02)
                    }
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                If (\ECON)
                {
                    \_SB.PCI0.LPC0.EC0.TIID = 0x20
                    Local0 = \_SB.PCI0.LPC0.EC0.TSC0
                }
                Else
                {
                    WBEC (0x01, 0x20)
                    Local0 = RBEC (0xD1)
                }

                If (((Local0 >= 0x80) || (Local0 < 0x1E)))
                {
                    Local0 = 0x78
                }

                CRT0 = Local0
                Return (C2K (Local0))
            }

            Method (_SCP, 1, Serialized)  // _SCP: Set Cooling Policy
            {
                If (\ECON)
                {
                    \_SB.PCI0.LPC0.EC0.SCPM = Arg0
                }
                Else
                {
                    MBEC (0x90, 0xFE, Arg0)
                }
            }
        }

        ThermalZone (TZS1)
        {
            Method (_TMP, 0, NotSerialized)  // _TMP: Temperature
            {
                If (\ECON)
                {
                    Local0 = \_SB.PCI0.LPC0.EC0.THS1
                }
                Else
                {
                    Local0 = RBEC (0xA9)
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                If (\ECON)
                {
                    \_SB.PCI0.LPC0.EC0.TIID = 0x20
                    Local0 = \_SB.PCI0.LPC0.EC0.TSC1
                }
                Else
                {
                    WBEC (0x01, 0x20)
                    Local0 = RBEC (0xD3)
                }

                If (((Local0 >= 0x80) || (Local0 < 0x1E)))
                {
                    Local0 = 0x78
                }

                Return (C2K (Local0))
            }
        }

        Method (C2K, 1, NotSerialized)
        {
            Local0 = Arg0
            If ((Local0 <= 0x10))
            {
                Local0 = 0x1E
            }

            If ((Local0 >= 0x7F))
            {
                Local0 = 0x1E
            }

            Local0 = ((Local0 * 0x0A) + TBSE) /* \_TZ_.TBSE */
            Return (Local0)
        }
    }

    Scope (\_SB)
    {
        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                If (\ECON)
                {
                    Local0 = \_SB.PCI0.LPC0.EC0.KLID
                }
                Else
                {
                    Local0 = (\RBEC (0x70) & 0x02)
                }

                If (Local0)
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                If (\ECON)
                {
                    \_SB.PCI0.LPC0.EC0.LIDW = Arg0
                }
                ElseIf (Arg0)
                {
                    \MBEC (0x72, 0xEF, 0x10)
                }
                Else
                {
                    \MBEC (0x72, 0xEF, 0x00)
                }
            }

            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x06, 
                0x03
            })
        }
    }

    Scope (\_SB)
    {
        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x06, 
                0x03
            })
        }
    }

    Scope (\_SB.PCI0.LPC0)
    {
        Device (EC0)
        {
            Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
            Name (_GPE, 0x03)  // _GPE: General Purpose Events
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0062,             // Range Minimum
                    0x0062,             // Range Maximum
                    0x00,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0066,             // Range Minimum
                    0x0066,             // Range Maximum
                    0x00,               // Alignment
                    0x01,               // Length
                    )
            })
            OperationRegion (ECO1, SystemIO, 0x62, 0x01)
            Field (ECO1, ByteAcc, Lock, Preserve)
            {
                PX62,   8
            }

            OperationRegion (ECO2, SystemIO, 0x66, 0x01)
            Field (ECO2, ByteAcc, Lock, Preserve)
            {
                PX66,   8
            }

            OperationRegion (RAM, EmbeddedControl, 0x00, 0xFF)
            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x0A), 
                    ,   1, 
                BLNK,   1, 
                WLLD,   2, 
                BTLD,   2, 
                Offset (0x13), 
                URTB,   8, 
                Offset (0x52), 
                WDEV,   1, 
                BDEV,   1, 
                GDEV,   1, 
                    ,   4, 
                WEPM,   1, 
                Offset (0x5C), 
                OSTP,   8, 
                Offset (0x70), 
                    ,   1, 
                KLID,   1, 
                    ,   3, 
                KACS,   1, 
                Offset (0x71), 
                WLEN,   1, 
                BTEN,   1, 
                DCKS,   1, 
                MUTE,   1, 
                KBID,   3, 
                USBP,   1, 
                    ,   2, 
                KEYW,   1, 
                RTCW,   1, 
                LIDW,   1, 
                BL2W,   1, 
                TPDW,   1, 
                Offset (0x73), 
                WWEN,   1, 
                Offset (0x75), 
                SWBL,   1, 
                KLMA,   1, 
                Offset (0x76), 
                SYSC,   4, 
                SYSO,   4
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x7F), 
                BNEN,   1, 
                BNCM,   1, 
                BNDM,   1, 
                BNVE,   1, 
                Offset (0x83), 
                BNAC,   4, 
                BNDC,   4, 
                Offset (0x87), 
                BNVA,   8
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x01), 
                TIID,   8, 
                Offset (0x10), 
                    ,   1, 
                KTEE,   1, 
                Offset (0x90), 
                SCPM,   1, 
                Offset (0x91), 
                TTID,   8, 
                KCSS,   1, 
                KCTT,   1, 
                KDTT,   1, 
                KOSD,   1, 
                KVTP,   1, 
                Offset (0xA8), 
                THS0,   8, 
                THS1,   8, 
                THS2,   8, 
                THS3,   8, 
                THS4,   8, 
                THS5,   8, 
                THS6,   8, 
                THS7,   8
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x92), 
                KTAF,   8
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x92), 
                THSL,   4
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0xD0), 
                TSP0,   8, 
                TSC0,   8, 
                TSP1,   8, 
                TSC1,   8, 
                TSP2,   8, 
                TSC2,   8, 
                TSP3,   8, 
                TSC3,   8, 
                TSP4,   8, 
                TSC4,   8, 
                TSP5,   8, 
                TSC5,   8, 
                TSP6,   8, 
                TSC6,   8, 
                TSP7,   8, 
                TSC7,   8
            }

            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((Arg0 == 0x03))
                {
                    ECON = Arg1
                    TINI ()
                    SYSO = 0x05
                    If ((\_SB.TPOS >= 0x40))
                    {
                        BNEN = 0x00
                    }

                    \BCEN = BNEN /* \_SB_.PCI0.LPC0.EC0_.BNEN */
                    \BCVE = BNVE /* \_SB_.PCI0.LPC0.EC0_.BNVE */
                    \PSBN = 0x00
                    If ((SKUT == 0x02)){}
                    OSTP = \_SB.PCI0.GOST ()
                }
            }

            Method (TINI, 0, NotSerialized)
            {
                SGV3 (0x00)
                If (\ECON)
                {
                    KTAF = 0x00
                    KTEE = 0x01
                }
                Else
                {
                    WBEC (0x92, 0x00)
                    MBEC (0x10, 0xFD, 0x02)
                }
            }

            Name (EPMS, 0x00)
            Name (WLES, 0x00)
            Name (BTES, 0x00)
            Name (WWES, 0x00)
            Name (ACIS, 0x00)
            Method (ECPS, 1, NotSerialized)
            {
                SYSC = Arg0
                MUTE = 0x01
                B0ST = 0xFF
                ACST = 0xFF
                If (((Arg0 == 0x03) || (Arg0 == 0x04)))
                {
                    EPMS = WEPM /* \_SB_.PCI0.LPC0.EC0_.WEPM */
                    WLES = WLEN /* \_SB_.PCI0.LPC0.EC0_.WLEN */
                    BTES = BTEN /* \_SB_.PCI0.LPC0.EC0_.BTEN */
                    WWES = WWEN /* \_SB_.PCI0.LPC0.EC0_.WWEN */
                    WLEN = 0x00
                    WWEN = 0x00
                    ACIS = KACS /* \_SB_.PCI0.LPC0.EC0_.KACS */
                }

                If ((Arg0 == 0x04))
                {
                    BLNK = 0x01
                }
            }

            Method (ECWK, 1, NotSerialized)
            {
                SYSO = Arg0
                MUTE = 0x00
                TINI ()
                Notify (BAT0, 0x81) // Information Change
                If (((Arg0 == 0x03) || (Arg0 == 0x04)))
                {
                    BNEN = \BCEN
                    BNVE = \BCVE
                    WEPM = EPMS /* \_SB_.PCI0.LPC0.EC0_.EPMS */
                    WLEN = WLES /* \_SB_.PCI0.LPC0.EC0_.WLES */
                    BTEN = BTES /* \_SB_.PCI0.LPC0.EC0_.BTES */
                    WWEN = WWES /* \_SB_.PCI0.LPC0.EC0_.WWES */
                    If (\PSBN)
                    {
                        Local2 = KACS /* \_SB_.PCI0.LPC0.EC0_.KACS */
                        If ((Local2 != ACIS))
                        {
                            If (Local2)
                            {
                                PSKY (0x01)
                            }
                            Else
                            {
                                PSKY (0x02)
                            }
                        }
                    }
                }

                If ((Arg0 == 0x03)){}
                If ((Arg0 == 0x04)){}
                If (((Arg0 == 0x04) || (Arg0 == 0x05))){}
            }
        }
    }

    Scope (\_SB.PCI0.LPC0)
    {
        Device (KBD0)
        {
            Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0060,             // Range Minimum
                    0x0060,             // Range Maximum
                    0x01,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0064,             // Range Minimum
                    0x0064,             // Range Maximum
                    0x01,               // Alignment
                    0x01,               // Length
                    )
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {1}
            })
        }

        Device (PS2M)
        {
            Name (_HID, EisaId ("SYN1B37"))  // _HID: Hardware ID
            Name (_CID, Package (0x03)  // _CID: Compatible ID
            {
                EisaId ("SYN1B00"), 
                EisaId ("SYN0002"), 
                EisaId ("PNP0F13") /* PS/2 Mouse */
            })
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {12}
            })
        }
    }

    Scope (\)
    {
        Mutex (MSGF, 0x07)
    }

    Scope (\_SB.PCI0.LPC0.EC0)
    {
        Method (_Q5C, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x5C
        }

        Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x10
        }

        Method (_Q1C, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x1C
            If (\BCEN)
            {
                If (\BCVE)
                {
                    HKEY (0x1C)
                }
            }
            Else
            {
                Acquire (MSGF, 0xFFFF)
                If ((\_SB.PCI0.VGPU == \_SB.PCI0.AGP._ADR))
                {
                    Notify (\_SB.PCI0.AGP.VGA.LCD, 0x86) // Device-Specific
                    If ((\_SB.PCI0.AGP.PXEN != 0x80000000))
                    {
                        Notify (\_SB.PCI0.PB2.VGA.LCD, 0x86) // Device-Specific
                    }
                }

                If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB2._ADR))
                {
                    Notify (\_SB.PCI0.PB2.VGA.LCD, 0x86) // Device-Specific
                }

                If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB3._ADR))
                {
                    Notify (\_SB.PCI0.PB3.VGA.LCD, 0x86) // Device-Specific
                }

                Release (MSGF)
            }
        }

        Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x1D
            If (\BCEN)
            {
                If (\BCVE)
                {
                    HKEY (0x1D)
                }
            }
            Else
            {
                Acquire (MSGF, 0xFFFF)
                If ((\_SB.PCI0.VGPU == \_SB.PCI0.AGP._ADR))
                {
                    Notify (\_SB.PCI0.AGP.VGA.LCD, 0x87) // Device-Specific
                    If ((\_SB.PCI0.AGP.PXEN != 0x80000000))
                    {
                        Notify (\_SB.PCI0.PB2.VGA.LCD, 0x87) // Device-Specific
                    }
                }

                If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB2._ADR))
                {
                    Notify (\_SB.PCI0.PB2.VGA.LCD, 0x87) // Device-Specific
                }

                If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB3._ADR))
                {
                    Notify (\_SB.PCI0.PB3.VGA.LCD, 0x87) // Device-Specific
                }

                Release (MSGF)
            }
        }

        Method (_Q23, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x23
        }

        Method (_Q26, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x26
        }

        Method (_Q2D, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x2D
            SGSW (0x01)
        }

        Method (_Q2E, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x2E
            Local0 = 0x01
            If ((\_SB.AMWA.FIRE || \_SB.AMWA.WCDA))
            {
                Local0 = 0x00
                \_SB.AMWA.ACRN (0x10)
            }

            \_SB.AMWA.ALMN ()
            If (Local0)
            {
                HKEY (0x2E)
            }
        }

        Method (_Q2F, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x2F
            If (\_SB.AMWA.FIRE)
            {
                \_SB.AMWA.ACRN (0x0E)
            }

            \_SB.AMWA.ALMN ()
            PSKY (0x00)
        }

        Method (_Q32, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x32
            HKEY (0x32)
            KCTT = 0x00
        }

        Method (_Q33, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x33
            KCSS = 0x00
            NTMR ()
            SGV3 (0x00)
        }

        Method (_Q34, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x34
            KCSS = 0x01
            NTMR ()
            SGV3 (0xFF)
        }

        Method (_Q35, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x35
            HKEY (0x35)
            KCTT = 0x01
        }

        Method (_Q36, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x36
            KOSD = 0x01
            Sleep (0x01F4)
            NTMR ()
        }

        Method (_Q40, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x40
            B0ST = 0xFF
            Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x81) // Information Change
        }

        Method (_Q41, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x41
            B0ST = 0xFF
            Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x81) // Information Change
        }

        Method (_Q48, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x48
            Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x80) // Status Change
        }

        Method (_Q4C, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x4C
            If (B0ST)
            {
                Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x80) // Status Change
            }
        }

        Method (_Q4D, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x4D
        }

        Method (_Q50, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x50
            ACST = 0xFF
            Notify (\_SB.PCI0.LPC0.EC0.ADP1, 0x80) // Status Change
            PSKY (0x01)
        }

        Method (_Q51, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x51
            ACST = 0xFF
            Notify (\_SB.PCI0.LPC0.EC0.ADP1, 0x80) // Status Change
            PSKY (0x02)
        }

        Method (_Q52, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x52
            Notify (\_SB.LID0, 0x80) // Status Change
        }

        Method (_Q53, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x53
            Notify (\_SB.LID0, 0x80) // Status Change
        }

        Method (NTMR, 0, NotSerialized)
        {
            Notify (\_TZ.TZS0, 0x80) // Thermal Status Change
            Notify (\_TZ.TZS1, 0x80) // Thermal Status Change
        }

        Method (SGV3, 1, NotSerialized)
        {
            If ((Arg0 > 0x64))
            {
                Local0 = PSMV /* \PSMV */
            }
            Else
            {
                Local0 = Arg0
            }

            \_PR.C000._PPC = Local0
            Notify (\_PR.C000, 0x80) // Performance Capability Change
            If ((TCNT >= 0x02))
            {
                \_PR.C001._PPC = Local0
                Notify (\_PR.C001, 0x80) // Status Change
            }

            If ((TCNT >= 0x03))
            {
                \_PR.C002._PPC = Local0
                Notify (\_PR.C002, 0x80) // Status Change
            }

            If ((TCNT >= 0x04))
            {
                \_PR.C003._PPC = Local0
                Notify (\_PR.C003, 0x80) // Status Change
            }
        }

        Method (SBNL, 2, NotSerialized)
        {
            If (\BCEN)
            {
                If (\BCVE)
                {
                    HKEY (0x1C)
                }
            }
        }

        Method (SGSW, 1, NotSerialized)
        {
        }

        Method (PSKY, 1, NotSerialized)
        {
            If (\PSBN)
            {
                Local1 = 0x01
                If (\_SB.AMWA.FIRE)
                {
                    Local1 = 0x00
                }

                If (Local1)
                {
                    If ((Arg0 == 0x00))
                    {
                        Local2 = KACS /* \_SB_.PCI0.LPC0.EC0_.KACS */
                        Local3 = \_SB.AMWA.BBST
                    }

                    If ((Arg0 == 0x01))
                    {
                        Local2 = 0x01
                    }

                    If ((Arg0 == 0x02))
                    {
                        Local2 = 0x00
                        Local3 = 0x01
                    }

                    Sleep (0x32)
                    If (Local2)
                    {
                        SGSW (0x01)
                        SBNL (BNVA, 0x09)
                    }
                    ElseIf (Local3)
                    {
                        SGSW (0x02)
                        SBNL (BNVA, 0x02)
                    }
                    Else
                    {
                        SGSW (0x01)
                        SBNL (BNVA, 0x04)
                    }
                }
            }
        }
    }

    Scope (\_SB.PCI0.LPC0.EC0)
    {
        Method (HKDS, 1, NotSerialized)
        {
            If ((0x00 == DSEN))
            {
                Local2 = 0x01
                If (Local2)
                {
                    PHSR (0x98, 0x00)
                }

                If ((CADL != PADL))
                {
                    PADL = CADL /* \CADL */
                    If (((\_SB.TPOS > 0x04) || (\_SB.TPOS < 0x40)))
                    {
                        Notify (\_SB.PCI0, 0x00) // Bus Check
                    }
                    Else
                    {
                        If ((\_SB.PCI0.VGPU == \_SB.PCI0.AGP._ADR))
                        {
                            Notify (\_SB.PCI0.AGP.VGA, 0x00) // Bus Check
                        }

                        If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB2._ADR))
                        {
                            Notify (\_SB.PCI0.PB2.VGA, 0x00) // Bus Check
                        }

                        If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB3._ADR))
                        {
                            Notify (\_SB.PCI0.PB3.VGA, 0x00) // Bus Check
                        }
                    }

                    Sleep (0x02EE)
                }

                If ((Arg0 == 0x10))
                {
                    Local2 = 0x01
                    If (Local2)
                    {
                        Local0 = PHSR (0x97, 0x00)
                        Local0++
                        Local1 = 0x02
                        Local1++
                        If ((Local0 >= Local1))
                        {
                            Local0 = 0x00
                        }
                    }
                }
                Else
                {
                    Local0 = Arg0
                }

                If ((Local0 == 0x01))
                {
                    \VDSS = 0x02
                }

                If ((Local0 == 0x00))
                {
                    \VDSS = 0x01
                }

                If ((Local0 == 0x02))
                {
                    \VDSS = 0x03
                }

                If ((Local0 == 0x03))
                {
                    \VDSS = 0x06
                }

                If ((Local0 == 0x04))
                {
                    \VDSS = 0x04
                }

                If ((Local0 == 0x05))
                {
                    \VDSS = 0x07
                }

                If ((Local0 == 0x06))
                {
                    \VDSS = 0x05
                }

                If ((Local0 == 0x07))
                {
                    \VDSS = 0x08
                }

                If ((\_SB.PCI0.VGPU == \_SB.PCI0.AGP._ADR))
                {
                    Notify (\_SB.PCI0.AGP.VGA, 0x80) // Status Change
                }

                If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB2._ADR))
                {
                    Notify (\_SB.PCI0.PB2.VGA, 0x80) // Status Change
                }

                If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB3._ADR))
                {
                    Notify (\_SB.PCI0.PB3.VGA, 0x80) // Status Change
                }
            }

            If ((0x01 == DSEN)){}
        }

        Method (_Q19, 0, NotSerialized)  // _Qxx: EC Query
        {
            P80H = 0x19
            Local1 = 0x01
            If (Local1)
            {
                If ((\_SB.PCI0.VGPU == \_SB.PCI0.AGP._ADR))
                {
                    \_SB.PCI0.AGP.VGA.AFN0 ()
                    Local1 = 0x00
                }

                If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB2._ADR))
                {
                    \_SB.PCI0.PB2.VGA.AFN0 ()
                    Local1 = 0x00
                }

                If ((\_SB.PCI0.VGPU == \_SB.PCI0.PB3._ADR))
                {
                    \_SB.PCI0.PB3.VGA.AFN0 ()
                    Local1 = 0x00
                }

                If (Local1)
                {
                    HKDS (0x10)
                }
            }
        }
    }

    Scope (\_SB.PCI0.LPC0.EC0)
    {
        Field (RAM, ByteAcc, Lock, Preserve)
        {
            Offset (0x02), 
            NBID,   8, 
            Offset (0x17), 
                ,   5, 
            SM0F,   1, 
                ,   1, 
            SM1F,   1, 
            Offset (0x88), 
            NB0A,   1, 
                ,   2, 
            NB0R,   1, 
            NB0L,   1, 
            NB0F,   1, 
            NB0N,   1, 
            Offset (0x89), 
            NB1A,   1, 
                ,   2, 
            NB1R,   1, 
            NB1L,   1, 
            NB1F,   1, 
            NB1N,   1
        }

        Field (RAM, ByteAcc, Lock, Preserve)
        {
            Offset (0x88), 
            NB0S,   8, 
            NB1S,   8
        }

        Field (RAM, ByteAcc, Lock, Preserve)
        {
            Offset (0xE0), 
            BSRC,   16, 
            BSFC,   16, 
            BSPE,   16, 
            BSAC,   16, 
            BSVO,   16, 
                ,   15, 
            BSCM,   1, 
            BSCU,   16, 
            BSTV,   16
        }

        Field (RAM, ByteAcc, Lock, Preserve)
        {
            Offset (0xE0), 
            BSDC,   16, 
            BSDV,   16, 
            BSSN,   16
        }

        Field (RAM, ByteAcc, NoLock, Preserve)
        {
            Offset (0xE0), 
            BSMN,   128
        }

        Field (RAM, ByteAcc, NoLock, Preserve)
        {
            Offset (0xE0), 
            BSDN,   128
        }

        Field (RAM, ByteAcc, NoLock, Preserve)
        {
            Offset (0xE0), 
            BSCH,   128
        }

        Mutex (BATM, 0x07)
        Method (GBIF, 3, NotSerialized)
        {
            Acquire (BATM, 0xFFFF)
            If (Arg2)
            {
                Arg1 [0x01] = 0xFFFFFFFF
                Arg1 [0x02] = 0xFFFFFFFF
                Arg1 [0x04] = 0xFFFFFFFF
                Arg1 [0x05] = 0x00
                Arg1 [0x06] = 0x00
            }
            Else
            {
                NBID = (Arg0 & 0xF0)
                Local0 = BSCM /* \_SB_.PCI0.LPC0.EC0_.BSCM */
                Arg1 [0x00] = (Local0 ^ 0x01)
                NBID = (Arg0 | 0x01)
                If (Local0)
                {
                    Local1 = (BSDC * 0x0A)
                }
                Else
                {
                    Local1 = BSDC /* \_SB_.PCI0.LPC0.EC0_.BSDC */
                }

                Arg1 [0x01] = Local1
                NBID = (Arg0 & 0xF0)
                If (Local0)
                {
                    Local2 = (BSFC * 0x0A)
                }
                Else
                {
                    Local2 = BSFC /* \_SB_.PCI0.LPC0.EC0_.BSFC */
                }

                Arg1 [0x02] = Local2
                NBID = (Arg0 | 0x01)
                Arg1 [0x04] = BSDV /* \_SB_.PCI0.LPC0.EC0_.BSDV */
                Divide (Local2, 0x64, Local7, Local6)
                Local3 = (Local6 * 0x07)
                Arg1 [0x05] = Local3
                Local4 = (0x05 * 0x02)
                Local4 += 0x01
                Local4 *= Local6
                Divide (Local4, 0x02, Local7, Local4)
                Arg1 [0x06] = Local4
                Arg1 [0x07] = (Local3 - Local4)
                Arg1 [0x08] = (Local2 - Local3)
                Local7 = BSSN /* \_SB_.PCI0.LPC0.EC0_.BSSN */
                Name (SERN, Buffer (0x06)
                {
                    "     "
                })
                Local6 = 0x04
                While (Local7)
                {
                    Divide (Local7, 0x0A, Local5, Local7)
                    SERN [Local6] = (Local5 + 0x30)
                    Local6--
                }

                Arg1 [0x0A] = SERN /* \_SB_.PCI0.LPC0.EC0_.GBIF.SERN */
                NBID = (Arg0 | 0x03)
                Arg1 [0x09] = BSDN /* \_SB_.PCI0.LPC0.EC0_.BSDN */
                NBID = (Arg0 | 0x04)
                Arg1 [0x0B] = BSCH /* \_SB_.PCI0.LPC0.EC0_.BSCH */
                NBID = (Arg0 | 0x02)
                Arg1 [0x0C] = BSMN /* \_SB_.PCI0.LPC0.EC0_.BSMN */
            }

            Release (BATM)
            Return (Arg1)
        }

        Method (GBST, 4, NotSerialized)
        {
            If (Arg0)
            {
                Local0 = SM1F /* \_SB_.PCI0.LPC0.EC0_.SM1F */
            }
            Else
            {
                Local0 = SM0F /* \_SB_.PCI0.LPC0.EC0_.SM0F */
            }

            If (Local0)
            {
                Local0 = (Arg1 & (0x01 << 0x03))
                If ((Local0 == 0x00))
                {
                    Return (Arg3)
                }
            }

            Acquire (BATM, 0xFFFF)
            If ((Arg1 & 0x02))
            {
                Local0 = 0x02
                If ((Arg1 & 0x20))
                {
                    Local0 = 0x00
                }
            }
            ElseIf ((Arg1 & 0x04))
            {
                Local0 = 0x01
            }
            Else
            {
                Local0 = 0x00
            }

            If ((Arg1 & 0x10))
            {
                Local0 |= 0x04
            }

            If ((Arg1 & 0x01))
            {
                NBID = (Arg0 & 0xF0)
                Local1 = BSAC /* \_SB_.PCI0.LPC0.EC0_.BSAC */
                Local2 = BSRC /* \_SB_.PCI0.LPC0.EC0_.BSRC */
                If (ACST)
                {
                    If ((Arg1 & 0x20))
                    {
                        Local2 = BSFC /* \_SB_.PCI0.LPC0.EC0_.BSFC */
                    }
                }

                If (Arg2)
                {
                    Local2 *= 0x0A
                }

                Local3 = BSVO /* \_SB_.PCI0.LPC0.EC0_.BSVO */
                If ((Local1 >= 0x8000))
                {
                    If ((Local0 & 0x01))
                    {
                        Local1 = (0x00010000 - Local1)
                    }
                    Else
                    {
                        Local1 = 0x00
                    }
                }
                ElseIf (((Local0 & 0x02) == 0x00))
                {
                    Local1 = 0x00
                }

                If (Arg2)
                {
                    Local1 *= Local3
                    Divide (Local1, 0x03E8, Local7, Local1)
                }
            }
            Else
            {
                Local0 = 0x00
                Local1 = 0xFFFFFFFF
                Local2 = 0xFFFFFFFF
                Local3 = 0xFFFFFFFF
            }

            Arg3 [0x00] = Local0
            Arg3 [0x01] = Local1
            Arg3 [0x02] = Local2
            Arg3 [0x03] = Local3
            Release (BATM)
            Return (Arg3)
        }

        Name (B0ST, 0xFF)
        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
            Method (_PCL, 0, NotSerialized)  // _PCL: Power Consumer List
            {
                Return (\_SB)
            }

            Name (B0IP, Package (0x0D)
            {
                0x01, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x01, 
                0xFFFFFFFF, 
                0x00, 
                0x00, 
                0x5A, 
                0x5A, 
                "", 
                "100", 
                "Lion", 
                0x00
            })
            Name (B0SP, Package (0x04)
            {
                0x00, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((B0ST == 0xFF))
                {
                    If (\ECON)
                    {
                        Local1 = NB0A /* \_SB_.PCI0.LPC0.EC0_.NB0A */
                        If (NB0N)
                        {
                            Local1 = 0x00
                        }
                    }
                    Else
                    {
                        Local0 = RBEC (0x88)
                        Local1 = (Local0 >> 0x00)
                        Local1 &= 0x01
                        If ((Local0 & 0x40))
                        {
                            Local1 = 0x00
                        }
                    }

                    B0ST = Local1
                }
                Else
                {
                    Local1 = B0ST /* \_SB_.PCI0.LPC0.EC0_.B0ST */
                }

                If (Local1)
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Local6 = B0ST /* \_SB_.PCI0.LPC0.EC0_.B0ST */
                Local7 = 0x14
                While ((Local6 && Local7))
                {
                    If (\ECON)
                    {
                        Local1 = NB0S /* \_SB_.PCI0.LPC0.EC0_.NB0S */
                    }
                    Else
                    {
                        Local1 = RBEC (0x88)
                    }

                    If ((Local1 & 0x08))
                    {
                        Local6 = 0x00
                    }
                    Else
                    {
                        Sleep (0x01F4)
                        Local7--
                    }
                }

                Return (GBIF (0x00, B0IP, Local6))
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Local0 = (DerefOf (B0IP [0x00]) ^ 0x01)
                If (\ECON)
                {
                    Local1 = NB0S /* \_SB_.PCI0.LPC0.EC0_.NB0S */
                }
                Else
                {
                    Local1 = RBEC (0x88)
                }

                Return (GBST (0x00, Local1, Local0, B0SP))
            }
        }
    }

    Scope (\_SB.PCI0.LPC0.EC0)
    {
        Name (ACST, 0xFF)
        Device (ADP1)
        {
            Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                If ((ACST == 0xFF))
                {
                    If (\ECON)
                    {
                        Local1 = KACS /* \_SB_.PCI0.LPC0.EC0_.KACS */
                    }
                    Else
                    {
                        Local0 = RBEC (0x70)
                        Local1 = (Local0 & 0x20)
                    }
                }
                Else
                {
                    Local1 = ACST /* \_SB_.PCI0.LPC0.EC0_.ACST */
                }

                If (Local1)
                {
                    ACST = 0x01
                }
                Else
                {
                    ACST = 0x00
                }

                Return (ACST) /* \_SB_.PCI0.LPC0.EC0_.ACST */
            }

            Method (_PCL, 0, NotSerialized)  // _PCL: Power Consumer List
            {
                Return (\_SB)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }

    Scope (\)
    {
        Name (B2ED, Buffer (0x1C)
        {
            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0018 */  0x00, 0x00, 0x00, 0x00                           // ....
        })
        Method (WH15, 2, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            CreateDWordField (Arg1, 0x00, DEAX)
            CreateDWordField (Arg1, 0x04, DEBX)
            CreateDWordField (Arg1, 0x08, DECX)
            CreateDWordField (Arg1, 0x0C, DEDX)
            CreateDWordField (B2ED, 0x00, OEAX)
            CreateDWordField (B2ED, 0x04, OEBX)
            CreateDWordField (B2ED, 0x08, OECX)
            CreateDWordField (B2ED, 0x0C, OEDX)
            CreateDWordField (B2ED, 0x10, OFLG)
            OECX = DECX /* \WH15.DECX */
            OEDX = DEDX /* \WH15.DEDX */
            If ((\_SB.AMW0.WMID == 0x01))
            {
                CreateDWordField (Arg1, 0x10, DESI)
                CreateDWordField (Arg1, 0x14, DEDI)
                CreateDWordField (B2ED, 0x14, OESI)
                CreateDWordField (B2ED, 0x18, OEDI)
                OESI = DESI /* \WH15.DESI */
                OEDI = DEDI /* \WH15.DEDI */
            }

            If (((DEAX & 0xFFFF) == 0x9630))
            {
                If (((DEBX & 0xFF) == 0x06))
                {
                    WB15 (B2ED, DEBX, DECX, DEDX, DESI, DEDI)
                    Release (MSMI)
                    Return (B2ED) /* \B2ED */
                }
            }

            If (((DEAX == 0x9630) && (DEBX == 0x01)))
            {
                Local0 = \_SB.AMW0.WCOD ()
                OECX = Local0
                If ((Local0 == 0x00))
                {
                    OFLG = 0x01
                }
                Else
                {
                    OFLG = Zero
                }

                Return (B2ED) /* \B2ED */
            }

            \_SB.PCI0.LPC0.WNVA = DEAX /* \WH15.DEAX */
            \_SB.PCI0.LPC0.WNVB = DEBX /* \WH15.DEBX */
            \_SB.PCI0.LPC0.WNVC = DECX /* \WH15.DECX */
            \_SB.PCI0.LPC0.WNVD = DEDX /* \WH15.DEDX */
            If ((\_SB.AMW0.WMID == 0x01))
            {
                \_SB.PCI0.LPC0.WNVS = DESI /* \WH15.DESI */
                \_SB.PCI0.LPC0.WNVI = DEDI /* \WH15.DEDI */
            }

            WSMI (0x95)
            OEAX = \_SB.PCI0.LPC0.WNVA
            OEBX = \_SB.PCI0.LPC0.WNVB
            OECX = \_SB.PCI0.LPC0.WNVC
            OEDX = \_SB.PCI0.LPC0.WNVD
            OFLG = \_SB.PCI0.LPC0.WFLG
            If ((\_SB.AMW0.WMID == 0x01))
            {
                OESI = \_SB.PCI0.LPC0.WNVS
                OEDI = \_SB.PCI0.LPC0.WNVI
            }

            Release (MSMI)
            Return (B2ED) /* \B2ED */
        }

        Method (I15H, 5, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            Local1 = Arg0
            \_SB.PCI0.LPC0.WNVA = Arg1
            \_SB.PCI0.LPC0.WNVB = Arg2
            \_SB.PCI0.LPC0.WNVC = Arg3
            \_SB.PCI0.LPC0.WNVD = Arg4
            WSMI (0x95)
            If ((Local1 == 0x01))
            {
                Local0 = \_SB.PCI0.LPC0.WNVA
            }

            If ((Local1 == 0x02))
            {
                Local0 = \_SB.PCI0.LPC0.WNVB
            }

            If ((Local1 == 0x03))
            {
                Local0 = \_SB.PCI0.LPC0.WNVC
            }

            If ((Local1 == 0x04))
            {
                Local0 = \_SB.PCI0.LPC0.WNVD
            }

            If ((Local1 == 0x05))
            {
                Local0 = \_SB.PCI0.LPC0.WFLG
            }

            Release (MSMI)
            Return (Local0)
        }
    }

    Scope (\)
    {
        Name (B3ED, Buffer (0x28)
        {
            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
        })
        Method (AWMI, 5, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            \_SB.PCI0.LPC0.WNVA = Arg1
            \_SB.PCI0.LPC0.WNVB = Arg2
            \_SB.PCI0.LPC0.WNVC = Arg3
            \_SB.PCI0.LPC0.WNVD = Arg4
            \_SB.PCI0.LPC0.WFLG = Arg0
            \_SB.PCI0.LPC0.BCMD = 0x96
            \_SB.PCI0.LPC0.SMIC = Zero
            CreateDWordField (B3ED, 0x00, B3R0)
            CreateDWordField (B3ED, 0x08, B3R1)
            CreateDWordField (B3ED, 0x10, B3R2)
            CreateDWordField (B3ED, 0x18, B3R3)
            If ((Arg0 == 0x00))
            {
                B3ED = 0x00
                B3R0 = \_SB.PCI0.LPC0.WNVD
                B3R1 = \_SB.PCI0.LPC0.WNVC
                B3R2 = \_SB.PCI0.LPC0.WNVB
                B3R3 = \_SB.PCI0.LPC0.WNVA
            }

            If (((Arg0 == 0x01) || (Arg0 == 0x02)))
            {
                B3ED = 0x00
                B3R0 = \_SB.PCI0.LPC0.WNVA
                B3R1 = \_SB.PCI0.LPC0.WNVD
            }

            If ((Arg0 == 0x03))
            {
                B3ED = 0x00
                B3R0 = \_SB.PCI0.LPC0.WNVA
            }

            Release (MSMI)
            Return (B3ED) /* \B3ED */
        }
    }

    Scope (\)
    {
        Method (ASMI, 5, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            \_SB.PCI0.LPC0.WNVA = Arg1
            \_SB.PCI0.LPC0.WNVB = Arg2
            \_SB.PCI0.LPC0.WNVC = Arg3
            \_SB.PCI0.LPC0.WNVD = Arg4
            \_SB.PCI0.LPC0.BCMD = Arg0
            \_SB.PCI0.LPC0.SMIC = Zero
            Local0 = \_SB.PCI0.LPC0.WNVA
            Release (MSMI)
            Return (Local0)
        }
    }

    Scope (\_SB)
    {
        Device (AMWA)
        {
            Name (_HID, EisaId ("PNP0C14") /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, "APGe")  // _UID: Unique ID
            Name (FLMA, 0x00)
            Name (BGET, Buffer (0x08)
            {
                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
            })
            CreateWordField (BGET, 0x00, BGER)
            CreateWordField (BGET, 0x02, BGDM)
            CreateByteField (BGET, 0x04, BGD0)
            Name (BSET, Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x00                           // ....
            })
            CreateWordField (BSET, 0x00, BSER)
            CreateWordField (BSET, 0x02, BKER)
            Name (B6ED, Buffer (0x08)
            {
                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
            })
            CreateByteField (B6ED, 0x00, WFUN)
            CreateByteField (B6ED, 0x01, KEYN)
            CreateWordField (B6ED, 0x02, DEVM)
            OperationRegion (RAM, EmbeddedControl, 0x00, 0xFF)
            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x15), 
                DEB0,   16, 
                Offset (0x57), 
                    ,   7, 
                AHKB,   1, 
                AHKE,   8, 
                Offset (0x75), 
                    ,   1, 
                ALMA,   1, 
                Offset (0x8D), 
                DEB1,   8
            }

            Name (_WDG, Buffer (0x0104)
            {
                /* 0000 */  0x5E, 0xA1, 0x6A, 0x67, 0x47, 0x6A, 0x9F, 0x4D,  // ^.jgGj.M
                /* 0008 */  0xA2, 0xCC, 0x1E, 0x6D, 0x18, 0xD1, 0x40, 0x26,  // ...m..@&
                /* 0010 */  0xBC, 0x00, 0x01, 0x08, 0xEA, 0x69, 0xEF, 0x61,  // .....i.a
                /* 0018 */  0x5C, 0x86, 0xC3, 0x4B, 0xA5, 0x02, 0xA0, 0xDE,  // \..K....
                /* 0020 */  0xBA, 0x0C, 0xB5, 0x31, 0x41, 0x41, 0x01, 0x02,  // ...1AA..
                /* 0028 */  0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,  // !...f...
                /* 0030 */  0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,  // ......).
                /* 0038 */  0x45, 0x45, 0x01, 0x00, 0x09, 0x4E, 0x76, 0x95,  // EE...Nv.
                /* 0040 */  0x56, 0xFB, 0x83, 0x4E, 0xB3, 0x1A, 0x37, 0x76,  // V..N..7v
                /* 0048 */  0x1F, 0x60, 0x99, 0x4A, 0x43, 0x38, 0x01, 0x01,  // .`.JC8..
                /* 0050 */  0x45, 0xDD, 0x23, 0x59, 0x80, 0x04, 0xD5, 0x4E,  // E.#Y...N
                /* 0058 */  0xB6, 0x1A, 0xC9, 0xEC, 0x6C, 0x90, 0xE2, 0x6A,  // ....l..j
                /* 0060 */  0x43, 0x39, 0x01, 0x02, 0x58, 0xF2, 0xF4, 0x6A,  // C9..X..j
                /* 0068 */  0x01, 0xB4, 0xFD, 0x42, 0xBE, 0x91, 0x3D, 0x4A,  // ...B..=J
                /* 0070 */  0xC2, 0xD7, 0xC0, 0xD3, 0x43, 0x41, 0x01, 0x02,  // ....CA..
                /* 0078 */  0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41,  // .a..VB.A
                /* 0080 */  0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5,  // ....E...
                /* 0088 */  0xB2, 0x00, 0x01, 0x08, 0x53, 0x44, 0x8C, 0xE7,  // ....SD..
                /* 0090 */  0x27, 0x02, 0x61, 0x48, 0x9E, 0xDE, 0xF5, 0x60,  // '.aH...`
                /* 0098 */  0x0B, 0x4A, 0x3D, 0x39, 0x43, 0x42, 0x01, 0x02,  // .J=9CB..
                /* 00A0 */  0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48,  // {O....eH
                /* 00A8 */  0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B,  // .......+
                /* 00B0 */  0x43, 0x43, 0x01, 0x02, 0x79, 0x4C, 0xF9, 0xCF,  // CC..yL..
                /* 00B8 */  0x77, 0x6C, 0xF7, 0x4A, 0xAC, 0x56, 0x7D, 0xD0,  // wl.J.V}.
                /* 00C0 */  0xCE, 0x01, 0xC9, 0x97, 0x43, 0x44, 0x01, 0x02,  // ....CD..
                /* 00C8 */  0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B,  // ..wy...K
                /* 00D0 */  0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9,  // .<a..{l.
                /* 00D8 */  0x43, 0x45, 0x01, 0x02, 0x97, 0x13, 0xAA, 0xFA,  // CE......
                /* 00E0 */  0x88, 0x11, 0x8F, 0x44, 0x85, 0x16, 0x9A, 0x07,  // ...D....
                /* 00E8 */  0x98, 0x7D, 0xD3, 0x8A, 0x42, 0x49, 0x01, 0x02,  // .}..BI..
                /* 00F0 */  0x39, 0xD1, 0xB9, 0x83, 0x71, 0xCE, 0xDB, 0x45,  // 9...q..E
                /* 00F8 */  0xA7, 0xA6, 0x26, 0x28, 0xD3, 0xA6, 0x5F, 0x4C,  // ..&(.._L
                /* 0100 */  0x42, 0x4A, 0x01, 0x02                           // BJ..
            })
            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event
            {
                P80H = Arg0
                If ((Arg0 == 0xBC))
                {
                    B6ED = 0x00
                    Local0 = AHKB /* \_SB_.AMWA.AHKB */
                    Local1 = AHKE /* \_SB_.AMWA.AHKE */
                    If (Local0)
                    {
                        WFUN = 0x02
                        DEVM = 0x00
                    }
                    Else
                    {
                        WFUN = 0x01
                        ASMI (0xF0, Local1, 0x00, 0x00, 0x00)
                        DEVM = \_SB.PCI0.LPC0.WNVD
                    }

                    KEYN = Local1
                    Return (B6ED) /* \_SB_.AMWA.B6ED */
                }

                If ((Arg0 == 0xB2))
                {
                    GACR ()
                    Return (B2ED) /* \_SB_.AMWA.B2ED */
                }
            }

            Method (WMAA, 3, NotSerialized)
            {
                DEB1 = Arg1
                CreateByteField (Arg2, 0x00, AAFN)
                CreateByteField (Arg2, 0x01, AAKN)
                CreateWordField (Arg2, 0x02, AADM)
                If ((Arg1 == 0x01))
                {
                    BSET = 0x00
                    If ((AAFN == 0x01))
                    {
                        CreateDWordField (Arg2, 0x01, AAD1)
                        CreateByteField (Arg2, 0x05, AAD5)
                        If (((AAD5 & 0xC0) == 0x40))
                        {
                            ASMI (0xF1, 0x00, 0x00, 0x00, AAD1)
                            BSER = \_SB.PCI0.LPC0.WNVA
                        }
                        Else
                        {
                            BSER = 0x00
                        }

                        ALMA = AAD5 /* \_SB_.AMWA.WMAA.AAD5 */
                        FLMA = (AAD5 & 0x01)
                        Return (BSET) /* \_SB_.AMWA.BSET */
                    }

                    If ((AAFN == 0x02))
                    {
                        CreateByteField (Arg2, 0x04, AAD4)
                        ASMI (0xF2, AAKN, 0x00, AAD4, AADM)
                        BSER = \_SB.PCI0.LPC0.WNVA
                        Return (BSET) /* \_SB_.AMWA.BSET */
                    }

                    BSER = 0xE1
                    Return (BSET) /* \_SB_.AMWA.BSET */
                }

                If ((Arg1 == 0x02))
                {
                    BGET = 0x00
                    If ((AAFN == 0x01))
                    {
                        ASMI (0xF3, AAKN, 0x00, 0x00, AADM)
                        BGDM = \_SB.PCI0.LPC0.WNVD
                        BGER = \_SB.PCI0.LPC0.WNVA
                        BGD0 = \_SB.PCI0.LPC0.WNVC
                        Return (BGET) /* \_SB_.AMWA.BGET */
                    }

                    BGER = 0xE1
                    Return (BGET) /* \_SB_.AMWA.BGET */
                }
            }

            Method (ALMN, 0, NotSerialized)
            {
                If (FLMA)
                {
                    Notify (\_SB.AMWA, 0xBC) // Device-Specific
                }
            }
        }
    }

    Scope (\_SB.PCI0.LPC0.EC0)
    {
        Method (_Q2C, 0, NotSerialized)  // _Qxx: EC Query
        {
            \_SB.AMWA.ALMN ()
        }
    }

    Scope (\_SB)
    {
        Device (AMW0)
        {
            Name (_HID, EisaId ("PNP0C14") /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, 0x00)  // _UID: Unique ID
            Name (WLMP, 0x00)
            Name (WMID, 0x00)
            Name (B0ED, Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x00                           // ....
            })
            CreateDWordField (B0ED, 0x00, WLID)
            Name (B1ED, Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x00                           // ....
            })
            Name (_WDG, Buffer (0x64)
            {
                /* 0000 */  0x81, 0x17, 0xF4, 0xD9, 0x33, 0xF6, 0x00, 0x44,  // ....3..D
                /* 0008 */  0x93, 0x55, 0x60, 0x17, 0x70, 0xBE, 0xC5, 0x10,  // .U`.p...
                /* 0010 */  0x41, 0x41, 0x01, 0x00, 0x1D, 0x37, 0xC3, 0x67,  // AA...7.g
                /* 0018 */  0xA3, 0x95, 0x37, 0x4C, 0xBB, 0x61, 0xDD, 0x47,  // ..7L.a.G
                /* 0020 */  0xB4, 0x91, 0xDA, 0xAB, 0x41, 0x42, 0x01, 0x02,  // ....AB..
                /* 0028 */  0xED, 0x16, 0x1F, 0x43, 0x2B, 0x0C, 0x4C, 0x44,  // ...C+.LD
                /* 0030 */  0xB2, 0x67, 0x27, 0xDE, 0xB1, 0x40, 0xCF, 0x9C,  // .g'..@..
                /* 0038 */  0x41, 0x43, 0x01, 0x02, 0x71, 0xBF, 0xD1, 0x40,  // AC..q..@
                /* 0040 */  0x2D, 0xA8, 0x59, 0x4E, 0xA1, 0x68, 0x39, 0x85,  // -.YN.h9.
                /* 0048 */  0xE0, 0x3B, 0x2E, 0x87, 0xB0, 0x00, 0x01, 0x08,  // .;......
                /* 0050 */  0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,  // !...f...
                /* 0058 */  0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,  // ......).
                /* 0060 */  0x44, 0x44, 0x01, 0x00                           // DD..
            })
            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event
            {
                P80H = Arg0
                If ((Arg0 == 0xB0))
                {
                    Return (B0ED) /* \_SB_.AMW0.B0ED */
                }
            }

            Method (WQAA, 1, NotSerialized)
            {
                P80H = 0xAA
                Return (B1ED) /* \_SB_.AMW0.B1ED */
            }

            Method (WSAA, 2, NotSerialized)
            {
                P80H = 0xA1
                CreateDWordField (Arg1, 0x00, DDD0)
                If ((DDD0 == 0x01))
                {
                    DDD0 += 0x02
                    B1ED [0x00] = DDD0 /* \_SB_.AMW0.WSAA.DDD0 */
                }
            }

            Method (WMAB, 3, NotSerialized)
            {
                P80H = 0xAB
                WLMP = 0x01
                WMID = 0x00
                Return (WH15 (Arg1, Arg2))
            }

            Method (WMAC, 3, NotSerialized)
            {
                P80H = 0xAC
                WLMP = 0x01
                WMID = 0x01
                Return (WH15 (Arg1, Arg2))
            }
        }
    }

    Scope (\_SB.AMW0)
    {
        Name (WQDD, Buffer (0x0560)
        {
            /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
            /* 0008 */  0x50, 0x05, 0x00, 0x00, 0x70, 0x1D, 0x00, 0x00,  // P...p...
            /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
            /* 0018 */  0x18, 0xCB, 0x8D, 0x00, 0x01, 0x06, 0x18, 0x42,  // .......B
            /* 0020 */  0x10, 0x09, 0x10, 0x8A, 0xE7, 0x80, 0x42, 0x04,  // ......B.
            /* 0028 */  0x0A, 0x0D, 0xA1, 0x40, 0x30, 0x28, 0x38, 0x4B,  // ...@0(8K
            /* 0030 */  0x82, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x08, 0x84,  // ...&&@..
            /* 0038 */  0x24, 0x0A, 0x30, 0x2F, 0x40, 0xB7, 0x00, 0xC3,  // $.0/@...
            /* 0040 */  0x02, 0x6C, 0x0B, 0x30, 0x2D, 0xC0, 0x31, 0x90,  // .l.0-.1.
            /* 0048 */  0xFA, 0xF7, 0x87, 0x28, 0x0D, 0x44, 0x22, 0x20,  // ...(.D" 
            /* 0050 */  0xA9, 0x14, 0x08, 0x09, 0x15, 0xA0, 0x5C, 0x80,  // ......\.
            /* 0058 */  0x6F, 0x01, 0xDA, 0x11, 0x25, 0x59, 0x80, 0x65,  // o...%Y.e
            /* 0060 */  0x18, 0x11, 0xD8, 0x2B, 0x32, 0x41, 0xE3, 0x04,  // ...+2A..
            /* 0068 */  0xE5, 0x0C, 0x03, 0x05, 0x6F, 0xC0, 0x36, 0x05,  // ....o.6.
            /* 0070 */  0x98, 0x1C, 0x04, 0x95, 0x3D, 0x08, 0x94, 0x0C,  // ....=...
            /* 0078 */  0x08, 0x79, 0x14, 0x60, 0x15, 0x4E, 0xD3, 0x49,  // .y.`.N.I
            /* 0080 */  0x60, 0xF7, 0x73, 0x91, 0x30, 0x18, 0x19, 0x13,  // `.s.0...
            /* 0088 */  0xA0, 0x50, 0x80, 0x46, 0x01, 0xDE, 0x40, 0x64,  // .P.F..@d
            /* 0090 */  0x4B, 0x80, 0x41, 0x01, 0xE2, 0x04, 0x28, 0x83,  // K.A...(.
            /* 0098 */  0x12, 0x4A, 0xB8, 0x83, 0x69, 0x4D, 0x80, 0x39,  // .J..iM.9
            /* 00A0 */  0x28, 0x82, 0x56, 0x1B, 0x98, 0x50, 0x3A, 0x03,  // (.V..P:.
            /* 00A8 */  0x12, 0x48, 0xAC, 0x16, 0xC1, 0x05, 0x13, 0x3B,  // .H.....;
            /* 00B0 */  0x6A, 0x94, 0x40, 0xD1, 0xDB, 0x1F, 0x04, 0x09,  // j.@.....
            /* 00B8 */  0xA7, 0x00, 0xA2, 0x06, 0x10, 0x45, 0x1A, 0x0D,  // .....E..
            /* 00C0 */  0x6A, 0x44, 0x09, 0x0E, 0xCC, 0xA3, 0x39, 0xD5,  // jD....9.
            /* 00C8 */  0xCE, 0x05, 0x48, 0x9F, 0xAB, 0x40, 0x8E, 0xF5,  // ..H..@..
            /* 00D0 */  0x34, 0xEA, 0x1C, 0x2E, 0x01, 0x49, 0x60, 0xAC,  // 4....I`.
            /* 00D8 */  0x04, 0xB7, 0xEE, 0x21, 0xE2, 0x5D, 0x03, 0x6A,  // ...!.].j
            /* 00E0 */  0xE2, 0x87, 0xC8, 0x04, 0xC1, 0xA1, 0x86, 0xE8,  // ........
            /* 00E8 */  0xF1, 0x86, 0x3B, 0x81, 0xA3, 0x3E, 0x12, 0x06,  // ..;..>..
            /* 00F0 */  0x71, 0x50, 0x47, 0x83, 0x39, 0x07, 0xD8, 0xE1,  // qPG.9...
            /* 00F8 */  0x64, 0x34, 0xE3, 0x52, 0x05, 0x98, 0x1D, 0xBA,  // d4.R....
            /* 0100 */  0x46, 0x96, 0xE0, 0x78, 0x0C, 0x7D, 0xF6, 0xE7,  // F..x.}..
            /* 0108 */  0xD3, 0x33, 0x24, 0x91, 0x3F, 0x08, 0xD4, 0xC8,  // .3$.?...
            /* 0110 */  0x0C, 0xED, 0xA1, 0x9E, 0x56, 0xCC, 0x90, 0x4F,  // ....V..O
            /* 0118 */  0x01, 0x87, 0xC5, 0xC4, 0x42, 0x68, 0x93, 0x1A,  // ....Bh..
            /* 0120 */  0x0F, 0xC4, 0xFF, 0xFF, 0x78, 0xC0, 0xA3, 0xF8,  // ....x...
            /* 0128 */  0x68, 0x20, 0x84, 0x57, 0x82, 0xD8, 0x1E, 0x50,  // h .W...P
            /* 0130 */  0x82, 0x01, 0x21, 0xE4, 0x64, 0x3C, 0xA8, 0x51,  // ..!.d<.Q
            /* 0138 */  0x18, 0x35, 0xDC, 0x61, 0x1C, 0xB5, 0x8F, 0x0F,  // .5.a....
            /* 0140 */  0x3A, 0x3C, 0x50, 0x51, 0xC3, 0xA6, 0x67, 0x06,  // :<PQ..g.
            /* 0148 */  0x7E, 0x5C, 0x60, 0xE7, 0x82, 0x98, 0x8F, 0x00,  // ~\`.....
            /* 0150 */  0x1E, 0xC9, 0x09, 0xF9, 0x38, 0xE1, 0x81, 0xC1,  // ....8...
            /* 0158 */  0x07, 0xC4, 0x7B, 0x9F, 0x32, 0x19, 0xC1, 0x99,  // ..{.2...
            /* 0160 */  0x7A, 0x80, 0xE0, 0xB0, 0x3E, 0x7C, 0x02, 0xFC,  // z...>|..
            /* 0168 */  0xB2, 0xF0, 0xB0, 0x90, 0xC0, 0xF7, 0x07, 0x03,  // ........
            /* 0170 */  0xE3, 0x46, 0x68, 0xBF, 0x02, 0x10, 0x82, 0x97,  // .Fh.....
            /* 0178 */  0x79, 0x02, 0x90, 0x53, 0x04, 0x8D, 0xCD, 0xD0,  // y..S....
            /* 0180 */  0x4F, 0x03, 0x2F, 0x0E, 0xE1, 0x83, 0x47, 0x38,  // O./...G8
            /* 0188 */  0xDF, 0x03, 0x38, 0x85, 0xC7, 0x00, 0x0F, 0xC1,  // ..8.....
            /* 0190 */  0x04, 0x16, 0x39, 0x02, 0x94, 0x98, 0x11, 0xA0,  // ..9.....
            /* 0198 */  0x8E, 0x0D, 0x27, 0x70, 0x3C, 0x61, 0x8F, 0xE0,  // ..'p<a..
            /* 01A0 */  0x78, 0xA2, 0x9C, 0xC4, 0x01, 0xF9, 0xA8, 0x61,  // x......a
            /* 01A8 */  0x84, 0xE0, 0xE5, 0x9E, 0x38, 0x88, 0xE6, 0x71,  // ....8..q
            /* 01B0 */  0x6A, 0x16, 0xEF, 0x00, 0x87, 0xC0, 0xC6, 0x84,  // j.......
            /* 01B8 */  0x3B, 0x40, 0x78, 0x08, 0x7C, 0x00, 0x8F, 0x1A,  // ;@x.|...
            /* 01C0 */  0xE7, 0x67, 0xA5, 0xB3, 0x42, 0x9E, 0x3B, 0xF8,  // .g..B.;.
            /* 01C8 */  0x98, 0xB0, 0x03, 0xE0, 0xD2, 0x0F, 0x27, 0x28,  // ......'(
            /* 01D0 */  0xB1, 0xE7, 0x13, 0x50, 0xFC, 0xFF, 0xCF, 0x27,  // ...P...'
            /* 01D8 */  0xC0, 0x1E, 0xE4, 0x99, 0xE4, 0xED, 0xE4, 0x68,  // .......h
            /* 01E0 */  0x9E, 0x4B, 0x1E, 0x48, 0x9E, 0x48, 0x9E, 0x4F,  // .K.H.H.O
            /* 01E8 */  0x8C, 0xF3, 0x66, 0xF2, 0x64, 0x10, 0xE1, 0xF9,  // ..f.d...
            /* 01F0 */  0xC4, 0xD7, 0x14, 0x23, 0x44, 0x09, 0x19, 0xE8,  // ...#D...
            /* 01F8 */  0xE1, 0x24, 0x42, 0x94, 0x70, 0x81, 0xC2, 0x1A,  // .$B.p...
            /* 0200 */  0x21, 0xC8, 0x63, 0xC1, 0x09, 0x1F, 0x76, 0xAC,  // !.c...v.
            /* 0208 */  0x40, 0x61, 0x9E, 0x4F, 0x98, 0xF0, 0xA7, 0x86,  // @a.O....
            /* 0210 */  0x2C, 0x9C, 0x4F, 0x00, 0xBA, 0xFC, 0xFF, 0xCF,  // ,.O.....
            /* 0218 */  0x27, 0x80, 0x33, 0x81, 0xE7, 0x13, 0x90, 0x0E,  // '.3.....
            /* 0220 */  0x8F, 0x1F, 0x4F, 0x80, 0xC9, 0x08, 0xB8, 0x16,  // ..O.....
            /* 0228 */  0x13, 0x87, 0x2F, 0xD4, 0xE3, 0xC0, 0xA7, 0x11,  // ../.....
            /* 0230 */  0x40, 0xCE, 0x09, 0xE4, 0xFD, 0xE3, 0x38, 0x9F,  // @.....8.
            /* 0238 */  0x44, 0x7C, 0xF7, 0xF2, 0xFF, 0xFF, 0xE6, 0xE5,  // D|......
            /* 0240 */  0x83, 0xC8, 0x1B, 0xC8, 0xC1, 0x3E, 0x8D, 0xB0,  // .....>..
            /* 0248 */  0x51, 0x05, 0x33, 0xCA, 0xE9, 0x47, 0x88, 0xFA,  // Q.3..G..
            /* 0250 */  0x52, 0x62, 0xC4, 0x08, 0xC1, 0x42, 0x05, 0x8A,  // Rb...B..
            /* 0258 */  0x11, 0x35, 0xB2, 0x61, 0x23, 0xC4, 0x79, 0xF8,  // .5.a#.y.
            /* 0260 */  0xA2, 0x0F, 0x06, 0x0D, 0xD5, 0xA7, 0x11, 0x80,  // ........
            /* 0268 */  0x1F, 0xA7, 0x09, 0xDC, 0xE9, 0x02, 0x4C, 0x93,  // ......L.
            /* 0270 */  0x38, 0x80, 0x28, 0x45, 0xC3, 0x68, 0x3A, 0x8F,  // 8.(E.h:.
            /* 0278 */  0x03, 0x01, 0x9F, 0x2F, 0x80, 0x89, 0xE2, 0x97,  // .../....
            /* 0280 */  0x9E, 0xCE, 0x27, 0xFE, 0xFF, 0xAB, 0x05, 0x91,  // ..'.....
            /* 0288 */  0x8D, 0xB5, 0x7A, 0x58, 0x34, 0xF3, 0x03, 0x48,  // ..zX4..H
            /* 0290 */  0xF0, 0xC5, 0x03, 0x6B, 0xD8, 0x27, 0x79, 0x16,  // ...k.'y.
            /* 0298 */  0x27, 0x99, 0x60, 0x56, 0x28, 0xC1, 0x7A, 0xD8,  // '.`V(.z.
            /* 02A0 */  0x4E, 0x09, 0xA3, 0x04, 0x24, 0x1A, 0x8E, 0xA1,  // N...$...
            /* 02A8 */  0xAD, 0x19, 0x46, 0x70, 0x06, 0xF1, 0x79, 0xC8,  // ..Fp..y.
            /* 02B0 */  0x21, 0xCE, 0x31, 0x50, 0x8E, 0x0C, 0x1E, 0xC5,  // !.1P....
            /* 02B8 */  0x59, 0x3D, 0x07, 0x78, 0x8C, 0x8F, 0x0B, 0x6C,  // Y=.x...l
            /* 02C0 */  0x7C, 0x3E, 0x08, 0xF0, 0xC3, 0xA0, 0x6F, 0x06,  // |>....o.
            /* 02C8 */  0x46, 0xB6, 0x9A, 0xD3, 0x0C, 0x0A, 0xCC, 0xC7,  // F.......
            /* 02D0 */  0x0B, 0x4E, 0x50, 0xD7, 0xCD, 0x05, 0x64, 0x43,  // .NP...dC
            /* 02D8 */  0x82, 0x79, 0x10, 0x38, 0x24, 0x30, 0x4F, 0xD5,  // .y.8$0O.
            /* 02E0 */  0x43, 0x02, 0x1E, 0xE0, 0x87, 0x04, 0xE6, 0x2B,  // C......+
            /* 02E8 */  0x81, 0x87, 0x04, 0x2C, 0xFE, 0xFF, 0xA8, 0x07,  // ...,....
            /* 02F0 */  0x71, 0x48, 0x60, 0x46, 0xF2, 0x90, 0xC0, 0xA6,  // qH`F....
            /* 02F8 */  0xEF, 0xC8, 0x01, 0x0A, 0x20, 0xDF, 0x30, 0x7C,  // .... .0|
            /* 0300 */  0xDC, 0x7B, 0xCA, 0x60, 0x63, 0x78, 0xE2, 0x33,  // .{.`cx.3
            /* 0308 */  0x9A, 0xD1, 0xB9, 0xC4, 0xE5, 0xE8, 0x42, 0xC1,  // ......B.
            /* 0310 */  0x45, 0xC1, 0xE8, 0x58, 0x60, 0x10, 0x4F, 0xCB,  // E..X`.O.
            /* 0318 */  0x51, 0xA6, 0x8A, 0x9E, 0x89, 0x7D, 0x9E, 0x42,  // Q....}.B
            /* 0320 */  0xC8, 0x89, 0x82, 0x5F, 0xDD, 0x74, 0x9F, 0x81,  // ..._.t..
            /* 0328 */  0x76, 0xF7, 0x08, 0xEA, 0x8B, 0x0A, 0x83, 0xF3,  // v.......
            /* 0330 */  0x64, 0x39, 0x9C, 0xAF, 0x14, 0xFC, 0xAE, 0xE3,  // d9......
            /* 0338 */  0xCB, 0x15, 0xF8, 0x46, 0x05, 0xF7, 0x50, 0xC1,  // ...F..P.
            /* 0340 */  0x46, 0x05, 0xF6, 0xEB, 0x88, 0x47, 0x05, 0xD6,  // F....G..
            /* 0348 */  0xFF, 0xFF, 0xA8, 0x60, 0x9D, 0x2B, 0xD8, 0xA8,  // ...`.+..
            /* 0350 */  0xC0, 0x7E, 0x26, 0xF0, 0xA8, 0x80, 0xCB, 0xD1,  // .~&.....
            /* 0358 */  0x82, 0x8D, 0x0A, 0xEC, 0x1E, 0x46, 0x05, 0xCA,  // .....F..
            /* 0360 */  0x20, 0xD7, 0x0F, 0x28, 0xD0, 0x8F, 0x96, 0xAF,  //  ..(....
            /* 0368 */  0x40, 0x0F, 0x41, 0x8F, 0x51, 0x1E, 0x14, 0xB8,  // @.A.Q...
            /* 0370 */  0x61, 0x7C, 0xDF, 0x03, 0x4E, 0x17, 0x10, 0x98,  // a|..N...
            /* 0378 */  0xF0, 0x18, 0xC1, 0x47, 0x18, 0xF2, 0xFF, 0x27,  // ...G...'
            /* 0380 */  0x28, 0x6B, 0x5C, 0xA8, 0xFB, 0x8A, 0xAF, 0x72,  // (k\....r
            /* 0388 */  0xEC, 0x3A, 0x85, 0xBB, 0x2A, 0x62, 0x60, 0x3D,  // .:..*b`=
            /* 0390 */  0x52, 0x0E, 0x6B, 0xB4, 0xB0, 0x07, 0xFC, 0xA6,  // R.k.....
            /* 0398 */  0xE5, 0x63, 0x9A, 0x67, 0x66, 0x8C, 0xB0, 0x1E,  // .c.gf...
            /* 03A0 */  0xAD, 0x95, 0x92, 0xD2, 0x2B, 0x9F, 0x23, 0xDD,  // ....+.#.
            /* 03A8 */  0xFA, 0x00, 0x41, 0x73, 0x79, 0x10, 0x78, 0xCE,  // ..Asy.x.
            /* 03B0 */  0x7B, 0x4B, 0x78, 0x73, 0xF7, 0x59, 0xC2, 0xC7,  // {Kxs.Y..
            /* 03B8 */  0xBD, 0xC7, 0x82, 0x97, 0x80, 0x97, 0x81, 0xF7,  // ........
            /* 03C0 */  0x92, 0x57, 0x5A, 0x76, 0xED, 0xF3, 0xAD, 0xCF,  // .WZv....
            /* 03C8 */  0x48, 0x0F, 0x80, 0x46, 0x09, 0x12, 0x23, 0xE6,  // H..F..#.
            /* 03D0 */  0xFB, 0x89, 0x91, 0x1F, 0x6D, 0x7D, 0x69, 0xF0,  // ....m}i.
            /* 03D8 */  0xBD, 0x2F, 0xC6, 0x5B, 0x1F, 0x8B, 0x77, 0xEB,  // ./.[..w.
            /* 03E0 */  0x03, 0x44, 0xFD, 0xFF, 0x6F, 0x7D, 0xC0, 0xFE,  // .D..o}..
            /* 03E8 */  0x72, 0xF1, 0xD6, 0x07, 0x1C, 0x30, 0x23, 0xBE,  // r....0#.
            /* 03F0 */  0xF6, 0x01, 0x93, 0x34, 0x2B, 0xD0, 0x59, 0xC3,  // ...4+.Y.
            /* 03F8 */  0x49, 0x40, 0x74, 0xED, 0xC3, 0xE9, 0x01, 0xD2,  // I@t.....
            /* 0400 */  0xB5, 0x0F, 0xAF, 0x03, 0x96, 0x8E, 0xDB, 0x0A,  // ........
            /* 0408 */  0x60, 0x94, 0xE4, 0x58, 0x85, 0xD2, 0x7E, 0xAC,  // `..X..~.
            /* 0410 */  0xA2, 0x20, 0x3E, 0xCE, 0xF8, 0xDA, 0x07, 0x58,  // . >....X
            /* 0418 */  0xF9, 0xFF, 0x5F, 0xFB, 0x00, 0x26, 0x0E, 0x09,  // .._..&..
            /* 0420 */  0xE6, 0xF5, 0xE2, 0x09, 0xC7, 0x43, 0x02, 0xEB,  // .....C..
            /* 0428 */  0x8D, 0xC6, 0x43, 0x82, 0xFB, 0xFF, 0x1F, 0x34,  // ..C....4
            /* 0430 */  0xD8, 0x86, 0x04, 0xE6, 0x8B, 0x9D, 0xAF, 0x8E,  // ........
            /* 0438 */  0xC0, 0x59, 0xF6, 0x82, 0x75, 0x29, 0xE1, 0x42,  // .Y..u).B
            /* 0440 */  0x61, 0x74, 0xB4, 0x30, 0x88, 0x01, 0x7D, 0x75,  // at.0..}u
            /* 0448 */  0x04, 0x7E, 0x17, 0x3E, 0xE0, 0x73, 0x75, 0x04,  // .~.>.su.
            /* 0450 */  0x0E, 0x17, 0x3E, 0xFC, 0xFF, 0xFF, 0xEA, 0x08,  // ..>.....
            /* 0458 */  0x38, 0xB8, 0xF1, 0x81, 0xF3, 0xEA, 0x08, 0xFC,  // 8.......
            /* 0460 */  0x4C, 0x5C, 0x1D, 0x01, 0x1D, 0x2A, 0x46, 0x0E,  // L\...*F.
            /* 0468 */  0x74, 0x4E, 0x31, 0x8C, 0xE0, 0xFF, 0x7F, 0x54,  // tN1....T
            /* 0470 */  0xE0, 0x06, 0xF6, 0xF1, 0x00, 0xD8, 0x8C, 0x0A,  // ........
            /* 0478 */  0x18, 0x9C, 0x06, 0x7C, 0x09, 0x05, 0xBC, 0x2A,  // ...|...*
            /* 0480 */  0xB4, 0xE9, 0x53, 0xA3, 0x51, 0xAB, 0x06, 0x65,  // ..S.Q..e
            /* 0488 */  0x6A, 0x94, 0x69, 0x50, 0xAB, 0x4F, 0xA5, 0xC6,  // j.iP.O..
            /* 0490 */  0x8C, 0x5D, 0x29, 0x13, 0x8C, 0xB1, 0x02, 0x8D,  // .]).....
            /* 0498 */  0xC5, 0x22, 0x96, 0x23, 0x10, 0x87, 0x04, 0xA1,  // .".#....
            /* 04A0 */  0x22, 0x1F, 0x43, 0x02, 0x71, 0x44, 0x10, 0x1A,  // ".C.qD..
            /* 04A8 */  0xE1, 0x4D, 0x23, 0x10, 0xC7, 0x5B, 0x9B, 0x40,  // .M#..[.@
            /* 04B0 */  0x2C, 0xEE, 0xA1, 0x21, 0x10, 0xFF, 0xFF, 0x83,  // ,..!....
            /* 04B8 */  0x3C, 0x23, 0x64, 0x04, 0x44, 0xA9, 0x40, 0x74,  // <#d.D.@t
            /* 04C0 */  0x4B, 0x22, 0x6B, 0x12, 0x90, 0x95, 0x81, 0x08,  // K"k.....
            /* 04C8 */  0xC8, 0x81, 0x80, 0x68, 0x3A, 0x20, 0x2A, 0xEA,  // ...h: *.
            /* 04D0 */  0x21, 0x20, 0x20, 0x2B, 0x04, 0x11, 0x90, 0xD5,  // !  +....
            /* 04D8 */  0xD8, 0x00, 0x62, 0xDA, 0x40, 0x04, 0xE4, 0x5C,  // ..b.@..\
            /* 04E0 */  0x40, 0x34, 0x25, 0x10, 0x55, 0xA8, 0x03, 0x88,  // @4%.U...
            /* 04E8 */  0xE9, 0x05, 0x11, 0x90, 0xB3, 0x02, 0xD1, 0xE4,  // ........
            /* 04F0 */  0x40, 0x54, 0xB3, 0x0F, 0x20, 0x96, 0x00, 0x44,  // @T.. ..D
            /* 04F8 */  0x40, 0x4E, 0x4A, 0x23, 0x10, 0xEB, 0x54, 0x02,  // @NJ#..T.
            /* 0500 */  0xC2, 0x52, 0xBD, 0x1D, 0x04, 0xE8, 0x88, 0x20,  // .R..... 
            /* 0508 */  0x02, 0xB2, 0xB2, 0x2F, 0xAB, 0x80, 0x2C, 0x13,  // .../..,.
            /* 0510 */  0x44, 0x40, 0x4E, 0x07, 0x44, 0xA3, 0x02, 0x51,  // D@N.D..Q
            /* 0518 */  0x85, 0x56, 0x80, 0x98, 0x5C, 0x10, 0x01, 0x39,  // .V..\..9
            /* 0520 */  0x25, 0x10, 0x8D, 0x0C, 0x44, 0x95, 0x6A, 0x01,  // %...D.j.
            /* 0528 */  0x62, 0xB2, 0x41, 0x04, 0x64, 0x89, 0x5E, 0x80,  // b.A.d.^.
            /* 0530 */  0x98, 0x60, 0x10, 0x01, 0x39, 0x2C, 0x10, 0x8D,  // .`..9,..
            /* 0538 */  0x0E, 0x44, 0x65, 0xBF, 0x0A, 0x04, 0xE4, 0x10,  // .De.....
            /* 0540 */  0x20, 0x3A, 0x25, 0x10, 0x33, 0x40, 0x4C, 0x0E,  //  :%.3@L.
            /* 0548 */  0x88, 0x0E, 0x00, 0x04, 0x88, 0xC6, 0x02, 0xA2,  // ........
            /* 0550 */  0x92, 0xFE, 0x5B, 0x02, 0xB2, 0x40, 0x10, 0x01,  // ..[..@..
            /* 0558 */  0x39, 0x1C, 0x10, 0x8D, 0x0A, 0x44, 0xFF, 0xFF   // 9....D..
        })
    }

    Scope (\_SB.AMWA)
    {
        Name (FIRE, 0x00)
        Name (WCDA, 0x00)
        Name (B2ED, Buffer (0x04)
        {
             0x00, 0x00, 0x00, 0x00                           // ....
        })
        CreateDWordField (B2ED, 0x00, BUID)
        Name (CBE0, Buffer (0x04)
        {
             0x00, 0x00, 0x00, 0x00                           // ....
        })
        CreateDWordField (CBE0, 0x00, BER4)
        CreateWordField (CBE0, 0x00, BUF0)
        CreateWordField (CBE0, 0x02, BER2)
        Name (CBE1, Buffer (0x14)
        {
            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
        })
        CreateDWordField (CBE1, 0x00, B1R0)
        CreateDWordField (CBE1, 0x04, B1R4)
        CreateDWordField (CBE1, 0x08, B1R8)
        CreateDWordField (CBE1, 0x0C, B1RC)
        CreateDWordField (CBE1, 0x10, B1ER)
        Field (RAM, ByteAcc, Lock, Preserve)
        {
            Offset (0x50), 
            ODPW,   1, 
            Offset (0x51), 
            BLST,   1, 
            BBST,   1, 
            Offset (0x52), 
            WDEV,   1, 
            BDEV,   1, 
            GDEV,   1, 
                ,   4, 
            WEPM,   1, 
            Offset (0x88), 
            NB0A,   1, 
            Offset (0x89), 
            NB1A,   1
        }

        Field (RAM, ByteAcc, Lock, Preserve)
        {
            Offset (0x17), 
            SMCS,   8, 
            SPTL,   8, 
            Offset (0x1A), 
            SADD,   8, 
            SCOM,   8, 
            SDTA,   16
        }

        Method (WQC8, 1, NotSerialized)
        {
            P80H = 0xC8
            Local0 = 0x00
            Local1 = 0x00
            If (\PSBN)
            {
                Local1 = 0x01
            }

            Local1 <<= 0x07
            Local0 |= Local1
            Local1 = 0x00
            Local1 <<= 0x09
            Local0 |= Local1
            BER2 = 0x00
            BUF0 = Local0
            Return (CBE0) /* \_SB_.AMWA.CBE0 */
        }

        Method (WMCA, 3, NotSerialized)
        {
            P80H = 0xCA
            CreateDWordField (Arg2, 0x00, CB04)
            CreateByteField (Arg2, 0x00, CB01)
            BER2 = 0x00
            If ((Arg1 == 0x07))
            {
                If (CB04)
                {
                    Local0 = 0x01
                }
                Else
                {
                    Local0 = 0x00
                }

                FIRE = Local0
                WEPM = Local0
                BER4 = 0x00
                Return (CBE0) /* \_SB_.AMWA.CBE0 */
            }

            If ((Arg1 == 0x09))
            {
                Local0 = 0x00
                Local0 = I15H (0x01, 0x9610, 0x023D, 0x00, 0x00)
                BUF0 = Local0
                Return (CBE0) /* \_SB_.AMWA.CBE0 */
            }

            If ((Arg1 == 0x0E))
            {
                Local0 = BBST /* \_SB_.AMWA.BBST */
                BUF0 = Local0
                Return (CBE0) /* \_SB_.AMWA.CBE0 */
            }

            If ((Arg1 == 0x0F))
            {
                If (CB04)
                {
                    Local0 = 0x01
                }
                Else
                {
                    Local0 = 0x00
                }

                BBST = Local0
                BER4 = 0x00
                Return (CBE0) /* \_SB_.AMWA.CBE0 */
            }

            If ((Arg1 == 0x10))
            {
                If (CB04)
                {
                    Local0 = 0x01
                }
                Else
                {
                    Local0 = 0x00
                }

                WCDA = Local0
                BER4 = 0x00
                Return (CBE0) /* \_SB_.AMWA.CBE0 */
            }

            BER2 = 0x01
            Return (CBE0) /* \_SB_.AMWA.CBE0 */
        }

        Method (WMCC, 3, NotSerialized)
        {
            P80H = 0xCC
            CreateDWordField (Arg2, 0x00, CB04)
            BER2 = 0x01
            If ((Arg1 == 0x05))
            {
                BUF0 = ODPW /* \_SB_.AMWA.ODPW */
                BER2 = 0x00
            }

            If ((Arg1 == 0x0E))
            {
                If (CB04)
                {
                    ODPW = 0x01
                }
                Else
                {
                    ODPW = 0x00
                }

                BUF0 = ODPW /* \_SB_.AMWA.ODPW */
                BER2 = 0x00
                Sleep (0xC8)
                Notify (\_SB.PCI0.SATA.PRT1, 0x00) // Bus Check
            }

            Return (CBE0) /* \_SB_.AMWA.CBE0 */
        }

        Method (WMCE, 3, NotSerialized)
        {
            P80H = 0xCE
            CreateDWordField (Arg2, 0x00, CD04)
            CreateByteField (Arg2, 0x00, CD01)
            CreateByteField (Arg2, 0x04, CD02)
            If ((Arg1 == 0x13))
            {
                GBID (CD02)
                If (BER2)
                {
                    Return (CBE0) /* \_SB_.AMWA.CBE0 */
                }

                Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                CD02--
                SMCS = CD02 /* \_SB_.AMWA.WMCE.CD02 */
                SADD = 0x16
                SCOM = CD01 /* \_SB_.AMWA.WMCE.CD01 */
                SPTL = 0x09
                Local0 = 0x00
                BER2 = 0x02
                While ((Local0 < 0x64))
                {
                    If ((SPTL == 0x00))
                    {
                        BER2 = 0x00
                        BUF0 = SDTA /* \_SB_.AMWA.SDTA */
                        Break
                    }
                    Else
                    {
                        Sleep (0x01)
                        Local0++
                    }
                }

                Release (\_SB.PCI0.LPC0.EC0.BATM)
                Return (CBE0) /* \_SB_.AMWA.CBE0 */
            }

            BER2 = 0x01
            Return (CBE0) /* \_SB_.AMWA.CBE0 */
        }

        Method (GBID, 1, NotSerialized)
        {
            Local1 = 0x00
            If ((Arg0 == 0x01))
            {
                If (NB0A)
                {
                    Local0 = 0x00
                }
                Else
                {
                    Local1 = 0x02
                }
            }
            ElseIf ((Arg0 == 0x02))
            {
                If (NB1A)
                {
                    Local0 = 0x10
                }
                Else
                {
                    Local1 = 0x02
                }
            }
            Else
            {
                Local1 = 0x02
            }

            BUF0 = 0x00
            BER2 = Local1
            Return (Local0)
        }

        Method (ACRN, 1, NotSerialized)
        {
            Local0 = 0x00
            If (FIRE)
            {
                If ((Arg0 == 0x0E))
                {
                    Local0 = 0x0B00
                }

                BUID = Local0
                Notify (\_SB.AMWA, 0xB2) // Device-Specific
            }

            If ((FIRE || WCDA))
            {
                If ((Arg0 == 0x10))
                {
                    Local0 = 0x0C00
                    BUID = Local0
                    Notify (\_SB.AMWA, 0xB2) // Device-Specific
                }
            }
        }

        Method (GACR, 0, NotSerialized)
        {
            Local0 = 0x00
            Local1 = (BUID & 0xFF00)
            If (FIRE)
            {
                If ((Local1 == 0x0B00))
                {
                    Local0 = (Local1 | BBST) /* \_SB_.AMWA.BBST */
                }
            }

            If ((FIRE || WCDA))
            {
                If ((Local1 == 0x0C00))
                {
                    Local0 = Local1
                }
            }

            BUID = Local0
        }

        Name (TMPV, 0x00)
        Method (WMBI, 3, NotSerialized)
        {
            BER2 = 0x01
            TMPV = 0x00
            If ((Arg1 == 0x03))
            {
                TMPV = I15H (0x01, 0x9610, 0x10, 0x00, 0x00)
                BER2 = 0x00
            }

            If ((Arg1 == 0x06))
            {
                TMPV = I15H (0x01, 0x9610, 0x0236, 0x00, 0x00)
                B2HV ()
                BER2 = 0x00
            }

            If ((Arg1 == 0x07))
            {
                TMPV = I15H (0x02, 0x9610, 0x38, 0x00, 0x00)
                BER2 = 0x00
            }

            If ((Arg1 == 0x08))
            {
                TMPV = I15H (0x01, 0x9610, 0x0239, 0x00, 0x00)
                B2HV ()
                BER2 = 0x00
            }

            If ((Arg1 == 0x09))
            {
                TMPV = I15H (0x01, 0x9610, 0x023B, 0x00, 0x00)
                B2HV ()
                BER2 = 0x00
            }

            If ((Arg1 == 0x0A))
            {
                TMPV = I15H (0x02, 0x9610, 0x0261, 0x00, 0x00)
                BER2 = 0x00
            }

            If ((Arg1 == 0x0B))
            {
                BER2 = 0x00
            }

            BUF0 = TMPV /* \_SB_.AMWA.TMPV */
            Return (CBE0) /* \_SB_.AMWA.CBE0 */
        }

        Method (B2HV, 0, NotSerialized)
        {
            If ((TMPV == 0x04))
            {
                TMPV = 0x03
            }

            If ((TMPV == 0x08))
            {
                TMPV = 0x04
            }

            If ((TMPV == 0x10))
            {
                TMPV = 0x05
            }

            If ((TMPV == 0x20))
            {
                TMPV = 0x06
            }

            If ((TMPV == 0x40))
            {
                TMPV = 0x07
            }

            If ((TMPV == 0x80))
            {
                TMPV = 0x08
            }
        }

        Method (WMBJ, 3, NotSerialized)
        {
            BER2 = 0x01
            Return (CBE0) /* \_SB_.AMWA.CBE0 */
        }
    }

    Scope (\_SB.AMW0)
    {
        OperationRegion (KBIO, SystemIO, 0x6C, 0x01)
        Field (KBIO, ByteAcc, Lock, Preserve)
        {
                ,   5, 
            ECEP,   1
        }

        OperationRegion (RAMS, EmbeddedControl, 0x00, 0xFF)
        Field (RAMS, ByteAcc, Lock, Preserve)
        {
            CMD1,   8, 
            Offset (0x08), 
            DAT2,   8, 
            DAT3,   8, 
            Offset (0x4E), 
            SDID,   8
        }

        Method (WCOD, 0, NotSerialized)
        {
            Local0 = 0x00
            If (ECEP)
            {
                If (\ECON)
                {
                    Local0 = SDID /* \_SB_.AMW0.SDID */
                }
                Else
                {
                    Local0 = RBEC (0x4E)
                }
            }

            If ((Local0 == 0x00))
            {
                Return (0x00)
            }

            If ((Local0 < 0x20))
            {
                While (One)
                {
                    Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler
                    _T_0 = (Local0 & 0xFF)
                    If ((_T_0 == 0x10))
                    {
                        \_SB.PCI0.LPC0.EC0._Q10 ()
                    }
                    ElseIf ((_T_0 == 0x19))
                    {
                        \_SB.PCI0.LPC0.EC0._Q19 ()
                    }
                    ElseIf ((_T_0 == 0x1C))
                    {
                        \_SB.PCI0.LPC0.EC0._Q1C ()
                    }
                    ElseIf ((_T_0 == 0x1D))
                    {
                        \_SB.PCI0.LPC0.EC0._Q1D ()
                    }

                    Break
                }
            }
            ElseIf ((Local0 < 0x30))
            {
                While (One)
                {
                    Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler
                    _T_1 = (Local0 & 0xFF)
                    If ((_T_1 == 0x23))
                    {
                        \_SB.PCI0.LPC0.EC0._Q23 ()
                    }

                    Break
                }
            }
            ElseIf ((Local0 < 0x40))
            {
                While (One)
                {
                    Name (_T_2, 0x00)  // _T_x: Emitted by ASL Compiler
                    _T_2 = (Local0 & 0xFF)
                    If ((_T_2 == 0x32))
                    {
                        \_SB.PCI0.LPC0.EC0._Q32 ()
                    }
                    ElseIf ((_T_2 == 0x33))
                    {
                        \_SB.PCI0.LPC0.EC0._Q33 ()
                    }
                    ElseIf ((_T_2 == 0x34))
                    {
                        \_SB.PCI0.LPC0.EC0._Q34 ()
                    }
                    ElseIf ((_T_2 == 0x35))
                    {
                        \_SB.PCI0.LPC0.EC0._Q35 ()
                    }
                    ElseIf ((_T_2 == 0x36))
                    {
                        \_SB.PCI0.LPC0.EC0._Q36 ()
                    }

                    Break
                }
            }
            ElseIf ((Local0 < 0x50))
            {
                While (One)
                {
                    Name (_T_3, 0x00)  // _T_x: Emitted by ASL Compiler
                    _T_3 = (Local0 & 0xFF)
                    If ((_T_3 == 0x40))
                    {
                        \_SB.PCI0.LPC0.EC0._Q40 ()
                    }
                    ElseIf ((_T_3 == 0x41))
                    {
                        \_SB.PCI0.LPC0.EC0._Q41 ()
                    }
                    ElseIf ((_T_3 == 0x48))
                    {
                        \_SB.PCI0.LPC0.EC0._Q48 ()
                    }
                    ElseIf ((_T_3 == 0x4C))
                    {
                        \_SB.PCI0.LPC0.EC0._Q4C ()
                    }
                    ElseIf ((_T_3 == 0x4D))
                    {
                        \_SB.PCI0.LPC0.EC0._Q4D ()
                    }

                    Break
                }
            }
            ElseIf ((Local0 < 0x60))
            {
                While (One)
                {
                    Name (_T_4, 0x00)  // _T_x: Emitted by ASL Compiler
                    _T_4 = (Local0 & 0xFF)
                    If ((_T_4 == 0x50))
                    {
                        \_SB.PCI0.LPC0.EC0._Q50 ()
                    }
                    ElseIf ((_T_4 == 0x51))
                    {
                        \_SB.PCI0.LPC0.EC0._Q51 ()
                    }
                    ElseIf ((_T_4 == 0x52))
                    {
                        \_SB.PCI0.LPC0.EC0._Q52 ()
                    }
                    ElseIf ((_T_4 == 0x53))
                    {
                        \_SB.PCI0.LPC0.EC0._Q53 ()
                    }
                    ElseIf ((_T_4 == 0x5C))
                    {
                        \_SB.PCI0.LPC0.EC0._Q5C ()
                    }

                    Break
                }
            }

            Return (Local0)
        }
    }

    Scope (\)
    {
        OperationRegion (CMIO, SystemIO, 0x72, 0x02)
        Field (CMIO, ByteAcc, Lock, Preserve)
        {
            CINX,   8, 
            CDAT,   8
        }

        IndexField (CINX, CDAT, ByteAcc, NoLock, Preserve)
        {
            Offset (0x90), 
            CMX0,   32, 
            CMX1,   32, 
            CMX2,   32, 
            CMX3,   32, 
            CMX4,   32, 
            CMX5,   32, 
            CMX6,   32, 
            CMX7,   32
        }

        Method (WB15, 6, NotSerialized)
        {
            CreateDWordField (Arg0, 0x00, OEAX)
            CreateDWordField (Arg0, 0x04, OEBX)
            CreateDWordField (Arg0, 0x08, OECX)
            CreateDWordField (Arg0, 0x0C, OEDX)
            CreateDWordField (Arg0, 0x10, OFLG)
            CreateDWordField (Arg0, 0x14, OESI)
            CreateDWordField (Arg0, 0x18, OEDI)
            OFLG = 0x01
            Local6 = (Arg1 >> 0x08)
            Local6 &= 0xFF
            If ((Local6 == 0x00))
            {
                OECX = CMX0 /* \CMX0 */
                OEDX = CMX1 /* \CMX1 */
                OESI = CMX2 /* \CMX2 */
                OEDI = CMX3 /* \CMX3 */
                OFLG = 0x00
                Return (0x00)
            }

            If ((Local6 == 0x10))
            {
                OECX = CMX4 /* \CMX4 */
                OEDX = CMX5 /* \CMX5 */
                OESI = CMX6 /* \CMX6 */
                OEDI = CMX7 /* \CMX7 */
                OFLG = 0x00
                Return (0x00)
            }

            If ((Local6 == 0x01))
            {
                CMX0 = Arg2
                CMX1 = Arg3
                CMX2 = Arg4
                CMX3 = Arg5
                OFLG = 0x00
                Return (0x00)
            }

            If ((Local6 == 0x11))
            {
                CMX4 = Arg2
                CMX5 = Arg3
                CMX6 = Arg4
                CMX7 = Arg5
                OFLG = 0x00
                Return (0x00)
            }
        }
    }

    Scope (\_SB.AMWA)
    {
        Name (B0UC, Buffer (0x46)
        {
            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0040 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00               // ......
        })
        Method (WMC9, 3, NotSerialized)
        {
            P80H = 0xC9
            BER2 = 0x00
            If ((Arg1 == 0x01))
            {
                CreateDWordField (Arg2, 0x00, PE04)
                If ((PE04 == 0x00))
                {
                    Local0 = I15H (0x05, 0x9610, 0x0107, 0x00, 0x00)
                }

                If ((PE04 == 0x01))
                {
                    Local0 = I15H (0x05, 0x9610, 0x0108, 0x00, 0x00)
                }

                If ((Local0 & 0x01))
                {
                    BUF0 = 0x00
                }
                Else
                {
                    BUF0 = 0x01
                }

                BER2 = 0x00
                Return (CBE0) /* \_SB_.AMWA.CBE0 */
            }

            If ((Arg1 == 0x02))
            {
                CreateDWordField (Arg2, 0x00, PS04)
                Local0 = WS2C (Arg2, 0x08)
                If ((PS04 == 0x00))
                {
                    I15H (0x05, 0x9610, 0x0207, Local0, 0x00)
                }

                If ((PS04 == 0x01))
                {
                    I15H (0x05, 0x9610, 0x0208, Local0, 0x00)
                }

                BER2 = 0x00
                Return (CBE0) /* \_SB_.AMWA.CBE0 */
            }

            If ((Arg1 == 0x03))
            {
                CreateDWordField (Arg2, 0x00, PC04)
                Local0 = WS2C (Arg2, 0x08)
                If ((PC04 == 0x00))
                {
                    Local0 = I15H (0x05, 0x9610, 0x0307, Local0, 0x00)
                }

                If ((PC04 == 0x01))
                {
                    Local0 = I15H (0x05, 0x9610, 0x0308, Local0, 0x00)
                }

                If ((Local0 & 0x01))
                {
                    BUF0 = 0x01
                }
                Else
                {
                    BUF0 = 0x00
                }

                BER2 = 0x00
                Return (CBE0) /* \_SB_.AMWA.CBE0 */
            }

            If ((Arg1 == 0x04))
            {
                CreateDWordField (CBE1, 0x10, GB04)
                GB04 = 0x00
                I15H (0x05, 0x9610, 0x17, 0x00, 0x00)
                RC2H (0x10)
                BER2 = 0x00
                Return (CBE1) /* \_SB_.AMWA.CBE1 */
            }

            If ((Arg1 == 0x05))
            {
                Local0 = WH2C (Arg2, 0x00)
                I15H (0x05, 0x9610, 0x0117, 0x00, 0x00)
                BER2 = 0x00
                Return (CBE0) /* \_SB_.AMWA.CBE0 */
            }

            If ((Arg1 == 0x0A))
            {
                Local0 = I15H (0x03, 0x9610, 0x16, 0x00, 0x00)
                If ((Local0 & 0xFF))
                {
                    BUF0 = 0x00
                }
                Else
                {
                    BUF0 = 0x01
                }

                BER2 = 0x00
                Return (CBE0) /* \_SB_.AMWA.CBE0 */
            }
        }

        Method (WS2C, 2, NotSerialized)
        {
            Local0 = SizeOf (Arg0)
            Local0++
            Name (STR1, Buffer (Local0){})
            STR1 = Arg0
            Local1 = Arg1
            Local2 = Zero
            While ((Local1 < Local0))
            {
                Local3 = DerefOf (STR1 [Local1])
                If (Local3)
                {
                    WRCB (Local2, Local3)
                    Local2++
                }

                Local1++
            }

            If ((Local2 < 0x20))
            {
                WRCB (Local2, 0x00)
            }

            Return (Local2)
        }

        Method (WH2C, 2, NotSerialized)
        {
            Local0 = SizeOf (Arg0)
            Local0++
            Name (STR1, Buffer (Local0){})
            STR1 = Arg0
            Local1 = 0x00
            Local2 = Zero
            While ((Local1 < Local0))
            {
                Local3 = DerefOf (STR1 [Local1])
                WRCB (Local2, Local3)
                Local2++
                Local1++
                If ((Local3 == 0xFF))
                {
                    Break
                }
            }

            If ((Local2 < 0x20))
            {
                WRCB (Local2, 0xFF)
            }

            Return (Local2)
        }

        Method (RC2H, 1, NotSerialized)
        {
            Local0 = Arg0
            If ((Local0 >= 0x20))
            {
                Local0 = 0x20
            }

            Local1 = Zero
            While ((Local1 < Local0))
            {
                Local2 = RDCB (Local1)
                CBE1 [Local1] = Local2
                Local1++
                If ((Local2 == 0xFF))
                {
                    Break
                }
            }

            Return (Local1)
        }

        Method (RC2U, 1, NotSerialized)
        {
            Local0 = 0x20
            While (Local0)
            {
                Local0--
                If ((RDCB (Local0) != 0x20))
                {
                    Local0++
                    Break
                }
            }

            Local1 = Zero
            Local2 = Arg0
            While ((Local1 < Local0))
            {
                Local3 = RDCB (Local1)
                B0UC [Local2] = Local3
                Local2++
                B0UC [Local2] = 0x00
                Local2++
                If ((Local3 == 0x00))
                {
                    Break
                }

                Local1++
            }

            If ((Local1 == 0x00))
            {
                Local1++
            }

            Local1 <<= 0x01
            Return (Local1)
        }

        Method (WRCB, 2, NotSerialized)
        {
            If ((Arg0 >= 0x20))
            {
                Return (0x00)
            }

            Acquire (MSMI, 0xFFFF)
            Local0 = (Arg0 + 0x90)
            CINX = Local0
            CDAT = Arg1
            Release (MSMI)
        }

        Method (RDCB, 1, NotSerialized)
        {
            If ((Arg0 >= 0x20))
            {
                Return (0x00)
            }

            Acquire (MSMI, 0xFFFF)
            Local0 = (Arg0 + 0x90)
            CINX = Local0
            Local0 = CDAT /* \CDAT */
            Release (MSMI)
            Return (Local0)
        }
    }

    Scope (\_SB.AMWA)
    {
        Name (WQEE, Buffer (0x042A)
        {
            /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
            /* 0008 */  0x1A, 0x04, 0x00, 0x00, 0x38, 0x10, 0x00, 0x00,  // ....8...
            /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
            /* 0018 */  0x18, 0xCF, 0x87, 0x00, 0x01, 0x06, 0x18, 0x42,  // .......B
            /* 0020 */  0x10, 0x07, 0x10, 0x22, 0x21, 0x04, 0x12, 0x01,  // ..."!...
            /* 0028 */  0xA1, 0xC8, 0x2C, 0x0C, 0x86, 0x10, 0x38, 0x2E,  // ..,...8.
            /* 0030 */  0x24, 0x15, 0x07, 0x85, 0x12, 0x02, 0xA1, 0xFE,  // $.......
            /* 0038 */  0x04, 0xF2, 0x2B, 0x00, 0xA1, 0x43, 0x01, 0x32,  // ..+..C.2
            /* 0040 */  0x05, 0x18, 0x14, 0xE0, 0x14, 0x41, 0x04, 0xBD,  // .....A..
            /* 0048 */  0x0A, 0xB0, 0x29, 0xC0, 0xA4, 0x00, 0x8B, 0x02,  // ..).....
            /* 0050 */  0xB4, 0x0B, 0xB0, 0x2C, 0x40, 0xB7, 0x00, 0xE9,  // ...,@...
            /* 0058 */  0xB0, 0x44, 0x24, 0x38, 0x4A, 0x0C, 0x38, 0x4A,  // .D$8J.8J
            /* 0060 */  0x27, 0xB6, 0x70, 0xC3, 0x06, 0x2F, 0x14, 0x45,  // '.p../.E
            /* 0068 */  0x33, 0x88, 0x92, 0xA0, 0x72, 0x01, 0xBE, 0x11,  // 3...r...
            /* 0070 */  0x04, 0x5E, 0xAE, 0x00, 0xC9, 0x13, 0x90, 0x66,  // .^.....f
            /* 0078 */  0x01, 0x86, 0x05, 0x58, 0x17, 0x20, 0x7B, 0x08,  // ...X. {.
            /* 0080 */  0x54, 0xEA, 0x10, 0x50, 0x72, 0x86, 0x80, 0x1A,  // T..Pr...
            /* 0088 */  0x40, 0xAB, 0x13, 0x10, 0x7E, 0xA5, 0x53, 0x42,  // @...~.SB
            /* 0090 */  0x12, 0x84, 0x33, 0x56, 0xF1, 0xF8, 0x9A, 0x45,  // ..3V...E
            /* 0098 */  0xD3, 0x73, 0x92, 0x73, 0x0C, 0x39, 0x1E, 0x17,  // .s.s.9..
            /* 00A0 */  0x7A, 0x10, 0x3C, 0xAA, 0x04, 0x10, 0x26, 0x7F,  // z.<...&.
            /* 00A8 */  0xC8, 0x0A, 0x07, 0x83, 0xD2, 0x30, 0x16, 0xEA,  // .....0..
            /* 00B0 */  0x62, 0xD4, 0xA8, 0x91, 0xB2, 0x01, 0x19, 0xA2,  // b.......
            /* 00B8 */  0x24, 0x38, 0xD4, 0xA8, 0x2D, 0x51, 0x80, 0xF9,  // $8..-Q..
            /* 00C0 */  0x71, 0x68, 0x76, 0x6D, 0x8F, 0x85, 0x40, 0x32,  // qhvm..@2
            /* 00C8 */  0x69, 0x43, 0x41, 0x49, 0x81, 0xD0, 0xD8, 0xCE,  // iCAI....
            /* 00D0 */  0xD4, 0x33, 0x8A, 0x78, 0xA4, 0x86, 0x49, 0xE0,  // .3.x..I.
            /* 00D8 */  0x51, 0x44, 0x36, 0x1A, 0x87, 0xC6, 0x0E, 0xC3,  // QD6.....
            /* 00E0 */  0xC3, 0x0C, 0x76, 0x10, 0x87, 0x71, 0xCC, 0x91,  // ..v..q..
            /* 00E8 */  0x13, 0x78, 0x42, 0x47, 0x7A, 0xE4, 0x85, 0xCD,  // .xBGz...
            /* 00F0 */  0x53, 0xA8, 0x31, 0x9A, 0x83, 0x22, 0x82, 0x8F,  // S.1.."..
            /* 00F8 */  0x02, 0xE8, 0x31, 0x85, 0x3D, 0xDA, 0xD8, 0xE7,  // ..1.=...
            /* 0100 */  0x6B, 0xE1, 0x83, 0x15, 0xC6, 0x11, 0x1C, 0x57,  // k......W
            /* 0108 */  0x82, 0xFF, 0xFF, 0x89, 0x1F, 0x4A, 0x8F, 0x70,  // .....J.p
            /* 0110 */  0x12, 0x34, 0x45, 0x0A, 0x72, 0xD4, 0x18, 0x59,  // .4E.r..Y
            /* 0118 */  0x38, 0xD2, 0x3A, 0x2B, 0x32, 0x77, 0x03, 0x1B,  // 8.:+2w..
            /* 0120 */  0xA8, 0x31, 0x01, 0xBA, 0x46, 0x22, 0x82, 0xE3,  // .1..F"..
            /* 0128 */  0x39, 0x10, 0x8C, 0x0C, 0x08, 0x79, 0x3E, 0x17,  // 9....y>.
            /* 0130 */  0x68, 0x84, 0x26, 0xB0, 0x7B, 0x01, 0xDA, 0x04,  // h.&.{...
            /* 0138 */  0x78, 0x83, 0xD0, 0x38, 0x22, 0x04, 0x6E, 0x6D,  // x..8".nm
            /* 0140 */  0x12, 0xB2, 0x85, 0x43, 0xE6, 0x15, 0x2B, 0x4A,  // ...C..+J
            /* 0148 */  0x8C, 0x63, 0x3A, 0xB2, 0x1A, 0x51, 0x84, 0x54,  // .c:..Q.T
            /* 0150 */  0xD9, 0xCD, 0x40, 0x08, 0x51, 0x62, 0x86, 0x8C,  // ..@.Qb..
            /* 0158 */  0x18, 0x2C, 0xC8, 0x63, 0x44, 0x0C, 0x0F, 0xD1,  // .,.cD...
            /* 0160 */  0x70, 0x91, 0xDA, 0x1F, 0x04, 0x91, 0xF7, 0x98,  // p.......
            /* 0168 */  0xD0, 0x79, 0xC0, 0x91, 0x46, 0x83, 0x3A, 0x2C,  // .y..F.:,
            /* 0170 */  0xF8, 0x4C, 0xE0, 0xC9, 0x3D, 0x23, 0x78, 0x6C,  // .L..=#xl
            /* 0178 */  0xE7, 0x1C, 0xE4, 0x3C, 0x8F, 0xED, 0x11, 0xE2,  // ...<....
            /* 0180 */  0x61, 0xC0, 0xC3, 0x66, 0xB7, 0x04, 0x9F, 0x2D,  // a..f...-
            /* 0188 */  0x7C, 0x3A, 0xC0, 0xBB, 0x06, 0xD4, 0xB5, 0xE0,  // |:......
            /* 0190 */  0xA1, 0x80, 0x4D, 0x32, 0x1C, 0x66, 0x88, 0x1E,  // ..M2.f..
            /* 0198 */  0x6B, 0xB8, 0x13, 0x38, 0x44, 0x06, 0xE8, 0xB1,  // k..8D...
            /* 01A0 */  0xFA, 0x3C, 0x80, 0x9B, 0xDB, 0xC9, 0x1C, 0xFA,  // .<......
            /* 01A8 */  0xFB, 0x44, 0xB3, 0x37, 0x09, 0x42, 0x70, 0x3C,  // .D.7.Bp<
            /* 01B0 */  0xBE, 0x44, 0xB0, 0x09, 0x3F, 0x3A, 0x90, 0x41,  // .D..?:.A
            /* 01B8 */  0xA0, 0x46, 0x66, 0x68, 0x0F, 0xF5, 0xB4, 0x5E,  // .Ffh...^
            /* 01C0 */  0x06, 0x7C, 0x0C, 0x30, 0x81, 0xC5, 0x42, 0x48,  // .|.0..BH
            /* 01C8 */  0x01, 0x84, 0xC6, 0x03, 0x7E, 0xC5, 0x07, 0x0F,  // ....~...
            /* 01D0 */  0x72, 0x63, 0xF0, 0x7C, 0x7D, 0x86, 0xD0, 0xC9,  // rc.|}...
            /* 01D8 */  0x42, 0x46, 0x56, 0xE1, 0xF1, 0xD0, 0xE3, 0x82,  // BFV.....
            /* 01E0 */  0xEF, 0x08, 0x98, 0x0B, 0x83, 0x87, 0xEE, 0x21,  // .......!
            /* 01E8 */  0x3D, 0x1F, 0x58, 0xD2, 0x21, 0x83, 0xFE, 0xFF,  // =.X.!...
            /* 01F0 */  0x45, 0x9D, 0x56, 0xF8, 0xA1, 0x82, 0x9E, 0x27,  // E.V....'
            /* 01F8 */  0x18, 0x6C, 0xD0, 0xB0, 0x1E, 0xCC, 0x39, 0xF9,  // .l....9.
            /* 0200 */  0xCF, 0xE2, 0xB1, 0xC1, 0x07, 0xC4, 0x7B, 0x9F,  // ......{.
            /* 0208 */  0x35, 0x19, 0xC1, 0xC9, 0x1A, 0xD0, 0x87, 0x07,  // 5.......
            /* 0210 */  0xDC, 0xA1, 0x02, 0xBC, 0x30, 0x87, 0xC5, 0xAF,  // ....0...
            /* 0218 */  0x15, 0x70, 0x0F, 0x0B, 0x6C, 0x94, 0x7C, 0x34,  // .p..l.|4
            /* 0220 */  0x1E, 0xC2, 0x59, 0x3C, 0x0D, 0x18, 0xC6, 0xE8,  // ..Y<....
            /* 0228 */  0x4F, 0x01, 0xB0, 0x6F, 0x18, 0x1E, 0x8B, 0x0F,  // O..o....
            /* 0230 */  0x3A, 0x3E, 0xE9, 0x80, 0x63, 0x70, 0xFC, 0x0A,  // :>..cp..
            /* 0238 */  0x83, 0x3B, 0xE9, 0x00, 0x8F, 0xB9, 0x3E, 0xE9,  // .;....>.
            /* 0240 */  0x80, 0xED, 0x7C, 0xC0, 0x4E, 0x39, 0xD0, 0x4C,  // ..|.N9.L
            /* 0248 */  0x80, 0xB0, 0x00, 0x6F, 0x04, 0xC9, 0x5A, 0x37,  // ...o..Z7
            /* 0250 */  0x85, 0xF1, 0xFF, 0xFF, 0x94, 0x03, 0xB8, 0xBA,  // ........
            /* 0258 */  0x4B, 0xF8, 0x04, 0x01, 0x56, 0x8C, 0xE7, 0x0D,  // K...V...
            /* 0260 */  0x8B, 0x06, 0xD4, 0x08, 0x9E, 0x1F, 0x60, 0x1F,  // ......`.
            /* 0268 */  0x73, 0xE0, 0x5F, 0x6D, 0x7C, 0xBE, 0x09, 0x72,  // s._m|..r
            /* 0270 */  0x52, 0x41, 0x0E, 0xE5, 0xF5, 0xE6, 0xC9, 0x21,  // RA.....!
            /* 0278 */  0xCC, 0x8B, 0xCE, 0x13, 0x8E, 0x87, 0x56, 0x21,  // ......V!
            /* 0280 */  0x88, 0x9C, 0x1D, 0x73, 0x08, 0xD2, 0x03, 0x8E,  // ...s....
            /* 0288 */  0x51, 0x0C, 0x72, 0x66, 0x51, 0xA3, 0x45, 0x31,  // Q.rfQ.E1
            /* 0290 */  0x5E, 0x90, 0x68, 0x11, 0x8F, 0xE0, 0x31, 0x87,  // ^.h...1.
            /* 0298 */  0xC5, 0x3A, 0x10, 0xE8, 0x1F, 0xE5, 0x63, 0x0E,  // .:....c.
            /* 02A0 */  0x70, 0xFF, 0xFF, 0x1F, 0x73, 0x00, 0x47, 0xF2,  // p...s.G.
            /* 02A8 */  0x8E, 0x24, 0xA0, 0x1A, 0x15, 0xBF, 0x32, 0xB0,  // .$....2.
            /* 02B0 */  0x33, 0x09, 0x30, 0x89, 0xF2, 0xF4, 0xD0, 0x38,  // 3.0....8
            /* 02B8 */  0xAD, 0xF1, 0x39, 0x20, 0x1B, 0x27, 0x21, 0x3A,  // ..9 .'!:
            /* 02C0 */  0x08, 0x2B, 0xA1, 0xD2, 0x08, 0xDE, 0x23, 0x7C,  // .+....#|
            /* 02C8 */  0x6B, 0x88, 0xFB, 0x6C, 0xE0, 0xF9, 0x60, 0xD2,  // k..l..`.
            /* 02D0 */  0x1F, 0x14, 0x74, 0xFE, 0x31, 0xB8, 0x73, 0x93,  // ..t.1.s.
            /* 02D8 */  0x28, 0xF7, 0x80, 0x28, 0xBC, 0x93, 0x1E, 0x83,  // (..(....
            /* 02E0 */  0x28, 0x88, 0x01, 0x1D, 0x03, 0x42, 0x56, 0x0E,  // (....BV.
            /* 02E8 */  0x02, 0xE8, 0xEB, 0x84, 0x8F, 0x0C, 0x3E, 0x67,  // ......>g
            /* 02F0 */  0x44, 0x39, 0x23, 0x1F, 0x30, 0x1E, 0x17, 0xD8,  // D9#.0...
            /* 02F8 */  0x70, 0x7C, 0x10, 0xE0, 0x07, 0x14, 0xDF, 0x0C,  // p|......
            /* 0300 */  0x8C, 0x6D, 0x35, 0xC7, 0x1D, 0x14, 0x98, 0xE1,  // .m5.....
            /* 0308 */  0x5F, 0x60, 0x4C, 0xE0, 0x7B, 0xC6, 0xCB, 0x00,  // _`L.{...
            /* 0310 */  0xBC, 0xFF, 0xFF, 0x6D, 0x07, 0x7B, 0xC6, 0x78,  // ...m.{.x
            /* 0318 */  0x2C, 0xB1, 0xBE, 0xC3, 0x00, 0x28, 0x80, 0x3C,  // ,....(.<
            /* 0320 */  0x7D, 0x9F, 0x68, 0x1E, 0x01, 0xD8, 0x18, 0x1E,  // }.h.....
            /* 0328 */  0x6A, 0x8C, 0x66, 0x74, 0x1E, 0x7F, 0xAE, 0xA8,  // j.ft....
            /* 0330 */  0xC0, 0x73, 0xA5, 0x20, 0x9E, 0xAB, 0xC3, 0x40,  // .s. ...@
            /* 0338 */  0xC8, 0xC9, 0x5C, 0x51, 0xB7, 0x17, 0x8F, 0xC8,  // ..\Q....
            /* 0340 */  0x3E, 0xA7, 0x4A, 0x06, 0xCB, 0x09, 0xA2, 0xBC,  // >.J.....
            /* 0348 */  0x6A, 0xC0, 0x3A, 0x08, 0x44, 0x64, 0xF3, 0xF0,  // j.:.Dd..
            /* 0350 */  0x5D, 0x09, 0x3F, 0x5B, 0x3E, 0x18, 0x5F, 0x25,  // ].?[>._%
            /* 0358 */  0xE0, 0x0F, 0x97, 0x9F, 0x4A, 0xDE, 0x4D, 0x12,  // ....J.M.
            /* 0360 */  0x58, 0xE0, 0x74, 0x41, 0x0E, 0x8F, 0x11, 0xB4,  // X.tA....
            /* 0368 */  0x1E, 0x59, 0xB8, 0x4B, 0xD1, 0x71, 0xF1, 0xDB,  // .Y.K.q..
            /* 0370 */  0x81, 0x6F, 0x3C, 0xEC, 0x4E, 0x83, 0xBB, 0x88,  // .o<.N...
            /* 0378 */  0x61, 0x60, 0x3D, 0x52, 0x0E, 0x6B, 0xB4, 0xB0,  // a`=R.k..
            /* 0380 */  0x07, 0xFC, 0xC6, 0xE1, 0xE3, 0x8A, 0x67, 0x66,  // ......gf
            /* 0388 */  0x8C, 0xB0, 0xBE, 0xA7, 0x80, 0xE3, 0x4E, 0x06,  // ......N.
            /* 0390 */  0x3F, 0xC0, 0xD8, 0x10, 0xFF, 0xFF, 0x2B, 0x10,  // ?.....+.
            /* 0398 */  0xF8, 0xCE, 0x1A, 0xEC, 0x4A, 0x66, 0x90, 0x17,  // ....Jf..
            /* 03A0 */  0x25, 0x9F, 0x6B, 0x8C, 0x1E, 0xE8, 0x7D, 0x03,  // %.k...}.
            /* 03A8 */  0x7F, 0x13, 0x82, 0x7D, 0x03, 0x81, 0x33, 0x14,  // ...}..3.
            /* 03B0 */  0xDF, 0x40, 0x80, 0xC3, 0x31, 0x02, 0x77, 0x03,  // .@..1.w.
            /* 03B8 */  0x01, 0xD6, 0x77, 0x08, 0x76, 0x03, 0x01, 0x96,  // ..w.v...
            /* 03C0 */  0xA7, 0x17, 0xDC, 0x0D, 0x04, 0x9C, 0xFF, 0xFF,  // ........
            /* 03C8 */  0x1B, 0x08, 0x70, 0xB9, 0xBF, 0xB0, 0x1B, 0x08,  // ..p.....
            /* 03D0 */  0x30, 0x1F, 0xB5, 0x6F, 0x20, 0x80, 0xA5, 0xB3,  // 0..o ...
            /* 03D8 */  0x06, 0xBB, 0x81, 0x80, 0x5F, 0xA1, 0x4D, 0x9F,  // ...._.M.
            /* 03E0 */  0x1A, 0x8D, 0x5A, 0x35, 0x28, 0x53, 0xA3, 0x4C,  // ..Z5(S.L
            /* 03E8 */  0x83, 0x5A, 0x7D, 0x2A, 0x35, 0x66, 0xCC, 0xC6,  // .Z}*5f..
            /* 03F0 */  0xE8, 0xBD, 0x74, 0x8D, 0xDD, 0x71, 0x40, 0x68,  // ..t..q@h
            /* 03F8 */  0xF0, 0x87, 0x9C, 0x40, 0x1C, 0xDE, 0x03, 0x08,  // ...@....
            /* 0400 */  0x93, 0xBE, 0x38, 0x81, 0x38, 0xE6, 0xA1, 0x51,  // ..8.8..Q
            /* 0408 */  0x46, 0x40, 0xF4, 0xFF, 0xCF, 0x0C, 0x22, 0x20,  // F@...." 
            /* 0410 */  0x27, 0x54, 0x01, 0xC4, 0xF2, 0x82, 0x08, 0xC8,  // 'T......
            /* 0418 */  0x4A, 0xD6, 0x20, 0x20, 0xCB, 0x02, 0x11, 0x90,  // J.  ....
            /* 0420 */  0x45, 0xE8, 0x00, 0x62, 0x92, 0x40, 0x04, 0xE4,  // E..b.@..
            /* 0428 */  0xFF, 0x3F                                       // .?
        })
    }

    Scope (\)
    {
        Name (\BCLP, Package (0x0C)
        {
            0x64, 
            0x3C, 
            0x0A, 
            0x14, 
            0x1E, 
            0x28, 
            0x32, 
            0x3C, 
            0x46, 
            0x50, 
            0x5A, 
            0x64
        })
        Name (\MAXL, 0x0B)
    }

    Scope (\_SB.PCI0)
    {
        Method (GOST, 0, NotSerialized)
        {
            Local0 = 0x00
            If (((\_SB.TPOS > 0x04) || (\_SB.TPOS < 0x40)))
            {
                Local0 = 0x01
            }

            If ((\_SB.TPOS == 0x40))
            {
                Local0 = 0x02
            }

            If ((\_SB.TPOS == 0x50))
            {
                Local0 = 0x03
            }

            If ((\_SB.TPOS == 0x80))
            {
                Local0 = 0x40
            }

            Return (Local0)
        }
    }

    Scope (\_SB.PCI0.EHC1)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Device (PRT4)
            {
                Name (_ADR, 0x05)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, ToPLD (
                    PLD_Revision           = 0x1,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x0,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "UNKNOWN",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "ROUND",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0)
)  // _PLD: Physical Location of Device
            }
        }
    }

    Scope (\_SB.PCI0.EHC2)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Device (PRT2)
            {
                Name (_ADR, 0x03)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, ToPLD (
                    PLD_Revision           = 0x1,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x0,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "UNKNOWN",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "ROUND",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0)
)  // _PLD: Physical Location of Device
            }

            Device (PRT4)
            {
                Name (_ADR, 0x05)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, ToPLD (
                    PLD_Revision           = 0x1,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x0,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "UNKNOWN",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "ROUND",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0)
)  // _PLD: Physical Location of Device
            }
        }
    }

    Scope (\_SB.PCI0.EHC3)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Device (PRT1)
            {
                Name (_ADR, 0x02)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, ToPLD (
                    PLD_Revision           = 0x1,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x0,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "UNKNOWN",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "ROUND",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0)
)  // _PLD: Physical Location of Device
            }

            Device (PRT2)
            {
                Name (_ADR, 0x03)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, ToPLD (
                    PLD_Revision           = 0x1,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x0,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "UNKNOWN",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "ROUND",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0)
)  // _PLD: Physical Location of Device
                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x03)
                }
            }
        }
    }

    Scope (\_SB.PCI0.OHC1)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Device (PRT4)
            {
                Name (_ADR, 0x05)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, ToPLD (
                    PLD_Revision           = 0x1,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x0,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "UNKNOWN",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "ROUND",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0)
)  // _PLD: Physical Location of Device
            }
        }
    }

    Scope (\_SB.PCI0.OHC2)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Device (PRT2)
            {
                Name (_ADR, 0x03)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, ToPLD (
                    PLD_Revision           = 0x1,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x0,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "UNKNOWN",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "ROUND",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0)
)  // _PLD: Physical Location of Device
            }

            Device (PRT4)
            {
                Name (_ADR, 0x05)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, ToPLD (
                    PLD_Revision           = 0x1,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x0,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "UNKNOWN",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "ROUND",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0)
)  // _PLD: Physical Location of Device
            }
        }
    }

    Scope (\_SB.PCI0.OHC3)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Device (PRT1)
            {
                Name (_ADR, 0x02)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, ToPLD (
                    PLD_Revision           = 0x1,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x0,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "UNKNOWN",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "ROUND",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0)
)  // _PLD: Physical Location of Device
            }

            Device (PRT2)
            {
                Name (_ADR, 0x03)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, ToPLD (
                    PLD_Revision           = 0x1,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x0,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "UNKNOWN",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "ROUND",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0)
)  // _PLD: Physical Location of Device
                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x03)
                }
            }
        }
    }
}

