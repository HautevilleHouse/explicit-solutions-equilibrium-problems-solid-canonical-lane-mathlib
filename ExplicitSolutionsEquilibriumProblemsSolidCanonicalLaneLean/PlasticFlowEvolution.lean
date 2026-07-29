import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure PlasticFlowPackage where
  yieldSurface : Type u
  plasticPotential : Type v
  hardeningLaw : Type w
  consistencyCondition : Prop
  flowRuleOrthogonality : Prop
  evolutionWellPosed : Prop
  explicitIncrementalSolution : Prop

structure PlasticFlowEvidence (P : PlasticFlowPackage) where
  consistencyConditionClosed : P.consistencyCondition
  flowRuleOrthogonalityClosed : P.flowRuleOrthogonality
  evolutionWellPosedClosed : P.evolutionWellPosed
  explicitIncrementalSolutionClosed : P.explicitIncrementalSolution

def PlasticFlowClosed (P : PlasticFlowPackage) : Prop :=
  P.consistencyCondition ∧ P.flowRuleOrthogonality ∧ P.evolutionWellPosed ∧ P.explicitIncrementalSolution

theorem plastic_flow_closed_from_evidence (P : PlasticFlowPackage) (E : PlasticFlowEvidence P) : PlasticFlowClosed P := by
  exact And.intro E.consistencyConditionClosed (And.intro E.flowRuleOrthogonalityClosed (And.intro E.evolutionWellPosedClosed E.explicitIncrementalSolutionClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
