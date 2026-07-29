import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure ElasticStabilityAnalysisPackage where
  configurationSpace : Type u
  potentialEnergy : configurationSpace -> ℝ
  equilibriumPoint : configurationSpace
  stabilityCriterion : Prop
  criticalLoad : ℝ

structure ElasticStabilityAnalysisEvidence (E : ElasticStabilityAnalysisPackage) where
  stabilityCriterionClosed : E.stabilityCriterion
  criticalLoadPositive : E.criticalLoad > 0

def ElasticStabilityAnalysisClosed (E : ElasticStabilityAnalysisPackage) : Prop :=
  E.stabilityCriterion ∧ (E.criticalLoad > 0)

theorem elastic_stability_analysis_closed_from_evidence (E : ElasticStabilityAnalysisPackage)
    (Ev : ElasticStabilityAnalysisEvidence E) : ElasticStabilityAnalysisClosed E := by
  exact And.intro Ev.stabilityCriterionClosed Ev.criticalLoadPositive

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
