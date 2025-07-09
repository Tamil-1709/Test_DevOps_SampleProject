from sqlfluff.core.rules import BaseRule, LintResult, RuleContext
from sqlfluff.core.rules.crawlers import SegmentSeekerCrawler
from sqlfluff.core.parser import KeywordSegment
from typing import Optional
 
class Rule_MySqlFluffRules_L114(BaseRule):
    """Check for issues in SELECT clauses."""
   
    name = "custom.select_clause"
    aliases = ("custom-select-clause",)
    groups = ("all", "custom")
    crawl_behaviour = SegmentSeekerCrawler({"select_clause"})
   
    def _eval(self, context: RuleContext) -> Optional[LintResult]:
        if context.segment.is_type("select_clause"):
            return LintResult(
                anchor=context.segment,
                description="Custom rule violation found in SELECT clause"
            )
        return None
 
class Rule_MySqlFluffRules_L115(BaseRule):
    """Disallow use of CURSOR keyword in SQL scripts."""
 
    name = "custom.disallow_cursor"
    aliases = ("custom-disallow-cursor",)
    groups = ("all", "custom")
    crawl_behaviour = SegmentSeekerCrawler({"keyword"})
 
    def _eval(self, context: RuleContext) -> Optional[LintResult]:
        segment = context.segment
        if isinstance(segment, KeywordSegment) and segment.raw.lower() == "cursor":
            return LintResult(
                anchor=segment,
                description="Usage of CURSOR is discouraged. Consider a set-based approach"
            )
        return None
class Rule_MySqlFluffRules_L118(BaseRule):
    """Disallow use of NOT IN due to potential NULL handling issues."""
 
    name = "custom.disallow_not_in"
    aliases = ("custom-disallow-not-in",)
    groups = ("all", "custom", "performance")
    crawl_behaviour = SegmentSeekerCrawler({"expression", "comparison_expression", "not_in_predicate"})
 
    def _eval(self, context: RuleContext) -> Optional[LintResult]:
        # Print raw SQL for debug
        print(f"RAW SEGMENT: {context.segment.raw}")
 
        # Match simple NOT IN usage in the SQL code
        if "NOT IN" in context.segment.raw.upper():
            return LintResult(
                anchor=context.segment,
                description="Avoid using NOT IN. Use NOT EXISTS or LEFT JOIN with NULL check instead."
            )
        return None
