
from sqlfluff.core.rules.base import BaseRule, LintResult
from sqlfluff.core.rules.doc_decorators import document_configuration, document_groups
class Rule_MySqlFluffRules_L115(BaseRule):
    name = "custom.cursor_usage"
    aliases = ("custom-cursor-usage",)
    groups = ("all", "custom")
    crawl_behaviour = SegmentSeekerCrawler({"keyword"})

    def _eval(self, context: RuleContext) -> Optional[LintResult]:
        if context.segment.is_type("keyword") and context.segment.raw_upper == "CURSOR":
            return LintResult(
                anchor=context.segment,
                description="Usage of CURSOR is discouraged. Consider a set-based approach."
            )
        return None
