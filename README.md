# FOF-synth

FOF (Fonction d'Onde Formantique) synthesis was introduced by Xavier Rodet in 1984. It enables the creation of highly realistic and natural-sounding speech by modeling the vocal tract and its resonance frequencies, known as formants.

The formant wave-function (or FOF) is derived from a second-order filter, which describes the resonant frequencies
of the vocal tract. The equation for this wave-function is given by:

$$ h[n] = A[n] \cdot Ge^{-\alpha n} \cdot \sin (\omega_cn + \varphi) $$

where $A[n]$ is the amplitude envelope, $G$ is the gain, $\alpha$ controls the exponential damping, $\omega_c$ is the fundamental frequency, and $\varphi$ is the initial phase. This equation describes how the formant wave-function varies over time, allowing for the creation of complex and dynamic speech sounds.

When different FOFs are used in parallel to perform synthesis, each FOF is responsible for producing one of the formants in the synthetic sound. The FOFs are typically arranged in a way that each one is tuned to a different frequency, allowing them to produce the different resonances that make up the formants. This allows the FOFs to work together to create a more accurate and realistic imitation of human speech.

## Implementation

`FOF.m`, `FormantArray.m`, and `FOFsum.m` are functions used to synthesize one FOF. As examples, `Rodet.m` implements synthesis using parameters described in the 1984 paper and `vowels.m` synthesizes vowel sounds.


`synth.m` synthesizes an input array of notes in the following format:

```
% note: [vowel, freq, duration] with vowel = {1, 2, 3, 4, 5} for {a, e, i, o, u}
% notes: [note1; note2; ...]
```

Example parameters for the first few notes of Ave Maria are provided, and the results can be heard in `wavs/ave_maria.wav`.

<br> <br>

Originally written for MUMT501 (Fall 2022) at McGill University.
