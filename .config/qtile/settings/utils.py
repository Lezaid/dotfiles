import string

class FmtCustom(string.Formatter):
    def convert_field(self, value, conversion):
        if conversion == "k":
            return str(value).capitalize()
        return super(FmtCustom, self).convert_field(value, conversion)

class StrCustom(str):
    def format(self, value):
        return FmtCustom().format(self, value)