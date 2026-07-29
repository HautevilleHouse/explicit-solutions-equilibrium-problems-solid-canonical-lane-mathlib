import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure ContinuousGalerkinPackage where
  mesh : Type u
  basisFunctions : Type v
  stiffnessMatrix : Type w
  loadVector : Type x
  solutionVector : Type y
  bilinearFormCoercive : Prop
  linearFormBounded : Prop
  solutionExists : Prop
  solutionUnique : Prop

structure ContinuousGalerkinEvidence (C : ContinuousGalerkinPackage) where
  bilinearFormCoerciveClosed : C.bilinearFormCoercive
  linearFormBoundedClosed : C.linearFormBounded
  solutionExistsClosed : C.solutionExists
  solutionUniqueClosed : C.solutionUnique

def ContinuousGalerkinClosed (C : ContinuousGalerkinPackage) : Prop :=
  C.bilinearFormCoercive ∧ C.linearFormBounded ∧ C.solutionExists ∧ C.solutionUnique

theorem continuous_galerkin_closed_from_evidence (C : ContinuousGalerkinPackage) (E : ContinuousGalerkinEvidence C) : ContinuousGalerkinClosed C := by
  exact And.intro E.bilinearFormCoerciveClosed (And.intro E.linearFormBoundedClosed (And.intro E.solutionExistsClosed E.solutionUniqueClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
