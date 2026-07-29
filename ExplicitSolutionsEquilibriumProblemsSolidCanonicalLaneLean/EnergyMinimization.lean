import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure EnergyMinimizationPackage where
  energyFunctional : Type u
  convexity : Prop
  lowerSemicontinuity : Prop
  existenceMinimizer : Prop
  uniquenessMinimizer : Prop

structure EnergyMinimizationEvidence (E : EnergyMinimizationPackage) where
  convexityClosed : E.convexity
  lowerSemicontinuityClosed : E.lowerSemicontinuity
  existenceMinimizerClosed : E.existenceMinimizer
  uniquenessMinimizerClosed : E.uniquenessMinimizer

def EnergyMinimizationClosed (E : EnergyMinimizationPackage) : Prop :=
  E.convexity ∧ E.lowerSemicontinuity ∧ E.existenceMinimizer ∧ E.uniquenessMinimizer

theorem energy_minimization_closed_from_evidence (E : EnergyMinimizationPackage) (Ev : EnergyMinimizationEvidence E) : EnergyMinimizationClosed E := by
  exact And.intro Ev.convexityClosed (And.intro Ev.lowerSemicontinuityClosed (And.intro Ev.existenceMinimizerClosed Ev.uniquenessMinimizerClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse