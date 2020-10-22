from modeltranslation.translator import translator, TranslationOptions
from .models import Student

class StudentTranslationOptions(TranslationOptions):
    fields = ("description",)

translator.register(Student, StudentTranslationOptions)
