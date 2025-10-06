# Install a C Compiler on Windows

This guide explains how to install and set up a C compiler on **Windows** using **MSYS2**.  
It provides a modern, reliable GCC environment that works well with most tools and editors.

---

## 1. Download MSYS2

Go to [https://www.msys2.org](https://www.msys2.org) and download the installer for Windows.

Run the installer and follow the on-screen steps.  
When installation finishes, open the **MSYS2 UCRT64** terminal from the Start Menu.

---

## 2. Update the Package Database

Before installing anything, update the package manager and core system files:

```bash
pacman -Syu
