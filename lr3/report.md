# 1. No DSP and DSP mult examples
## 1.1 Utilization and schematic compare
  - *No DSP mult utilization and schematic*
    - ![/pic/no_dsp_scheme.png](pic/no_dsp_scheme.png) <br>
    - ![/pic/no_dsp_scheme2.png](pic/no_dsp_scheme2.png) <br>
  - *DSP mult utilization and schematic*
    - ![/pic/dsp_scheme.png](pic/dsp_scheme.png) <br>
    - ![/pic/dsp_scheme2.png](pic/dsp_scheme2.png) <br>
## 1.2 Utilization and schematic compare increased width (2x)
  - *No DSP mult utilization and schematic*
    - ![/pic/no_dsp_scheme_width.png](pic/no_dsp_scheme_width.png) <br>
  - *DSP mult utilization and schematic*
    - ![/pic/dsp_scheme_width.png](pic/dsp_scheme_width.png) <br>
## 1.3 Why no FFs in DSP scheme?
  - *They are inside DSP block*
    - ![dsp_block_struct](pic/dsp_block_struct.png) <br>
## 1.4 Mult with async reset
  - *DSP mult scheme with async reset*
    - ![dsp_async_reset](pic/dsp_async_reset.png) <br>
    - ![dsp_async_reset2](pic/dsp_async_reset2.png) <br>
## 1.5 Timing analyzis for no-DSP and DSP examples
  - *No DSP timing analyzis*
    - ![no_dsp_timing_analyzis](pic/no_dsp_timing_analyzis.png) <br>
  - *DSP timing analyzis*
    - ![dsp_timing_analyzis](pic/dsp_timing_analyzis.png) <br>
<br>

# 2. Pre-adder example
## 2.1 Pre-adder schematic
  - ![pre_adder_scheme](pic/pre_adder_scheme.png) <br>
  - *There is no adder in scheme because it's inside DSP block*

# 3. Mult Accumulate
## 3.1 Mult Accumulate schematic
  - ![accumulate_scheme](pic/accumulate_scheme.png) <br>
  - *Adding is implemented with ALU*
  - *`clear_i` is used for resetting*

# 4. SIMD in ALU
## 4.1 SIMD in ALU schematic
  - ![simd_alu_scheme](pic/simd_alu_scheme.png) <br>
## 4.2 SIMD in ALU schematic (width extended to W + 20)
  - ![simd_alu_scheme](pic/simd_alu_scheme_width.png) <br>

# 5. Pattern detector (compare with const)
  - ![pettern_detector_scheme](pic/pettern_detector_scheme.png) <br>
  - *Pattern detector is used for rounding or overflow detection*

