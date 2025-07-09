from sqlfluff.core.plugin import hookimpl

@hookimpl
def get_rules():
    print("✅ plugin.py loaded!")  # 👈 Add this debug print
    from my_sqlfluff_rules.rules import Rule_MySqlFluffRules_L114, Rule_MySqlFluffRules_L115
    return [Rule_MySqlFluffRules_L114, Rule_MySqlFluffRules_L115]
