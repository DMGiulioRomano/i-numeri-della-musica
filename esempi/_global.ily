%% Impostazioni condivise per gli esempi musicali del volume.
%% Incluso da ogni esempio: \include "_global.ily"
\version "2.24.0"

#(set-global-staff-size 17)

\paper {
  indent = 0
  ragged-right = ##t
  print-page-number = ##f
}

\layout {
  \context {
    \Score
    \omit TimeSignature
    \override SpacingSpanner.strict-note-spacing = ##t
  }
  \context {
    \Staff
    \remove "Time_signature_engraver"
  }
}
