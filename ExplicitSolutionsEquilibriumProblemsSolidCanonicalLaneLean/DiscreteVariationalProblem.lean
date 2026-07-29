import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure DiscreteMinimizationPackage where
  mesh : Type u
  energyFunctional : Type v
  discreteGradient : Type w
  stationaryCondition : Prop
  convexity : Prop
  optimalityConditionDerived : Prop
  equilibriumSolutionExists : Prop

structure DiscreteMinimizationEvidence (D : DiscreteMinimizationPackage) where
  stationaryConditionClosed : D.stationaryCondition
  convexityClosed : D.convexity
  optimalityConditionDerivedClosed : D.optimalityConditionDerived
  equilibriumSolutionExistsClosed : D.equilibriumSolutionExists

def DiscreteMinimizationClosed (D : DiscreteMinimizationPackage) : Prop :=
  D.stationaryCondition ∧ D.convexity ∧ D.optimalityConditionDerived ∧ D.equilibriumSolutionExists

theorem discrete_minimization_closed_from_evidence (D : DiscreteMinimizationPackage) (E : DiscreteMinimizationEvidence D) : DiscreteMinimizationClosed D := by
  exact And.intro E.stationaryConditionClosed (And.intro E.convexityClosed (And.intro E.optimalityConditionDerivedClosed E.equilibriumSolutionExistsClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
