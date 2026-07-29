import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.ExplicitSolutionsCore

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure BoundaryCondition (S : EquilibriumSolidSystem) where
  boundaryRegion : Set S.configSpace
  prescribedDisplacement : S.configSpace → ℝ
  prescribedTraction : S.configSpace → ℝ

structure BoundaryValueSolution (S : EquilibriumSolidSystem) (B : BoundaryCondition S) where
  displacementField : S.configSpace → ℝ
  tractionField : S.configSpace → ℝ
  satisfiesEquilibrium : Prop
  satisfiesBoundary : Prop

structure BoundaryValueEvidence (S : EquilibriumSolidSystem) (B : BoundaryCondition S) (V : BoundaryValueSolution S B) where
  displacementFieldClosed : True
  tractionFieldClosed : True
  satisfiesEquilibriumClosed : V.satisfiesEquilibrium
  satisfiesBoundaryClosed : V.satisfiesBoundary

def BoundaryValueClosed (S : EquilibriumSolidSystem) (B : BoundaryCondition S) (V : BoundaryValueSolution S B) : Prop :=
  V.satisfiesEquilibrium ∧ V.satisfiesBoundary

theorem boundary_value_closed_from_evidence (S : EquilibriumSolidSystem) (B : BoundaryCondition S) (V : BoundaryValueSolution S B) (E : BoundaryValueEvidence S B V) : BoundaryValueClosed S B V := by
  exact And.intro E.satisfiesEquilibriumClosed E.satisfiesBoundaryClosed

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse