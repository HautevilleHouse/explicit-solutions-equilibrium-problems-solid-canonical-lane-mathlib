import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SemiAnalyticSolutionPackage {P : SolidEquilibriumVariationalPackage}
    (V : SolidEquilibriumVariationalEvidence P) where
  solutionSpace : Type u
  loadParameters : Type v
  geometryConstraints : Prop
  materialSymmetries : Prop
  seriesExpansionConverges : Prop
  closedFormExpression : Prop

structure SemiAnalyticSolutionEvidence {P : SolidEquilibriumVariationalPackage}
    {V : SolidEquilibriumVariationalEvidence P} (S : SemiAnalyticSolutionPackage V) where
  solutionSpaceClosed : S.solutionSpace
  loadParametersClosed : S.loadParameters
  geometryConstraintsClosed : S.geometryConstraints
  materialSymmetriesClosed : S.materialSymmetries
  seriesExpansionConvergesClosed : S.seriesExpansionConverges
  closedFormExpressionClosed : S.closedFormExpression

def SemiAnalyticSolutionClosed {P : SolidEquilibriumVariationalPackage}
    {V : SolidEquilibriumVariationalEvidence P} (S : SemiAnalyticSolutionPackage V) : Prop :=
  S.solutionSpace ∧ S.loadParameters ∧ S.geometryConstraints ∧
  S.materialSymmetries ∧ S.seriesExpansionConverges ∧ S.closedFormExpression

theorem semi_analytic_solution_closed_from_evidence
    {P : SolidEquilibriumVariationalPackage} {V : SolidEquilibriumVariationalEvidence P}
    (S : SemiAnalyticSolutionPackage V) (E : SemiAnalyticSolutionEvidence S) :
    SemiAnalyticSolutionClosed S := by
  exact And.intro E.solutionSpaceClosed
    (And.intro E.loadParametersClosed
      (And.intro E.geometryConstraintsClosed
        (And.intro E.materialSymmetriesClosed
          (And.intro E.seriesExpansionConvergesClosed E.closedFormExpressionClosed))))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
