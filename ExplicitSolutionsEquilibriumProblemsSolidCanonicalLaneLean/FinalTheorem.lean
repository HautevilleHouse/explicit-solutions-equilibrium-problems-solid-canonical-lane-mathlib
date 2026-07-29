import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

def ConstrainedEquilibriumClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_equilibrium_endgame (A : AdmissibleClass) : ConstrainedEquilibriumClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
