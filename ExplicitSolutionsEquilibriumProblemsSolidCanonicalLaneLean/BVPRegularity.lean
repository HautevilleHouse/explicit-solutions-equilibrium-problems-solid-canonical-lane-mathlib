import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure BVPRegularityPackage where
  domain : Type u
  boundaryConditions : Prop
  solutionSmoothness : Prop
  existenceRegularity : Prop
  regularitySourceData : Prop

structure BVPRegularityEvidence (P : BVPRegularityPackage) where
  boundaryConditionsClosed : P.boundaryConditions
  solutionSmoothnessClosed : P.solutionSmoothness
  existenceRegularityClosed : P.existenceRegularity
  regularitySourceDataClosed : P.regularitySourceData

def BVPRegularityClosed (P : BVPRegularityPackage) : Prop :=
  P.boundaryConditions ∧ P.solutionSmoothness ∧ P.existenceRegularity ∧ P.regularitySourceData

theorem bvp_regularity_closed_from_evidence (P : BVPRegularityPackage) (E : BVPRegularityEvidence P) : BVPRegularityClosed P := by
  exact And.intro E.boundaryConditionsClosed (And.intro E.solutionSmoothnessClosed (And.intro E.existenceRegularityClosed E.regularitySourceDataClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse