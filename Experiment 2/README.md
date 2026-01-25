## Experiment - 02

## Contents

1. Bit Plane Slicing with Reconstruction  
2. Shannon–Fano Coding  
3. Huffman Coding (Manual Implementation)  
4. Discrete Wavelet Transform (DWT)  
5. Tambola (Housie) Ticket Generator  

## 1️⃣ Bit Plane Slicing

### 📖 Description
Bit Plane Slicing is a technique where a grayscale image is decomposed into its individual bit planes.  
Each pixel of an 8-bit image is represented using 8 bit planes ranging from LSB to MSB.

### 🔍 Key Points
- MSB planes contain major visual information  
- LSB planes contain fine details and noise  
- Useful in image compression and enhancement  

### 🛠 Features Implemented
- Extraction of all 8 bit planes  
- Image reconstruction using:
  - Higher bit planes (5–8)
  - All bit planes  

---

## 2️⃣ Shannon–Fano Coding

### 📖 Description
Shannon–Fano coding is a **lossless data compression technique** that assigns variable-length codes based on symbol probabilities.

### 🔍 Key Points
- Symbols are sorted in descending order of probability  
- Recursively divided into two groups  
- More probable symbols get shorter codes  

---

## 3️⃣ Huffman Coding (Manual)

### 📖 Description
Huffman coding is a **lossless and optimal prefix coding technique** that minimizes the average code length.

### 🔍 Key Points
- Two least-probable symbols are merged repeatedly  
- A binary tree is constructed bottom-up  
- Prefix-free and optimal codes are generated  

### 🛠 Features Implemented
- Manual tree construction  
- Recursive code generation  
- No built-in MATLAB Huffman functions used  

---

## 4️⃣ Discrete Wavelet Transform (DWT)

### 📖 Description
Discrete Wavelet Transform decomposes an image into different frequency subbands using wavelets.

### 🔍 Subbands
- **LL** – Approximation (low frequency)  
- **LH** – Vertical details  
- **HL** – Horizontal details  
- **HH** – Diagonal details  

### 🛠 Features Implemented
- 1-level 2D DWT using Haar wavelet  
- Image reconstruction using IDWT  

### 📌 Applications
- Image compression (JPEG2000)  
- Denoising  
- Feature extraction  

---

## 5️⃣ Tambola (Housie) Ticket Generator

### 📖 Description
This program generates a **standard Tambola ticket** following all official rules.

### 🎟 Ticket Rules
- 3 rows × 9 columns  
- 15 numbers per ticket  
- 5 numbers per row  
- Column-wise number ranges:
  - 1–9, 10–19, ..., 80–90  

### 🛠 Features Implemented
- Random number generation  
- Constraint-based placement  
- Valid Tambola ticket formation  

---

## 🧰 Tools & Requirements

- MATLAB (R2018 or later recommended)
- Image Processing Toolbox
- Wavelet Toolbox
