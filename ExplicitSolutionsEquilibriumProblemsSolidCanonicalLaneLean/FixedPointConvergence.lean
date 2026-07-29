import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure FixedPointConvergencePackage where
  mappingSpace : Type u
  contractionMapping : mappingSpace -> mappingSpace
  fixedPointExistence : Prop
  convergenceRate : Prop

structure FixedPointConvergenceEvidence (F : FixedPointConvergencePackage) where
  fixedPointExistenceClosed : F.fixedPointExistence
  convergenceRateClosed : F.convergenceRate

def FixedPointConvergenceClosed (F : FixedPointConvergencePackage) : Prop :=
  F.fixedPointExistence ∧ F.convergenceRate

theorem fixed_point_convergence_closed_from_evidence (F : FixedPointConvergencePackage)
    (E : FixedPointConvergenceEvidence F) : FixedPointConvergenceClosed F := by
  exact And.intro E.fixedPointExistenceClosed E.convergenceRateClosed

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
