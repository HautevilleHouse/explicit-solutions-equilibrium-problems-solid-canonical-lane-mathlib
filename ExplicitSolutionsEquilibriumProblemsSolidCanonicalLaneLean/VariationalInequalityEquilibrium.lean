import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure VariationalInequalityPackage where
  hilbertSpace : Type u
  convexSet : Type v
  bilinearForm : Type w
  linearFunctional : Type x
  coercivityCondition : Prop
  monotonicityCondition : Prop
  existenceSolution : Prop
  uniquenessSolution : Prop
  explicitSolutionForm : Prop

structure VariationalInequalityEvidence (V : VariationalInequalityPackage) where
  coercivityConditionClosed : V.coercivityCondition
  monotonicityConditionClosed : V.monotonicityCondition
  existenceSolutionClosed : V.existenceSolution
  uniquenessSolutionClosed : V.uniquenessSolution
  explicitSolutionFormClosed : V.explicitSolutionForm

def VariationalInequalityClosed (V : VariationalInequalityPackage) : Prop :=
  V.coercivityCondition ∧ V.monotonicityCondition ∧ V.existenceSolution ∧ V.uniquenessSolution ∧ V.explicitSolutionForm

theorem variational_inequality_closed_from_evidence (V : VariationalInequalityPackage) (E : VariationalInequalityEvidence V) : VariationalInequalityClosed V := by
  exact And.intro E.coercivityConditionClosed (And.intro E.monotonicityConditionClosed (And.intro E.existenceSolutionClosed (And.intro E.uniquenessSolutionClosed E.explicitSolutionFormClosed)))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
