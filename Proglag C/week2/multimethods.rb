=begin

General Idea
    - Allow multiple methods with the same name
    - Indicate which ones tak instacnes of which classes
    - Use dynamic dispatch on arguments in addition to receive
    to pick which methodis called
    
    if dynamic dispatch is essence of OOP, this is more OOP
        No need for awkward manual-dispatch

    Downside: Interaction with subclassing can produce situations where 
    there is "no clear winner" for which method to call

Multimethods a bad fit (?) for Ruby because:
        Ruby places no restrictions on waht is passed to a method
        Ruby never allows method with the same name
            Same name means overriding/replacing



=end