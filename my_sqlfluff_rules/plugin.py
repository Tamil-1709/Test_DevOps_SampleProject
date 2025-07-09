from sqlfluff.core.plugin import hookimpl
 
@hookimpl
def get_rules():
    from my_sqlfluff_rules.rules import Rule_MySqlFluffRules_L114,Rule_MySqlFluffRules_L115,Rule_MySqlFluffRules_L118
    return [Rule_MySqlFluffRules_L114,Rule_MySqlFluffRules_L115,Rule_MySqlFluffRules_L118]
